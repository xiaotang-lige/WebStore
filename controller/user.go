package controller

import (
	"bookStore/dao"
	"bookStore/model"
	"html/template"
	"log"
	"net/http"
	"os"
)

// LoginOut 注销
func LoginOut(w http.ResponseWriter, r *http.Request) {
	cookie, _ := r.Cookie("user")
	if cookie != nil {
		dao.DeleteSession(cookie.Value)
		cookie.MaxAge = -1
		http.SetCookie(w, cookie)
	}
	Home(w, r)
}

// Login 登录函数
func Login(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	info := &model.Info{
		Err: "",
		S:   NavServer(r),
	}

	if dao.OnlineSession(r) == 1 {
		MyErr(w, r, "已登录", "/index.html")
	} else if r.Method == "POST" && r.PostFormValue("phone") != "" {
		password := r.PostFormValue("password")
		phone := r.PostFormValue("phone")
		//买家登录
		if user := dao.VerifyUserPhonePassword(phone, password); user != nil && user.Position == 0 {
			dao.AddSession(user.Id)
			cookie := http.Cookie{
				Name:     "user",
				Value:    user.Id,
				HttpOnly: true,
			}
			http.SetCookie(w, &cookie)
			info.Err = "登陆成功"
			//MyErr(w, r, "登陆成功", "/")
			w.Write([]byte("登录成功！"))
		} else if user != nil && user.Position == 1 { //卖家登陆
			dao.AddSession(user.Id)
			cookie := http.Cookie{
				Name:     "user",
				Value:    user.Id,
				HttpOnly: true,
			}
			http.SetCookie(w, &cookie)
			info.Err = "卖家登陆成功"
			//MyErr(w, r, "卖家登陆成功", "/")
			w.Write([]byte("卖家登录成功！"))
		} else {
			//用户名或密码不正确
			info.Err = "用户名或密码不正确！"
			//MyErr(w, r, "用户名或密码不正确！", "/")
			w.Write([]byte("用户名或密码不正确！"))
		}

	} else {
		info.Err = "格式输入错误"
		//MyErr(w, r, "格式输入错误！", "/")
		w.Write([]byte("格式输入错误!"))
	}

}

// Register 客户注册用户功能
func Register(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	t := template.Must(template.ParseFiles("views/users/register.html"))
	if r.Method == "POST" {
		user := &model.User{
			UserName:   r.PostFormValue("username"),
			Password:   r.PostFormValue("password"),
			Email:      r.PostFormValue("email"),
			Phone:      r.PostFormValue("phone"),
			Number:     "nil",
			SellerName: "nil",
			Position:   0,
		}

		if user.UserName != "" { //此处判断格式还没写
			//查询各信息是否重复
			if dao.VerifyUserPhone(user.Phone) == "" {
				if dao.AddUser(user) == nil {
					w.Write([]byte("注册成功！"))
				}
			} else {

				w.Write([]byte("注册信息已存在！"))
			}
		} else {

			w.Write([]byte("格式输入错误！"))
		}
	} else {
		t.Execute(w, "")
	}
}

// RegisterSeller 商户注册
func RegisterSeller(w http.ResponseWriter, r *http.Request) {
	r.ParseForm()
	if r.Method == "POST" {
		//填写信息验证
		user := &model.User{
			UserName:   r.PostFormValue("username"),
			Password:   r.PostFormValue("password"),
			Email:      r.PostFormValue("email"),
			Phone:      r.PostFormValue("phone"),
			Number:     r.PostFormValue("usercard"),
			SellerName: r.PostFormValue("sellername"),
			Position:   1,
		}
		//v := model.Verify{User: user}
		//if v.SellerName() == false || !v.Password() == false || !v.Phone() == false {
		//	w.Write([]byte("注册信息格式错误！"))
		//	return
		//}
		if dao.VerifyUserSellerName(user.SellerName) != "" {
			w.Write([]byte("店铺名称已被注册！"))
			return
		}
		if dao.VerifyUserPhone(user.Phone) != "" {
			w.Write([]byte("手机号码已被注册！"))
			return
		}

		if dao.AddUser(user) == nil {
			seller := &model.Seller{
				SellerId:   dao.VerifyUserPhonePassword(user.Phone, user.Password).Id,
				SellerName: user.SellerName,
			}
			//创建商户资源目录
			err := os.Mkdir("views/seller/"+user.Phone, 0666)
			if err != nil {
				log.Println(err)
			}
			if dao.AddSellerForm(seller) != nil {
				log.Println("出错了")
			}
			w.Write([]byte("店铺注册成功！"))
			return
		}
	} else {
		t, _ := template.ParseFiles("views/users/registerseller.html")
		t.Execute(w, "")
	}

}
func LoginMini(w http.ResponseWriter, r *http.Request) {
	t, _ := template.ParseFiles("views/users/loginText.html")
	t.Execute(w, "")
}
