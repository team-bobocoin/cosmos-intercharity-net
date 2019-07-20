#!/bin/bash

curl -X POST -s http://localhost:1317/bank/accounts/cosmos1nx982k7n0tcuy06gzyhse3sj9c2yshp9aawanp/transfers --data-binary '{ "base_req": { "from": "'$(cscli keys show jack -a)'", "memo": "Sent via Cosmos Voyager 🚀", "chain_id": "charitychain", "account_number": "0", "sequence": "1", "gas": "200000", "gas_adjustment": "1.2", "fees": [ { "denom": "crt", "amount": "10" } ], "simulate": false }, "amount": [ { "denom": "crt", "amount": "100" } ] }' > unsignedTx.json

cscli tx sign unsignedTx.json --from jack --offline --chain-id charitychain --sequence 1 --account-number 0 > signedTx.json

cscli tx broadcast signedTx.json