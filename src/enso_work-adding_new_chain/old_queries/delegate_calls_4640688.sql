SELECT 'ethereum' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM ethereum.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'binance' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM bnb.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'arbitrum' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM arbitrum.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'optimism' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM optimism.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'polygon' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM polygon.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'gnosis' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM gnosis.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'base' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM base.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'linea' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM linea.traces
    WHERE (success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52) OR (success = true AND "to" = 0xEe41aB55411a957c43C469F74867fa4671F9f017)
)
UNION ALL
SELECT 'zksync' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM zksync.traces
    WHERE (success = true AND "to" = 0x43BD12326142568D5Cc33c7326A68Ca4e0be9292) OR (success = true AND "to" = 0x4c3Db0fFf66f98d84429Bf60E7622e206Fc4947c)
)
UNION ALL
SELECT 'avalanche_c' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM avalanche_c.traces
    WHERE (success = true AND "to" = 0x43BD12326142568D5Cc33c7326A68Ca4e0be9292) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'sonic' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM sonic.traces
    WHERE (success = true AND "to" = 0x43BD12326142568D5Cc33c7326A68Ca4e0be9292) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'unichain' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM unichain.traces
    WHERE (success = true AND "to" = 0x43BD12326142568D5Cc33c7326A68Ca4e0be9292) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'berachain' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM berachain.traces
    WHERE (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08) OR (success = true AND "to" = 0x7663fd40081dcCd47805c00e613B6beAc3B87F08)
)
UNION ALL
SELECT 'plume' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM plume.traces
    WHERE (success = true AND "to" = 0x973e7203f1B7fbcc156b4BD8734fc66790e689C5) OR (success = true AND "to" = 0x973e7203f1B7fbcc156b4BD8734fc66790e689C5)
)
UNION ALL
SELECT 'katana' as chain, tx_hash
FROM (SELECT DISTINCT tx_hash FROM katana.traces
    WHERE (success = true AND "to" = 0x973e7203f1B7fbcc156b4BD8734fc66790e689C5) OR (success = true AND "to" = 0x973e7203f1B7fbcc156b4BD8734fc66790e689C5)
)
--UNION ALL
--SELECT 'berachain' as chain, tx_hash
--FROM (SELECT DISTINCT tx_hash FROM berachain.traces
--    WHERE success = true AND "to" = 0x38147794FF247e5Fc179eDbAE6C37fff88f68C52
--)