package dao

import (
	"bookStore/model"
	"log"
)

// QueryUserId 通过用户Id查询，返回结构体
func QueryUserId(id string) *model.User {
	row := Db.QueryRow("select * from users where id=?", id)
	user := &model.User{}
	if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
		log.Println(err)
		return nil
	}
	return user

}
func AddUser(user *model.User) error {
	_, err := Db.Exec("insert into users(username, password, email, position, number, phone, sellername) values(?,?,?,?,?,?,?)", user.UserName, user.Password, user.Email, user.Position, user.Number, user.Phone, user.SellerName)
	return err
}

// VerifyUserPhonePassword    确认手机号码密码，错误返回默认
func VerifyUserPhonePassword(p string, p1 string) *model.User {
	row := Db.QueryRow("select id,username,email,position,number,phone,sellerName from users where phone=? and password=?", p, p1)
	user := &model.User{}
	if err := row.Scan(&user.Id, &user.UserName, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
		log.Println("手机号密码错误", err)
		return nil
	}
	return user
}

// VerifyUserPhone 查询手机号是否存在，不存在nil
func VerifyUserPhone(i string) string {
	row := Db.QueryRow("select id from users where phone=?", i)
	var id string
	row.Scan(&id)
	return id
}

// VerifyUserNumber  查询身份证号是否存在，不存在nil
func VerifyUserNumber(i string) string {
	row := Db.QueryRow("select id from users where number=?", i)
	var id string
	row.Scan(&id)
	return id
}

// VerifyUserSellerName  查询店铺名是否存在，不存在nil
func VerifyUserSellerName(string2 string) string {
	row := Db.QueryRow("select id from users where sellerName=?", string2)
	var id string
	row.Scan(&id)
	return id
}

// VerifyUserEmail   查询邮箱是否存在，不存在nil
func VerifyUserEmail(i string) string {
	row := Db.QueryRow("select id from users where email=?", i)
	var id string
	row.Scan(&id)
	return id
}
