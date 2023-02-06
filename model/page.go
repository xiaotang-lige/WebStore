package model

type Page struct {
	Books      []*Book
	InfoP      *Info
	User       *User
	HowPages   int //多少页
	Record     int //当页多少条记录
	Current    int //当前页数
	Type       string
	LoginState *LoginState
}
type LoginState struct {
	State string //0未登录，1登录,2卖家登录,3密码错误,4输入格式错误
	S     string
}

func (p *Page) LastState() bool {
	return p.Current != 1
}
func (p *Page) NextState() bool {
	return p.Current != p.HowPages
}
func (p *Page) Last() int {
	if p.LastState() == false {
		return 1
	}
	return p.Current - 1
}
func (p *Page) Next() int {
	if p.NextState() == false {
		return p.HowPages
	}
	return p.Current + 1
}
