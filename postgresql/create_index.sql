-- create index concurrently idx_block_number on token_transfers (block_number);
create index concurrently idx_transaction_hash on token_transfers (transaction_hash)