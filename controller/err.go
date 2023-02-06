package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"net/http"
)

func MyErr(w http.ResponseWriter, r *http.Request, s string, s2 string) {
	info := &model.MyErr{
		Err:   s,
		Url:   s2,
		InfoP: &model.Info{S: NavServer(r)},
	}
	t, _ := template.ParseFiles("views/users/err.html")
	t.Execute(w, info)
}
func MyErr1(w http.ResponseWriter, r *http.Request) {
	info := &model.MyErr{
		Err:   "功能待开发...",
		Url:   "/",
		InfoP: &model.Info{S: NavServer(r)},
	}
	t, _ := template.ParseFiles("views/users/err.html")
	t.Execute(w, info)
}
func Verify(w http.ResponseWriter, r *http.Request) {
	phone := r.FormValue("phone")
	if p := dao.VerifyUserPhone(phone); p != "" {
		w.Write([]byte("<font style='color:green'>用户名可用！</font>"))
	} else {
		w.Write([]byte("用户名已存在！"))
	}
}
