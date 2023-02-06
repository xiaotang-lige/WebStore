package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"net/http"
	"strconv"
	"text/template"
)

func NavServer(r *http.Request) string {
	cookie, _ := r.Cookie("user")
	if dao.OnlineSession(r) != 1 {
		return "未登录"
	} else {
		if dao.QueryUserId(cookie.Value).Position == 0 {
			return "买家"
		} else if dao.QueryUserId(cookie.Value).Position == 1 {
			return "卖家"
		}
	}
	return "出错"
}
func Home(w http.ResponseWriter, r *http.Request) {
	t := template.Must(template.ParseFiles("views/index.html"))
	page := &model.Page{
		Current: 1,
	}
	if r.FormValue("Current") != "" {
		page.Current, _ = strconv.Atoi(r.FormValue("Current"))
	}
	page = dao.QueryPageBookS(page.Current, 12)
	cookie, _ := r.Cookie("user")
	page.InfoP = &model.Info{S: NavServer(r)}
	if dao.OnlineSession(r) == 1 {
		page.User = dao.QueryUserId(cookie.Value)
	}
	t.Execute(w, page)

}
