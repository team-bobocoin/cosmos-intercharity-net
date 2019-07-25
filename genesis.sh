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


