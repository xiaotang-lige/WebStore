package model

type User struct {
	Id         string
	UserName   string
	Password   string
	Email      string
	Phone      string
	Number     string
	Position   int    //身份 默认买家0，卖家1
	SellerName string //商铺名
}
type Info struct {
	UserId     string
	User       *User
	Bbb        bool
	Phone      string
	Email      string
	Number     string
	SellerName string
	S          string
	Err        string
	LogoPath   string
	LoginState string
}
