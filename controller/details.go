package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"fmt"
	"html/template"
	"net/http"
)

// Details 商品详情
func Details(w http.ResponseWriter, r *http.Request) {
	bookId := r.FormValue("bookId")
	book := &model.Book{}
	fmt.Println(bookId)
	book = dao.GetBook(bookId)
	book.InfoP = &model.Info{S: NavServer(r)}
	t := template.Must(template.ParseFiles("views/users/commdity_details.html"))
	t.Execute(w, book)

}
