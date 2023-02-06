package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"log"
	"net/http"
	"time"
)

func Cart(w http.ResponseWriter, r *http.Request) {
	t := template.Must(template.ParseFiles("views/users/cart.html"))
	r.ParseForm()
	cookie, _ := r.Cookie("user")
	cartS := &model.AllCartS{
		Cart:  dao.QueryCartS(cookie.Value),
		InfoP: &model.Info{S: NavServer(r)},
	}
	if dao.OnlineSession(r) == 1 && r.Method == "POST" {
		var bookIdS []string
		bookIdS = r.Form["goodsSelect"]
		var orderFromS []*model.OrderForm

		allCarts := &model.AllCartS{
			Money:  0,
			Amount: 0,
		}
		playFormS := &model.PlayFormS{
			Id:     dao.UuId(),
			UserId: cookie.Value,
		}
		for k, v := range bookIdS {
			//计算总价格
			cart := dao.QueryCart(v, cookie.Value)
			allCarts.Amount = allCarts.Amount + cart.Amount
			allCarts.Money = allCarts.Money + ((cart.SoleMoney*cart.Amount)*100)/100
			book := dao.GetBook(v)
			orderForm := &model.OrderForm{
				UserId:        cookie.Value,
				CommodityId:   bookIdS[k],
				CreateTime:    time.Now().Format("2006-01-02 15:04:05"),
				DeliverTime:   "",
				AllPrice:      book.Price,
				State:         0,
				OneBook:       book,
				SellerPutaway: book.SellerPutaway,
				Client:        dao.QueryUserId(cookie.Value).UserName,
				Cart: &model.Cart{
					BookId:    "",
					SoleMoney: book.Price * cart.Amount * 10000000000 / 10000000000,
					Amount:    cart.Amount,
					Book:      nil,
				},
			}
			for i := 0; i < int(cart.Amount); i++ {
				orderForm.Id = dao.UuId()
				playFormS.OrderFormId = append(playFormS.OrderFormId, orderForm.Id)
				dao.AddOrder(orderForm)
			}
			orderFromS = append(orderFromS, orderForm)
			dao.DeleteCart(bookIdS[k], cookie.Value)
		}
		allFormMax := &model.AllFormMax{
			OrderFormS: orderFromS,
			AllCartS:   allCarts,
			InfoP:      &model.Info{S: NavServer(r)},
		}
		playFormS.AllAmount = allCarts.Amount
		playFormS.AllMoney = allCarts.Money
		if err := dao.AddPlayFormS(playFormS); err != nil {
			log.Println(err)
		} else {
			allFormMax.PlayId = playFormS.Id
		}

		t := template.Must(template.ParseFiles("views/users/cartForm.html"))
		t.Execute(w, allFormMax)

	} else if dao.OnlineSession(r) == 1 {
		t.Execute(w, cartS)
	}
}
func AddCart(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	bookId := r.FormValue("bookId")
	user, _ := r.Cookie("user")
	if dao.OnlineSession(r) == 1 {
		if dao.QueryUserId(user.Value).SellerName == dao.GetBook(bookId).SellerPutaway {
			w.Write([]byte("禁止购买自身出售商品！"))
			return
		}
		book := dao.GetBook(bookId)
		if cart := dao.QueryCart(bookId, user.Value); cart != nil {
			cart.Amount = cart.Amount + 1
			cart.SoleMoney = book.Price
			if err := dao.UpdateCart(bookId, user.Value, cart.SoleMoney, cart.Amount); err != nil {
				log.Println(err)
			}

			w.Write([]byte("再次添加商品到购物车成功！"))
		} else {
			cart := &model.Cart{
				UserId:    user.Value,
				BookId:    bookId,
				Amount:    1,
				SoleMoney: book.Price,
			}
			if dao.AddCart(cart) == nil {
				w.Write([]byte("商品添加购物车成功！"))
			}
		}

	} else {
		w.Write([]byte("请登录！"))
	}
}
