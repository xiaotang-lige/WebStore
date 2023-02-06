package model

import (
	"fmt"
	"net/http"
)

type NavState struct {
	Name string
	S    int
	r    *http.Request
}

func (s *NavState) Head() string {
	cookie, _ := s.r.Cookie("user")
	if cookie != nil {
		u := UserS{Id: cookie.Value}
		s.Name = cookie.Value
		u.Query()
		fmt.Println(s.S)
		return "成功！"

	}
	return "失败！"
}
func (s *NavState) R(r *http.Request) {
	s.r = r
	return
}
