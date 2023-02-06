package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"log"
	"net/http"
	"strconv"
	"time"
)

// SellerDeliverGoods 卖家发货
func SellerDeliverGoods(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	orderId := r.FormValue("orderId")
	order := dao.QueryOrder(orderId)
	if dao.QueryUserId(cookie.Value).SellerName == order.SellerPutaway {
		if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 1 && order.State == 0 {
			MyErr(w, r, "客户未支付！", "/seller")
		} else if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 1 && order.State == 1 {
			dao.UpdateOrderState(orderId, 2)
			MyErr(w, r, "发货成功！", "/seller")
		} else if dao.OnlineSession(r) == 1 && dao.QueryUserId(cookie.Value).Position == 1 && order.State == 2 {
			MyErr(w, r, "已发货，请勿重复发货！", "/seller")
		} else {
			MyErr(w, r, "出错了", "/seller")
		}
	} else {
		MyErr(w, r, "出错了", "/seller")
	}

}
func PlayMini(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	orderId := r.FormValue("orderId")
	state, err := strconv.Atoi(r.FormValue("state"))
	order := dao.QueryOrder(orderId)
	if err != nil {
		log.Println(err)
	}
	if dao.OnlineSession(r) == 1 && cookie.Value == order.UserId {
		var s string
		switch state {
		case 3:
			{
				dao.UpdateOrderState(orderId, 3)
				s = "订单取消成功！"
			}
		case 4:
			{
				book := dao.GetBook(order.CommodityId)
				book.Sales = book.Sales + 1
				book.Stock = book.Stock - 1
				if err := dao.UpdateBook(book); err != nil {
					log.Println(err)
				}
				dao.UpdateOrderState(orderId, 4)
				s = "货物签收完成！"
			}
		case 5:
			{
				dao.UpdateOrderState(orderId, 5)
				s = "款项稍后到账，订单取消完成！"
			}
		}
		MyErr(w, r, s, "/buyer")
	} else {
		MyErr(w, r, "系统错误...", "/")
	}
}
func Play(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	order := r.FormValue("orderId")
	play := &model.Play{
		Id:    "",
		State: 0,
		Bool:  false,
		InfoP: &model.Info{S: NavServer(r)},
	}
	t := template.Must(template.ParseFiles("views/users/pay.html"))
	if dao.OnlineSession(r) == 1 && cookie.Value == dao.QueryOrder(order).UserId && dao.QueryOrder(order).State == 0 {
		dao.UpdateOrderState(order, 1)
		play.Bool = true
		t.Execute(w, play)
	} else {
		MyErr(w, r, "系统错误...", "/")
	}
}
func PlayHome(w http.ResponseWriter, r *http.Request) {
	if dao.OnlineSession(r) == 1 {
		r.ParseForm()
		playId := r.FormValue("playId")
		play := r.FormValue("play")
		cookie, _ := r.Cookie("user")
		type one struct {
			InfoP  *model.Info
			S      string
			PlayId string
			State  int
		}
		onee := &one{
			InfoP:  &model.Info{S: NavServer(r)},
			PlayId: playId,
			S:      "",
		}
		t := template.Must(template.ParseFiles("views/users/playHome.html"))
		if playId == "" {
			MyErr1(w, r)
		} else {
			if playOrder := dao.QueryPlayFormS(playId, cookie.Value); playOrder != nil {
				switch play {
				case "0":
					onee.S = ""
					t.Execute(w, onee)
				case "wechat":
					for _, v := range playOrder.OrderFormId {
						dao.UpdateOrderState(v, 1)
						dao.UpdateOrderDelivertime(v, time.Now().Format("2006-01-02 15:04:05"))
					}
					onee.State = 1
					onee.S = "微信支付成功！"
					t.Execute(w, onee)
				case "alipay":
					for _, v := range playOrder.OrderFormId {
						dao.UpdateOrderState(v, 1)
						dao.UpdateOrderDelivertime(v, time.Now().Format("2006-01-02 15:04:05"))

					}
					onee.State = 1
					onee.S = "支付宝支付成功！"
					t.Execute(w, onee)

				}
			} else {
				MyErr(w, r, "出错了！", "/")
			}

		}
	} else {
		MyErr(w, r, "请登录！", "/login")
	}

}
