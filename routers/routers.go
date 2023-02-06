package routers

import (
	"bookStore/controller"
	"bookStore/web"
	"net/http"
)

func init() {
	http.Handle("/css/", http.StripPrefix("/css", http.FileServer(http.Dir("views/css"))))
	http.Handle("/depot/", http.StripPrefix("/depot", http.FileServer(http.Dir("views/depot"))))
	http.HandleFunc("/", controller.Home)
	http.HandleFunc("/login", controller.Login)         //登录
	http.HandleFunc("/loginTest", controller.LoginMini) //登录
	http.HandleFunc("/register", controller.Register)   //注册
	http.HandleFunc("/LoginOut", controller.LoginOut)   //注销
	http.HandleFunc("/details", controller.Details)     //商品详情
	http.HandleFunc("/putaway", controller.Putaway)     //卖家上架
	http.HandleFunc("/order", controller.Order)         //订单
	http.HandleFunc("/err", controller.MyErr1)
	http.HandleFunc("/seller", controller.Seller)
	http.HandleFunc("/registerSeller", controller.RegisterSeller)   //卖家注册
	http.HandleFunc("/deliverGoods", controller.SellerDeliverGoods) //发货状态
	http.HandleFunc("/buyer", controller.Buyer)                     //我的首页
	http.HandleFunc("/play", controller.Play)
	http.HandleFunc("/playmini", controller.PlayMini)
	http.HandleFunc("/verify", controller.Verify)
	http.HandleFunc("/cart", controller.Cart) //购物车
	http.HandleFunc("/addCart", controller.AddCart)
	http.HandleFunc("/playHome", controller.PlayHome)
	http.HandleFunc("/test", web.Test)
	http.ListenAndServe(":8081", nil)
}
