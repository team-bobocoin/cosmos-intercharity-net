#!/bin/bash

## get node_name as first input parameter
read -p "enter node_name: " node_name
nsd init ${node_name} --chain-id charitychain

nscli keys add jack

nscli keys add alice

nsd add-genesis-account $(nscli keys show jack -a) 1000crt,100000000stake
nsd add-genesis-account $(nscli keys show alice -a) 1000crt,100000000stake

nscli config chain-id charitychain
nscli config output json
nscli config indent true
nscli config trust-node true

nsd gentx --name jack <or your key_name>

nsd collect-gentxs
