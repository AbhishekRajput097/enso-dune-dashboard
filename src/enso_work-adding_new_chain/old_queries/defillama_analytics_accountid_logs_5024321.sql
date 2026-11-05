WITH account_ids_prepared AS (
    SELECT TRY(from_hex(REPLACE(CAST(accountIdEncoded AS varchar), '0x', ''))) as varbinary_encoded_id, issuedFor as email, NULL AS Transactions, id, cast(NULL as varchar) AS encodedid
    FROM dune.enso_finance.dataset_account_ids
),
combined_logs AS (
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN ethereum.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'ethereum' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN bnb.logs l ON l.tx_hash = t.tx_hash
    WHERE (t.chain = 'binance' or t.chain='bnb') AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN arbitrum.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'arbitrum' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN optimism.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'optimism' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN polygon.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'polygon' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN gnosis.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'gnosis' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN base.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'base' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN linea.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'linea' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN zksync.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'zksync' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN avalanche_c.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'avalanche_c' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN berachain.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'berachain' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249
    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN unichain.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'unichain' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249

    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN sonic.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'sonic' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249

    
    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN plume.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'plume' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249

    UNION ALL
    
    SELECT t.chain, t.tx_hash, l.block_time, l.block_number, l.contract_address, l.topic0, l.data, 
           LOWER(TO_HEX(varbinary_substring(l.data, 1, 32))) AS accountId, 
           LOWER(TO_HEX(varbinary_substring(l.data, 33, 32))) AS requestId,
           LOWER(TO_HEX(varbinary_substring(l.data, 49, 16)))  AS referralCode
    FROM dune.enso_finance.result_ethereum_token_transfers_with_prices t
    JOIN katana.logs l ON l.tx_hash = t.tx_hash
    WHERE t.chain = 'katana' AND l.topic0 = 0x049d8dd84b6a6cc45d5f68a74b23450bd3e54d84fd405d91b8b286c78d51d249

),
deduplicated_logs AS (
    SELECT cl.*, 
           -- Check if this accountId has a match in account_ids_prepared
           CASE WHEN a.varbinary_encoded_id IS NOT NULL THEN 1 ELSE 0 END as has_account_match,
           ROW_NUMBER() OVER (
                PARTITION BY cl.chain, cl.tx_hash
                ORDER BY 
                    -- First priority: rows that match account_ids_prepared
                    CASE WHEN a.varbinary_encoded_id IS NOT NULL THEN 0 ELSE 1 END,
                    -- Second priority: non-zero/non-empty accountIds
                    CASE WHEN cl.accountId IS NOT NULL 
                              AND cl.accountId <> '0' 
                              AND cl.accountId <> ''
                              AND NOT regexp_like(cl.accountId, '^0+$')  -- Not all zeros
                         THEN 0 ELSE 1 END,
                    -- Third priority: longest accountId (for valid values)
                    CASE WHEN cl.accountId IS NOT NULL 
                              AND cl.accountId <> '0' 
                              AND cl.accountId <> ''
                              AND NOT regexp_like(cl.accountId, '^0+$')
                         THEN LENGTH(cl.accountId) ELSE 0 END DESC,
                    -- Fourth priority: non-null requestId
                    CASE WHEN cl.requestId IS NOT NULL THEN 0 ELSE 1 END,
                    -- Final tiebreaker: latest block_time
                    cl.block_time DESC
            ) AS row_num
    FROM combined_logs cl
    LEFT JOIN account_ids_prepared a ON a.varbinary_encoded_id = TRY(from_hex(cl.accountId)) 
                                     AND cl.accountId IS NOT NULL 
                                     AND cl.accountId <> '0' 
                                     AND cl.accountId <> ''
                                     AND NOT regexp_like(cl.accountId, '^0+$')
)
SELECT e.chain, e.tx_hash, e.block_time, e.block_number, e.contract_address, e.topic0, e.data, 
       e.accountId, concat('0x', e.accountId) as accountid0x, e.requestId, concat('0x', e.requestId) as requestId0x, 
       CASE 
           WHEN LENGTH(RTRIM(e.referralCode, '0')) > 0 THEN
               CASE 
                   WHEN TRY(from_utf8(from_hex(RTRIM(e.referralCode, '0')))) IS NOT NULL
                   AND REGEXP_LIKE(TRY(from_utf8(from_hex(RTRIM(e.referralCode, '0')))), '^[A-Za-z0-9]+$')
                   THEN TRY(from_utf8(from_hex(RTRIM(e.referralCode, '0'))))
                   ELSE NULL 
               END
           ELSE NULL 
       END AS referralCode,
       a.id AS user_id, a.email
FROM deduplicated_logs e
LEFT JOIN account_ids_prepared a ON a.varbinary_encoded_id = TRY(from_hex(e.accountId)) AND e.accountId IS NOT NULL
WHERE e.row_num = 1
ORDER BY e.chain, e.block_time;