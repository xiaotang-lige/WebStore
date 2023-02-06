package model

type Cart struct {
	UserId    string
	BookId    string
	SoleMoney float64
	Amount    float64
	Book      *Book
}
type AllCartS struct {
	UserId string
	Money  float64
	Amount float64
	Cart   []*Cart
	InfoP  *Info
}
