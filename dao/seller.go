package dao

import (
	"bookStore/model"
	"log"
)

//QuerySeller 查询卖家信息，不成功返回0
//func QuerySeller(user *model.User) (*model.Seller, int) {
//	if user.Position == 1 {
//		//查询买家订单，上架订单
//		row := Db.QueryRow("select buyerFormId,putawayFormId from seller where sellerid=?", user.Id)
//		orderForm := &model.OrderForm{}
//		seller := &model.Seller{
//			BuyerForm: orderForm,
//		}
//		if err := row.Scan(&seller.BuyerForm.Id, &seller.PutawayForm); err != nil {
//			log.Println("查询seller出错:", err)
//			return nil, 0
//		} else {
//			return seller, 1
//		}
//	} else {
//		return nil, 0
//	}
//
//}

// QuerySellerBuyerFormS 查询卖家订单
func QuerySellerBuyerFormS(s string) []*model.OrderForm {
	if rows, err := Db.Query("select * from `order`where seller=?", s); err != nil {
		log.Println(err)
		return nil
	} else {
		var orders []*model.OrderForm
		for rows.Next() {
			order := &model.OrderForm{}
			if err := rows.Scan(&order.Id, &order.CommodityId, &order.CreateTime, &order.DeliverTime, &order.AllPrice, &order.State, &order.UserId, &order.SellerPutaway, &order.Client); err != nil {
				log.Println(err)
			} else {
				//根据查询的id导出书本结构体
				book := GetBook(order.CommodityId)
				order.OneBook = book
				orders = append(orders, order)
			}
		}
		return orders
	}
	return nil
}
func QuerySellerInfo(s string) *model.Seller {
	row := Db.QueryRow("select * from seller where sellerid=?", s)
	seller := &model.Seller{}
	if err := row.Scan(&seller.SellerId, &seller.BuyerForm, &seller.PutawayForm, &seller.MakeForm, &seller.SellerName); err != nil {
		log.Println("卖家查询错误", err)
		return nil
	} else {
		return seller
	}
	return nil
}
func AddSellerForm(seller *model.Seller) error {
	_, err := Db.Exec("insert into seller(sellerid, buyerFormId, putawayFormId, makeForm, name) VALUES (?,?,?,?,?)", seller.SellerId, seller.BuyerForm, seller.PutawayForm, seller.MakeForm, seller.SellerName)
	return err
}
