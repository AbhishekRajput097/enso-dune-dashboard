WITH DelegateCalls AS (SELECT * FROM query_4640688),
token_transfers AS (
    SELECT 'ethereum' AS chain, 'ethereum' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='ethereum'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'ethereum'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'binance' AS chain, 'bnb' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='bnb'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'binance'
            ) OR
            "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'arbitrum' AS chain, 'arbitrum' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='arbitrum'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'arbitrum'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'optimism' AS chain, 'optimism' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='optimism'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'optimism'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'polygon' AS chain, 'polygon' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='polygon'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'polygon'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'gnosis' AS chain, 'gnosis' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='gnosis'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'gnosis'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003, 0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'base' AS chain, 'base' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='base'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'base'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'linea' AS chain, 'linea' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='linea'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'linea'
            ) OR
        "to" IN (0xA146d46823f3F594B785200102Be5385CAfCE9B5,0xdf4bb23FE9367F9f66247CE35f82ebB17785528C, 0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
        )
    UNION ALL
    SELECT 'zksync' AS chain, 'zksync' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='zksync'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'zksync'
            ) OR
        "to" IN (0x1BD8CefD703CF6b8fF886AD2E32653C32bc62b5C,0x62Ff58620B2b004c6AA51B050E5d73236DA538dB,0xd12ecDD67300D5ef0A68576CfDF038bAB5b5054a,0x5aBF780373563cD5ff16014fF99d08dBCFCbe411)
        )
    UNION ALL
    SELECT 'avalanche_c' AS chain, 'avalanche_c' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='avalanche_c'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'avalanche_c'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x80EbA3855878739F4710233A8a19d89Bdd2ffB8E,0x7d585B0e27BBb3D981b7757115EC11F47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56) 
        )
    UNION ALL
    SELECT 'unichain' AS chain, 'unichain' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='unichain'
            AND (
            t1.tx_hash IN (
                SELECT dc.tx_hash
                FROM DelegateCalls dc
                WHERE dc.chain = 'unichain'
            ) OR
        "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x80EbA3855878739F4710233A8a19d89Bdd2ffB8E,0x7d585B0e27BBb3D981b7757115EC11F47c476994)
        )
    UNION ALL
    SELECT 'berachain' AS chain, 'berachain' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='berachain'
            AND (
                t1.tx_hash IN (
                    SELECT dc.tx_hash
                    FROM DelegateCalls dc
                    WHERE dc.chain = 'berachain'
                ) OR
                "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x7d585b0e27bbb3d981b7757115ec11f47c476994,0xaf9B571e36543BE67FbcC979F6d52A2dbB2E2C56)
            )
    UNION ALL
    SELECT 'sonic' AS chain, 'sonic' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='sonic'
            AND (
                t1.tx_hash IN (
                    SELECT dc.tx_hash
                    FROM DelegateCalls dc
                    WHERE dc.chain = 'sonic'
                )
                OR "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x80EbA3855878739F4710233A8a19d89Bdd2ffB8E,0x7d585B0e27BBb3D981b7757115EC11F47c476994)
            )
    UNION ALL
    SELECT 'abstract' AS chain, 'abstract' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='abstract'
            AND (
                t1.tx_hash IN (
                    SELECT dc.tx_hash
                    FROM DelegateCalls dc
                    WHERE dc.chain = 'abstract'
                )
                OR "to" IN (0xF75584eF6673aD213a685a1B58Cc0330B8eA22Cf,0x4Fe93ebC4Ce6Ae4f81601cC7Ce7139023919E003,0x80EbA3855878739F4710233A8a19d89Bdd2ffB8E,0x7d585B0e27BBb3D981b7757115EC11F47c476994)
            )
    UNION ALL
    SELECT 'plume' AS chain, 'plume' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='plume'
            AND (
                t1.tx_hash IN (
                    SELECT dc.tx_hash
                    FROM DelegateCalls dc
                    WHERE dc.chain = 'plume'
                )
                OR "to" IN (0x3067BDBa0e6628497d527bEF511c22DA8b32cA3F,0xdC0f215C6E6cbb900AA00AFDeC299d88C15fF743)
            )
    UNION ALL
    SELECT 'katana' AS chain, 'katana' AS blockchain, unique_key, block_month, block_time, block_number, tx_hash, evt_index, trace_address, token_standard, tx_from, tx_to, tx_index, "from", "to", contract_address, symbol, amount_raw as "value", amount, price_usd as price, amount_usd as dollar_value
    FROM tokens.transfers t1
    WHERE
        t1.blockchain='katana'
            AND (
                t1.tx_hash IN (
                    SELECT dc.tx_hash
                    FROM DelegateCalls dc
                    WHERE dc.chain = 'katana'
                )
                OR "to" IN (0x3067BDBa0e6628497d527bEF511c22DA8b32cA3F,0xdC0f215C6E6cbb900AA00AFDeC299d88C15fF743)
            )
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
            WHEN dollar_value IS NOT NULL THEN dollar_value
            ELSE COALESCE(t.price, DAPTD.price) * t."value" / POWER(10.0, COALESCE(erc20.decimals, tl.decimals, 18))
        END AS dollar_value,
        t."value" / POWER(10.0, COALESCE(erc20.decimals, tl.decimals, 18)) AS token_amount,
        CASE 
            WHEN t.contract_address IN (SELECT contract_address FROM query_4832636) THEN NULL
            ELSE COALESCE(t.price, DAPTD.price)
        END AS token_price,
        t.tx_hash,
        t.block_time,
        t.block_number
    FROM token_transfers t
    LEFT JOIN tokens.erc20 erc20
        ON erc20.blockchain='ethereum' AND erc20.contract_address=t.contract_address
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
               -- ROW_NUMBER() assigns a unique sequential number to each row within each transaction
               -- This GUARANTEES exactly one row per tx_hash will have rn = 1
               ROW_NUMBER() OVER (
                   -- PARTITION BY tx_hash: Create separate ranking groups for each transaction
                   -- This means row numbering starts over at 1 for each unique tx_hash
                   PARTITION BY tx_hash 
                   
                   -- ORDER BY clause determines which row gets rn = 1 (the "winner")
                   -- Multiple criteria handle different scenarios:
                   ORDER BY 
                       -- 1. HIGHEST dollar_value wins (DESC = descending order)
                       --    NULLS LAST ensures NULL values are ranked after actual values
                       --    Case: tx has transfers of $100, $50, $25 → $100 transfer wins
                       --    Case: tx has transfers of $50, $50, $25 → ties broken by next criteria
                       --    Case: tx has NULL, NULL, $10 → $10 transfer wins
                       --    Case: tx has all NULLs → ties broken by next criteria
                       dollar_value DESC NULLS LAST, 
                       
                       -- 2. SMALLEST token_address wins (lexicographic ordering)
                       --    Case: Same dollar_value but different tokens → smaller address wins
                       --    Example: 0xa0b8... vs 0xb1c2... → 0xa0b8... wins
                       token_address,
                       
                       -- 3. SMALLEST "from" address wins
                       --    Case: Same token, same dollar_value, different senders
                       --    Example: Same USDC amount from 0x1234... vs 0x5678... → 0x1234... wins
                       "from",
                       
                       -- 4. SMALLEST "to" address wins
                       --    Case: Everything else identical, different recipients
                       --    Example: Same USDC, same sender, to 0x1111... vs 0x2222... → 0x1111... wins
                       "to"
                       
                       -- IMPORTANT: Even if ALL columns are 100% identical, ROW_NUMBER() will
                       -- still assign different numbers (1, 2, 3...) arbitrarily but deterministically
                       -- This handles the edge case of completely duplicate rows
               ) as rn
        FROM TransfersWithDollarValues
    ) ranked
    
    -- Only keep the "winner" from each transaction (the row that ranked #1)
    WHERE rn = 1
)

-- SCENARIOS THIS SOLUTION HANDLES:
-- ✅ Different dollar values: Keeps highest value transfer
-- ✅ Same dollar values, different tokens: Keeps transfer with smallest token address  
-- ✅ Same token, same dollar value, different from/to: Uses from/to as tie-breakers
-- ✅ All transfers have NULL dollar_value: Uses token_address, from, to as tie-breakers
-- ✅ Completely identical rows: Arbitrarily but deterministically picks one
-- ✅ Mixed NULL and non-NULL dollar values: Always prefers non-NULL values
-- ✅ Single transfer per transaction: Works normally (that transfer gets rn = 1)

-- GUARANTEE: Exactly 1 row per tx_hash in final result, no matter what the data looks like
SELECT 
       chain,
       symbol,
       decimals,
       token_address,
       "from",
       "to",
       CASE 
           WHEN chain <> 'berachain' AND (token_price >= 1e6 OR dollar_value >= 100e6) THEN NULL 
           WHEN dollar_value >= 200e6 THEN NULL -- 2025-06-17 remove tokens that still may be defi but with too abnormal values e.g. Concrete's ctBeraBaddiesWBERA
           ELSE dollar_value 
       END AS dollar_value,
       token_amount,
       CASE 
           WHEN chain <> 'berachain' AND (token_price >= 1e6 OR dollar_value >= 100e6) THEN NULL 
           WHEN dollar_value >= 200e6 THEN NULL -- 2025-06-17 remove tokens that still may be defi but with too abnormal values e.g. Concrete's ctBeraBaddiesWBERA
           ELSE token_price 
       END AS token_price,
       CASE 
           WHEN chain <> 'berachain' AND (token_price >= 1e6 OR dollar_value >= 100e6) THEN 'Exceeded 100M dollar value threshold'
           WHEN dollar_value >= 200e6 THEN 'Exceeded 200M dollar value threshold'
           ELSE NULL 
       END AS nullification_reason,
       tx_hash,
       block_time,
       block_number
FROM Final
WHERE NOT (symbol='USDe' and token_price>=2 and chain='berachain')
UNION ALL
SELECT    
    'hyperevm' as chain,
    CASE 
        WHEN cardinality(token_symbols)>1 THEN token_symbols[cardinality(token_symbols)]
        WHEN cardinality(token_symbols)=1 THEN token_symbols[1]
        ELSE NULL
    END AS symbol,
    NULL AS decimals,
    CASE 
        WHEN cardinality(token_addresses)>0 THEN TRY(from_hex(token_addresses[cardinality(token_addresses)]))
        ELSE NULL
    END AS token_address,
    TRY(from_hex(from_addresses[cardinality(from_addresses)])) AS "from",
    TRY(from_hex(to_addresses[cardinality(to_addresses)])) AS "to",
    dollar_value,
    CASE 
        WHEN cardinality(token_amounts)>0 THEN token_amounts[cardinality(token_amounts)]
        ELSE NULL
    END AS token_amount,
    CASE WHEN cardinality(token_prices)>0 THEN token_prices[cardinality(token_prices)] ELSE NULL END AS token_price,
    NULL AS nullification_reason,
    TRY(from_hex(tx_hash)) as tx_hash,
    block_time,
    block_number
FROM query_5623389