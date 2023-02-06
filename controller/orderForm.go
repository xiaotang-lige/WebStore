package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"net/http"
	"time"
)

// Order 订单详情
func Order(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	bookId := r.FormValue("bookId")
	cookieId, _ := r.Cookie("user")
	if i := dao.OnlineSession(r); i != 1 {
		MyErr(w, r, "请登录", "/")
	} else if dao.QueryUserId(cookieId.Value).SellerName == dao.GetBook(bookId).SellerPutaway {
		MyErr(w, r, "商户禁止购买自身产品！", "/")
	} else if r.Method == "POST" {
		book := &model.Book{}
		book = dao.GetBook(bookId)
		time := time.Now()
		cookieUser, _ := r.Cookie("user")
		user := dao.QueryUserId(cookieUser.Value)
		order := &model.OrderForm{
			Id:            dao.UuId(),
			UserId:        cookieUser.Value,
			CommodityId:   book.Id,
			CreateTime:    time.Format("2006-01-02 15:04:05"),
			DeliverTime:   "",
			AllPrice:      book.Price,
			State:         0,
			OneBook:       book,
			SellerPutaway: book.SellerPutaway,
			Client:        user.UserName,
			InfoP:         &model.Info{S: NavServer(r)},
		}
		dao.AddOrder(order)
		t := template.Must(template.ParseFiles("views/users/orderform.html"))
		t.Execute(w, order)

	}
}

//func FormMini(w http.ResponseWriter, r *http.Request,bookId string) *model.OrderForm {
//	r.ParseForm()
//	cookieId, _ := r.Cookie("user")
//	if i := dao.OnlineSession(r); i != 1 {
//		MyErr(w, r, "请登录", "/login")
//	} else if dao.QueryUserId(cookieId.Value).SellerName == dao.GetBook(bookId).SellerPutaway {
//		MyErr(w, r, "商户禁止购买自身产品！", "/")
//	} else {
//		book := &model.Book{}
//		book = dao.GetBook(bookId)
//		time := time.Now()
//		cookieUser, _ := r.Cookie("user")
//		user := dao.QueryUserId(cookieUser.Value)
//		order := &model.OrderForm{
//			Id:            dao.UuId(),
//			UserId:        cookieUser.Value,
//			CommodityId:   book.Id,
//			CreateTime:    time.Format("2006-01-02 15:04:05"),
//			DeliverTime:   "",
//			AllPrice:      book.Price*book.,
//			State:         0,
//			OneBook:       book,
//			SellerPutaway: book.SellerPutaway,
//			Client:        user.UserName,
//			InfoP:         &model.Info{S: NavServer(r)},
//		}
//		if dao.AddOrder(order) == nil {
//			return order
//		}
//	}
//	return nil
//}
