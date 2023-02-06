package dao

import (
	"fmt"
	"testing"
)

//func TestCheckUserName(t *testing.T) {
//	fmt.Println("返回", CheckUserName("shanghu"))
//}

//func TestSaveUser(t *testing.T) {
//	user := &model.User{}
//	user.UserName = "haha"
//	user.Password = "1234565"
//	user.Email = "192123@qq.com"
//	fmt.Println(SaveUser(user.UserName, user.Password, user.Email))
//}

//	func TestAddSession(t *testing.T) {
//		AddSession("asdsadqwdaasdsfqwfasdwqw")
//	}
//
//	func TestDeleteSession(t *testing.T) {
//		DeleteSession("asdsadqwdaasdsfqwfasdwqw")
//
// //	}
//
//	func TestGetSession(t *testing.T) {
//		fmt.Println(GetSession("asdsadqwdadsfqwfasdwqw"))
//	}
//
//	func TestAddBook(t *testing.T) {
//		book := &model.Book{
//			Title:   "小唐有故事",
//			Author:  "小唐",
//			Price:   1988,
//			Sales:   998,
//			Stock:   2,
//			ImgPath: "",
//		}
//		AddBook(book)
//	}
//
//	func TestGetAllBooks(t *testing.T) {
//		books, _ := GetAllBooks()
//		for k, v := range books {
//			fmt.Println(k+1, v)
//		}
//	}
//
//	func TestAddBook(t *testing.T) {
//		book := &model.Book{}
//		book = GetBook("1")
//		fmt.Println(book)
//	}
//
//	func TestDeleteBook(t *testing.T) {
//		DeleteBook("31")
//	}
//
//	func TestUpdateBook(t *testing.T) {
//		book := &model.Book{
//			Id:      "30",
//			Title:   "12",
//			Author:  "",
//			Price:   0,
//			Sales:   0,
//			Stock:   0,
//			ImgPath: "",
//		}
//		UpdateBook(book)
//	}
//
//	func TestAddOrder(t *testing.T) {
//		order := &model.OrderForm{
//			UserId:      "2c1d16c02d1011ed9fec8c1645bedc84",
//			CommodityId: "123",
//			CreateTime:  "321",
//			DeliverTime: "321",
//			AllPrice:    0,
//			State:       0,
//		}
//		AddOrder(order)
//	}
//
//	func TestGetBook(t *testing.T) {
//		book := GetBook("1")
//		fmt.Println(book)
//	}
//
//	func TestQueryUser(t *testing.T) {
//		user := &model.User{}
//		user = QueryUser(10086)
//		fmt.Println(user)
//	}
//
//	func TestQuerySeller(t *testing.T) {
//		user := &model.User{Position: 1, Id: "2c1d16c02d1011ed9fec8c1645bedc84"}
//		seller := &model.Seller{}
//		seller, _ = QuerySeller(user)
//		fmt.Println(seller.BuyerForm.Id)
//	}
//
//	func TestQueryUserId(t *testing.T) {
//		user := &model.User{Id: "2c1d16c02d1011ed9fec8c1645bedc84"}
//		user = QueryUserId(user.Id)
//		fmt.Println(user)
//	}
//
//	func TestQuerySellerBuyerFormS(t *testing.T) {
//		var buyerForm []*model.OrderForm
//		buyerForm = QuerySellerBuyerFormS("小王")
//		fmt.Println("id:", buyerForm[1].Id)
//		fmt.Println("商品id：", buyerForm[1].CommodityId)
//		fmt.Println("创建时间：", buyerForm[1].CreateTime)
//		fmt.Println("提交订单时间", buyerForm[1].DeliverTime)
//		fmt.Println("所有价格", buyerForm[1].AllPrice)
//		fmt.Println("提交状态", buyerForm[1].State)
//		fmt.Println("用户id", buyerForm[1].UserId)
//		fmt.Println("卖家上架", buyerForm[1].SellerPutaway)
//
// }
// func TestQuerySellerInfo(t *testing.T) {
//
//		fmt.Println(QuerySellerInfo("2c1d16c02d1011ed9fec8c1645bedc84"))
//	}
//
//	func TestQueryUser(t *testing.T) {
//		user := &model.User{
//			Id:         "",
//			UserName:   "xiexie",
//			Password:   "",
//			Email:      "",
//			Phone:      0,
//			Number:     0,
//			Position:   0,
//			SellerName: "",
//		}
//		QueryUser(user)
//		fmt.Println(user)
//	}
//func TestQueryOrder(t *testing.T) {
//
//	fmt.Println(QueryOrder("6dc167985fc03a678465-3b46-11ed-b578-8c1645bedc848b8890a2362a").UserId)
//}

//
//	func TestUpdateOrderState(t *testing.T) {
//		if err := UpdateOrderState("e9e8d83b-38ef-11ed-bc0a-8c1645bedc84", 2); err != nil {
//			log.Println(err)
//		}
//	}
//func TestVerifyUserPhonePassword(t *testing.T) {
//	fmt.Println(VerifyUserPhonePassword("10086", "123"))
//
//}

//	func TestVerifyPhone(t *testing.T) {
//		if VerifyUserPhone(10083) != "" {
//			fmt.Println("asd")
//		}
//	}
//
//	func TestVPhone(t *testing.T) {
//		fmt.Println(VPhone("13837840000"))
//	}
//
//	func TestQueryCartS(t *testing.T) {
//		var cartS []*model.Cart
//		cartS = QueryCartS("36b36b973a3e11edbc0a8c1645bedc84")
//		i := 0
//		for _, v := range cartS {
//			i++
//			cart := &model.Cart{}
//			cart = v
//			fmt.Println(i, cart.Money, cart.Amount)
//		}
//		fmt.Println(cartS)
//		fmt.Println(i)
//	}

// func TestQueryPlayFormS(t *testing.T) {
//
//		fmt.Println(QueryPlayFormS("2c06148ea47ec52cdcc3-3fd5-11ed-8bfc-8c1645bedc84f3f03391077f", "36b36b973a3e11edbc0a8c1645bedc84").OrderFormId)
//	}
func TestQueryPageBookS(t *testing.T) {
	page := QueryPageBookS(1, 12)
	i := 0
	for k, _ := range page.Books {
		fmt.Println(page.Books[k].Title)
		i++
	}
	fmt.Println(page)
	fmt.Println(i)
}
