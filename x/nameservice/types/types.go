package types

import (
	"fmt"
	"strings"
	"time"

	sdk "github.com/cosmos/cosmos-sdk/types"
)

// Initial Starting Price for a name that was never previously owned
var MinNamePrice = sdk.Coins{sdk.NewInt64Coin("crt", 1)}

// Whois is a struct that contains all the metadata of a name
type Whois struct {
	Value string         `json:"value"`
	Owner sdk.AccAddress `json:"owner"`
	Price sdk.Coins      `json:"price"`
}

// Returns a new Whois with the minprice as the price
func NewWhois() Whois {
	return Whois{
		Price: MinNamePrice,
	}
}

// implement fmt.Stringer
func (w Whois) String() string {
	return strings.TrimSpace(fmt.Sprintf(`Owner: %s
Value: %s
Price: %s`, w.Owner, w.Value, w.Price))
}

type Transaction struct {
	Timestamp time.Time         `json:"timestamp"`
	Amount    sdk.Coins      `json:"amount"`
	From      sdk.AccAddress `json:"from"`
	To        sdk.AccAddress `json:"to"`
}

func NewTransaction(from sdk.AccAddress, to sdk.AccAddress, amount sdk.Coins) Transaction {
	return Transaction{
		From: from,
		To: to,
		Amount: amount,
		Timestamp: time.Now(),
	}
}

type Volunteer struct {
	Account      sdk.AccAddress `json:"account"`
	Transactions []*Transaction `json:"transactions"`
}

func NewVolunteer(account sdk.AccAddress) Volunteer {
	return Volunteer{
		Account: account,
		Transactions: make([]*Transaction, 0),
	}
}

func (w Volunteer) String() string {
	return strings.TrimSpace(fmt.Sprintf(`Name: %s
Account: %s`, w.Account, w.Transactions))
}
