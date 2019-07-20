package types

import (
	"github.com/cosmos/cosmos-sdk/codec"
)

var ModuleCdc = codec.New()

func init() {
	RegisterCodec(ModuleCdc)
}

// RegisterCodec registers concrete types on the Amino codec
func RegisterCodec(cdc *codec.Codec) {
	cdc.RegisterConcrete(MsgSetName{}, "charityservice/SetName", nil)
	cdc.RegisterConcrete(MsgBuyName{}, "charityservice/BuyName", nil)
	cdc.RegisterConcrete(MsgFaucet{}, "charityservice/Faucet", nil)
}
