# Inter-Charity Blockchain Network on COSMOS.

## Create Genesis File

```bash
nsd init <node_name> --chain-id charitychain

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

```

## Validate Genesis File
```
nsd validate-genesis
```

## Run Node 
```
nsd start
```

Node is running on 0.0.0.0:26656

## Run REST server
```
nscli rest-server --chain-id charitychain --trust-node
```

Then you can construct and run the following queries:

```
# Get the sequence and account numbers for jack to construct the below requests
$ curl -s http://localhost:1317/auth/accounts/$(nscli keys show jack -a)
# > {"type":"auth/Account","value":{"address":"cosmos127qa40nmq56hu27ae263zvfk3ey0tkapwk0gq6","coins":[{"denom":"jackCoin","amount":"1000"},{"denom":"nametoken","amount":"1010"}],"public_key":{"type":"tendermint/PubKeySecp256k1","value":"A9YxyEbSWzLr+IdK/PuMUYmYToKYQ3P/pM8SI1Bxx3wu"},"account_number":"0","sequence":"1"}}

# Get the sequence and account numbers for alice to construct the below requests
$ curl -s http://localhost:1317/auth/accounts/$(nscli keys show alice -a)
# > {"type":"auth/Account","value":{"address":"cosmos1h7ztnf2zkf4558hdxv5kpemdrg3tf94hnpvgsl","coins":[{"denom":"aliceCoin","amount":"1000"},{"denom":"nametoken","amount":"980"}],"public_key":{"type":"tendermint/PubKeySecp256k1","value":"Avc7qwecLHz5qb1EKDuSTLJfVOjBQezk0KSPDNybLONJ"},"account_number":"1","sequence":"2"}}
```
