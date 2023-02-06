package model

type Seller struct {
	SellerId    string
	BuyerForm   string //买家订单
	PutawayForm string //上架名单
	MakeForm    string //成交单
	SellerName  string //店铺名字
	BuyerFormS  []*OrderForm
	InfoP       *Info
}
