package model

import (
	"log"
	"regexp"
)

// InfoM 判断填写个人信息格式
type Verify struct {
	User *User
}

// VPhone 验证手机号码
func (v *Verify) Phone() bool {
	b, _ := regexp.MatchString(`^1((34[0-8])|(8\d{2})|(([35][0-35-9]|4[579]|66|7[35678]|9[1389])\d{1}))\d{7}$`, v.User.Phone)
	log.Println("p", b)
	return b
}
func (v *Verify) Email() bool {
	b, _ := regexp.MatchString(`^([\w\.\_]{2,10})@(\w{1,}).([a-z]{2,4})$`, v.User.Email)
	log.Println("e", b)
	return b
}
func (v *Verify) Number() bool {
	b, _ := regexp.MatchString(`^(\d{17})([0-9]|X)$`, v.User.Number)
	log.Println("n", b)
	return b
}
func (v *Verify) Name() bool {
	b, _ := regexp.MatchString(`^[a-zA-Z0-9_-]{4,16}$`, v.User.UserName)
	log.Println("n", b)
	return b
}

//	func (v *Verify) SellerName() bool {
//		b, _ := regexp.MatchString(`^\x00-\xff`, v.User.SellerName)
//		log.Println("se", b)
//		return b
//	}
func (v *Verify) Password() bool {
	b, _ := regexp.MatchString(`^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$`, v.User.Password)
	log.Println("pa", b)
	return b
}
