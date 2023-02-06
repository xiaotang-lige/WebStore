package model

type Play struct {
	Id    string
	State int
	Bool  bool
	InfoP *Info
}
type PlayFormS struct {
	Id          string
	UserId      string
	OrderFormId []string
	AllMoney    float64
	AllAmount   float64
	State       int //未支付1，已支付2，取消订单3，完成订单4
}
