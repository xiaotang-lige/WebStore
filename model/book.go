package model

type Book struct {
	Id            string
	Title         string  //标题
	Author        string  // 作者
	Price         float64 //价格
	Sales         int     //销量
	Stock         int     //库存
	ImgPath       string
	SellerPutaway string //商家上架
	InfoP         *Info
	BookState     string
}
