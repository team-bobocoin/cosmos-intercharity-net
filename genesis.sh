#!/bin/bash

## get node_name as first input parameter
read -p "enter node_name: " node_name
csd init ${node_name} --chain-id charitychain

cscli keys add jack

cscli keys add alice

csd add-genesis-account $(cscli keys show jack -a) 10000crt,100000000stake
csd add-genesis-account $(cscli keys show alice -a) 10000crt,100000000stake

cscli config chain-id charitychain
cscli config output json
cscli config indent true
cscli config trust-node true

csd gentx --name jack

csd collect-gentxs

csd validate-genesis

curl -X POST -s http://localhost:1317/bank/accounts/cosmos1l8a598tmyx8u8y7yztkacl5n7jvkdx46rs3vkt/transfers --data-binary '{ "base_req": { "from": "'$(nscli keys show jack -a)'", "memo": "Sent via Cosmos Voyager 🚀", "chain_id": "charitychain", "account_number": "0", "sequence": "0", "gas": "200000", "gas_adjustment": "1.2", "fees": [ { "denom": "crt", "amount": "10" } ], "simulate": false }, "amount": [ { "denom": "crt", "amount": "100" } ] }' > unsignedTx.json
