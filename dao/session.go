package dao

import (
	"log"
	"net/http"
)

// AddSession 添加Session，成功返回1
func AddSession(s string) int {
	if _, err := Db.Exec("insert into session values (?)", s); err != nil {
		log.Println("添加Session错误：", err)
		return 0
	}
	return 1
}

// DeleteSession 删除一条Session，成功返回1
func DeleteSession(s string) int {
	if _, err := Db.Exec("delete from session where sessionId=?", s); err != nil {
		log.Println("删除Session错误：", err)
		return 0
	}
	return 1
}

// GetSession 查询一次Session，成功返回1
func GetSession(s string) int {
	row := Db.QueryRow("select sessionId from session where sessionId=?", s)
	var x string
	if err := row.Scan(&x); err != nil {
		return 0
	} else {
		if s == x {
			return 1
		} else {
			return 0
		}
	}
}

// OnlineSession 在线返回1
func OnlineSession(r *http.Request) int {
	cookie, _ := r.Cookie("user")
	//查询session并查询是否正确
	if cookie == nil {
		return 0
	}
	if cookie != nil && GetSession(cookie.Value) == 1 {
		return 1
	}
	return 0
}
