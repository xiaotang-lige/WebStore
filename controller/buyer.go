package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"net/http"
)

func Buyer(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	t := template.Must(template.ParseFiles("views/users/buyer.html"))
	if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 0 {
		var orderFromS []*model.OrderForm
		if dao.QueryUserId(cookie.Value) != nil {
			orderFromS = dao.BuyerS(cookie.Value)
			buyer := &model.Buyer{
				BuyerName: dao.QueryUserId(cookie.Value).UserName,
				OrderForm: orderFromS,
				InfoP:     &model.Info{S: NavServer(r)},
			}
			t.Execute(w, buyer)
		} else {
			MyErr(w, r, "出错了..", "/")
		}

	}
	if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 1 {
		var orderFromS []*model.OrderForm
		if dao.QueryUserId(cookie.Value) != nil {
			orderFromS = dao.BuyerS(cookie.Value)
			buyer := &model.Buyer{
				BuyerName: dao.QueryUserId(cookie.Value).UserName,
				OrderForm: orderFromS,
				InfoP:     &model.Info{S: NavServer(r)},
			}
			t.Execute(w, buyer)
		} else {
			MyErr(w, r, "出错了..", "/")
		}

	}
}
