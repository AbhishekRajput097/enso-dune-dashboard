WITH wallets AS (
    SELECT * FROM (
        VALUES
        (0x69AFa05352B3797b8D08cE3B5EDf27eb0585D560, 'avalanche_c'),
        (0xA9Fee8f645224c1fE41d6206e28De2742320789f, 'bnb'),
        (0xA9Fee8f645224c1fE41d6206e28De2742320789f, 'linea'),
        (0xA9Fee8f645224c1fE41d6206e28De2742320789f, 'polygon'),
        (0xAb27dB9E0105AF3d9717b0CcEf11e2CC65515609, 'ethereum'),
        (0x69AFa05352B3797b8D08cE3B5EDf27eb0585D560, 'optimism'),
        (0x7508A8b7887ef6ced89f1F0DCE09bb52707510F7, 'gnosis'),
        (0xA9Fee8f645224c1fE41d6206e28De2742320789f, 'arbitrum'),
        (0x69AFa05352B3797b8D08cE3B5EDf27eb0585D560, 'base'),
        (0xA67B61399B8b817e763f05dEF4694F22f1bDCC7d, 'sonic'),
        (0xA67B61399B8b817e763f05dEF4694F22f1bDCC7d, 'berachain'),
        (0x49DD42856955fD9e7E17abEf8B4B6acE67478E6d, 'zksync'),
        (0x6AA68C46eD86161eB318b1396F7b79E386e88676, 'plume')
    ) AS t(address, chain)
),
token_transfers AS (
    -- Original transfers TO wallets
    SELECT 
        t1.blockchain as chain, 
        t1.blockchain as blockchain, 
        unique_key, 
        block_month, 
        block_time, 
        block_number, 
        tx_hash, 
        evt_index, 
        trace_address, 
        token_standard, 
        tx_from, 
        tx_to, 
        tx_index, 
        "from", 
        "to", 
        contract_address, 
        symbol, 
        amount_raw as "value", 
        amount, 
        price_usd as price, 
        amount_usd as dollar_value,
        1.0 as split_multiplier  -- No split for original transfers
    FROM tokens.transfers t1
    LEFT JOIN query_5263443 s -- fee splitter addresses
            ON t1."from" = s.wallet 
            AND LOWER(t1.blockchain) = LOWER(s.chain)
    WHERE 
        (
            "to" IN (SELECT DISTINCT address FROM wallets) 
            OR tx_to IN (SELECT DISTINCT address FROM wallets)
        )
    AND "from" NOT IN (SELECT DISTINCT address FROM wallets)
    -- Exclude transfers FROM fee splitters TO enso addresses marked with split=0.0
    AND NOT (
        t1."from" IN (SELECT wallet FROM query_5263443 WHERE chain = t1.blockchain)
        AND t1."to" IN (SELECT wallet FROM query_5263443 WHERE chain = t1.blockchain AND split = 0.0)
    )
    
    UNION ALL

    SELECT * FROM dune.enso_finance.result_defillama_analytics_transfers_with_dollar_values_from_fees_addresses_fee_splitters
),
defillama_api_token_data AS (
    SELECT
        chain,
        token_address,
        symbol,
        address_explorer,
        num_rows,
        latest_price as price,
        price_source,
        confidence_level
    FROM dune.enso_finance.result_fetch_missing_prices_with_defillama_and_enso_price_api p
),
TransfersWithDollarValues AS (
    SELECT DISTINCT 
        t.chain,
        COALESCE(t.symbol, DAPTD.symbol, tl.symbol, erc20.symbol) as symbol,
        COALESCE(erc20.decimals, tl.decimals, 18) as decimals,
        t.contract_address AS token_address,
        t."from",
        t."to",
        CASE 
            WHEN t.contract_address IN (SELECT contract_address FROM query_4832636) THEN NULL
            WHEN dollar_value IS NOT NULL THEN dollar_value * t.split_multiplier
            ELSE COALESCE(t.price, DAPTD.price) * t."value" / POWER(10.0, COALESCE(erc20.decimals, tl.decimals, 18)) * t.split_multiplier
        END AS dollar_value,
        (t."value" / POWER(10.0, COALESCE(erc20.decimals, tl.decimals, 18))) * t.split_multiplier AS token_amount,
        CASE 
            WHEN t.contract_address IN (SELECT contract_address FROM query_4832636) THEN NULL
            ELSE COALESCE(t.price, DAPTD.price)
        END AS token_price,
        t.split_multiplier,
        t.tx_hash,
        t.block_time,
        t.block_number
    FROM token_transfers t
    LEFT JOIN tokens.erc20 erc20
        ON erc20.blockchain=t.blockchain AND erc20.contract_address=t.contract_address
    LEFT JOIN defillama_api_token_data DAPTD 
        ON DAPTD.chain = t.chain 
        AND DAPTD.token_address = t.contract_address
    LEFT JOIN dune.enso_finance.result_template_defi_token_lookup tl
        ON LOWER(tl.chain_name) = LOWER(t.chain)
        AND tl.address = t.contract_address
),
Final AS (
    SELECT *
    FROM (
        SELECT *,
               ROW_NUMBER() OVER (
                   PARTITION BY tx_hash 
                   ORDER BY 
                       dollar_value DESC NULLS LAST, 
                       token_address,
                       "from",
                       "to"
               ) as rn
        FROM TransfersWithDollarValues
    ) ranked
    WHERE rn = 1
)

SELECT 
        chain,
        symbol,
        decimals,
        token_address,
        "from",
        "to",
        CASE 
            WHEN chain <> 'berachain' AND (token_price >= 1e6 OR dollar_value >= 100e6) THEN NULL 
            ELSE dollar_value 
        END AS dollar_value,
        token_amount,
        CASE 
            WHEN chain <> 'berachain' AND (token_price >= 1e6 OR dollar_value >= 100e6) THEN NULL 
            ELSE token_price 
        END AS token_price,
        CASE 
            WHEN chain <> 'berachain' AND (token_price >= 1e6 OR dollar_value >= 100e6) THEN 'Exceeded 100M dollar value threshold'
            ELSE NULL 
        END AS nullification_reason,
        split_multiplier,
        tx_hash,
        block_time,
        block_number
FROM Final
ORDER BY block_time DESC