package model

type OrderForm struct {
	Id            string //订单号
	UserId        string
	CommodityId   string  //商品id
	CreateTime    string  //生成订单得时间
	DeliverTime   string  //发货时间
	AllPrice      float64 //总余额
	SellerPutaway string  //卖家
	State         int     //状态 0待支付，1已支付，2已发货,3取消订单，4订单已完成（货物已签收），5退款
	Client        string
	OneBook       *Book
	InfoP         *Info
	Cart          *Cart
	HomeOrder     string //主订单
}
type AllFormMax struct {
	Id         string
	OrderFormS []*OrderForm
	AllCartS   *AllCartS
	InfoP      *Info
	PlayId     string
}
