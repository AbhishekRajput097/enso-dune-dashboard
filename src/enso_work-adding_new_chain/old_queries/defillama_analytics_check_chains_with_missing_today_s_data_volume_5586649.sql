WITH chain_data AS (
  -- Ethereum
  SELECT 
    'ethereum' as chain,
    'https://dune.com/queries/5579328' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_ethereum
  
  UNION ALL
  
  -- BNB
  SELECT 
    'bnb' as chain,
    'https://dune.com/queries/5579326' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_bnb
  
  UNION ALL
  
  -- Optimism
  SELECT 
    'optimism' as chain,
    'https://dune.com/queries/5579324' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_optimism
  
  UNION ALL
  
  -- Polygon
  SELECT 
    'polygon' as chain,
    'https://dune.com/queries/5579324' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_polygon
  
  UNION ALL
  
  -- Gnosis
  SELECT 
    'gnosis' as chain,
    'https://dune.com/queries/5579317' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_gnosis
  
  UNION ALL
  
  -- Arbitrum
  SELECT 
    'arbitrum' as chain,
    'https://dune.com/queries/5579325' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_arbitrum

   UNION ALL
  
  -- Base
  SELECT 
    'base' as chain,
    'https://dune.com/queries/5579316' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_base
  
  UNION ALL
  
  -- Linea
  SELECT 
    'linea' as chain,
    'https://dune.com/queries/5579314' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_linea
  
  UNION ALL
  
  -- ZkSync
  SELECT 
    'zksync' as chain,
    'https://dune.com/queries/5579313' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_zksync
  
  UNION ALL
  
  -- Avalanche C
  SELECT 
    'avalanche_c' as chain,
    'https://dune.com/queries/5579312' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_avalanche_c
  
  UNION ALL
  
  -- Unichain
  SELECT 
    'unichain' as chain,
    'https://dune.com/queries/5579311' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_unichain
  
  UNION ALL
  
  -- Berachain
  SELECT 
    'berachain' as chain,
    'https://dune.com/queries/5579309' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_berachain
  
  UNION ALL
  
  -- Sonic
  SELECT 
    'sonic' as chain,
    'https://dune.com/queries/5579306' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_sonic
  
  UNION ALL
  
  -- Abstract
  SELECT 
    'abstract' as chain,
    'https://dune.com/queries/5579307' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_abstract
  
  UNION ALL
  
  -- Plume
  SELECT 
    'plume' as chain,
    'https://dune.com/queries/5579339' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_plume
  
  UNION ALL
  
  -- Katana
  SELECT 
    'katana' as chain,
    'https://dune.com/queries/5579340' as query_link,
    MAX(DATE(block_time)) as last_data_date,
    CASE WHEN MAX(DATE(block_time)) >= CURRENT_DATE - INTERVAL '1' DAY THEN true ELSE false END as has_current_data
  FROM dune.enso_finance.result_defillama_analytics_fetch_all_erc_20_in_tx_hash_katana
)

SELECT 
  chain,
  has_current_data,
  last_data_date,
  CASE 
    WHEN has_current_data = false THEN 
      concat('<a href="', query_link, '" target="_blank">Run Query</a>')
    ELSE 
      'Data is current'
  END as action_link
FROM chain_data
WHERE has_current_data=False
ORDER BY 
  has_current_data ASC,  -- Show chains without current data first
  chain ASC;
  