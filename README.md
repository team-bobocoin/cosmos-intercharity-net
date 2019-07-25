# Inter-Charity Blockchain Network on COSMOS.

## Install Daemon and CLI

```bash
make install
```

## Create Genesis File

```bash
csd init <node_name> --chain-id charitychain

cscli keys add jack

cscli keys add alice

csd add-genesis-account $(cscli keys show jack -a) 1000crt,100000000stake
csd add-genesis-account $(cscli keys show alice -a) 1000crt,100000000stake

cscli config chain-id charitychain
cscli config output json
cscli config indent true
cscli config trust-node true

csd gentx --name jack <or your key_name>

csd collect-gentxs

```

## Validate Genesis File
```
csd validate-genesis
```

## Run Node 
```
csd start
```

Node is running on 0.0.0.0:26656

## Run REST server
```
cscli rest-server --chain-id charitychain --laddr=tcp://0.0.0.0:1317 --trust-node true
```

Then you can construct and run the following queries:

```
# Get the sequence and account numbers for jack to construct the below requests
$ curl -s http://localhost:1317/auth/accounts/$(cscli keys show jack -a)

# > {"type":"auth/Account","value":{"address":"cosmos127qa40nmq56hu27ae263zvfk3ey0tkapwk0gq6","coins":[{"denom":"jackCoin","amount":"1000"},{"denom":"nametoken","amount":"1010"}],"public_key":{"type":"tendermint/PubKeySecp256k1","value":"A9YxyEbSWzLr+IdK/PuMUYmYToKYQ3P/pM8SI1Bxx3wu"},"account_number":"0","sequence":"1"}}


# Get the sequence and account numbers for alice to construct the below requests
$ curl -s http://localhost:1317/auth/accounts/$(cscli keys show alice -a)

# > {"type":"auth/Account","value":{"address":"cosmos1h7ztnf2zkf4558hdxv5kpemdrg3tf94hnpvgsl","coins":[{"denom":"aliceCoin","amount":"1000"},{"denom":"nametoken","amount":"980"}],"public_key":{"type":"tendermint/PubKeySecp256k1","value":"Avc7qwecLHz5qb1EKDuSTLJfVOjBQezk0KSPDNybLONJ"},"account_number":"1","sequence":"2"}}
```

## Run CharityChain for bobo Application

If you want to run CharityChain for [bobo Charity Application](https://github.com/team-bobocoin/bobo), you can use preliminarily written scripts.

```
make install

./genesis.sh        # create genesis file and sample accounts

csd start

cscli rest-server --chain-id charitychain --laddr=tcp://0.0.0.0:1317 --trust-node true

./master_account.sh     # create master account
```
