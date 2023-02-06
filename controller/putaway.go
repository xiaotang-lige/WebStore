package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"log"
	"net/http"
	"strconv"
)

// Putaway 商品上架以及修改
func Putaway(w http.ResponseWriter, r *http.Request) {
	cookid, _ := r.Cookie("user")
	if dao.OnlineSession(r) != 1 && dao.QueryUserId(cookid.Value).Position != 1 {
		MyErr(w, r, "请登录", "/login")
		return
	}
	user := dao.QueryUserId(cookid.Value)
	ty := r.FormValue("type")
	bookId := r.FormValue("bookId")

	t := template.Must(template.ParseFiles("views/users/putaway.html"))
	switch ty {
	case "home":
		{
			page := &model.Page{}
			page.Current, _ = strconv.Atoi(r.FormValue("Current"))
			page = dao.QueryPageBookSeller(page.Current, 10, user.SellerName)
			page.Type = "home"
			t.Execute(w, page)
		}
	case "putaway":
		{
			page := &model.Page{}
			page.Type = "putaway"
			r.ParseForm()
			if r.Method == "POST" {
				dao.UpImage(r, user.Phone, 1)
			}
			t.Execute(w, page)
		}
	case "up":
		{
			book := dao.GetBook(bookId)
			if r.Method == "POST" && r.FormValue("sub") == "确认修改" && book.SellerPutaway == user.SellerName {
				price, err := strconv.ParseFloat(r.FormValue("price"), 64)
				stock, err := strconv.Atoi(r.FormValue("stock"))
				book := &model.Book{
					Id:            bookId,
					Title:         r.FormValue("title"),
					Author:        r.FormValue("author"),
					Price:         price,
					Sales:         book.Sales,
					Stock:         stock,
					ImgPath:       book.ImgPath,
					SellerPutaway: user.SellerName,
					InfoP:         nil,
				}
				err = dao.UpdateBook(book)
				if err != nil {
					log.Println(err)
				}
				MyErr(w, r, "更新商品信息成功!", "/putaway?type=home&Current=1")
				return
			}
			page := &model.Page{}
			page.Current, _ = strconv.Atoi(r.FormValue("Current"))
			page = dao.QueryPageBookSeller(page.Current, 10, user.SellerName)
			for k, _ := range page.Books {
				if page.Books[k].Id == bookId {
					page.Books[k].BookState = "up"
					break
				}
			}
			page.Type = "home"
			t.Execute(w, page)
		}
	case "top":
		{
			book := dao.GetBook(bookId)
			if book.SellerPutaway != user.SellerName {
				MyErr(w, r, "不允许此操作！", "/")
				return
			}
			book.Stock = -1000000
			if dao.UpdateBook(book) == nil {
				MyErr(w, r, "商品下架成功！", "/putaway?type=home&Current=1")
			}
		}
	}

}
