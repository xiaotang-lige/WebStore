package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"net/http"
)

// Seller 卖家首页
func Seller(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	//卖家订单
	if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 1 {
		if seller := dao.QuerySellerInfo(cookie.Value); seller != nil {
			orders := dao.QuerySellerBuyerFormS(seller.SellerName)
			sellerS := &model.Seller{
				SellerId:    "",
				BuyerForm:   "",
				PutawayForm: "",
				MakeForm:    "",
				SellerName:  "",
				BuyerFormS:  orders,
				//显示卖家的导航栏
				InfoP: &model.Info{
					S: NavServer(r),
				},
			}
			t := template.Must(template.ParseFiles("views/users/seller.html"))
			t.Execute(w, sellerS)
		}

	} else if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 0 {
		//个人订单
	} else {
		MyErr(w, r, "请商户登录！", "/login")
	}
}
