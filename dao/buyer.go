package dao

import "bookStore/model"

func BuyerS(s string) []*model.OrderForm {
	if row, err := Db.Query("select * from `order`where userid=?", s); err == nil {
		var orderFromS []*model.OrderForm
		for row.Next() {
			order := &model.OrderForm{}
			if row.Scan(&order.Id, &order.CommodityId, &order.CreateTime, &order.DeliverTime, &order.AllPrice, &order.State, &order.UserId, &order.SellerPutaway, &order.Client) != nil {
				return nil
			} else {
				book := GetBook(order.CommodityId)
				order.OneBook = book
				orderFromS = append(orderFromS, order)
			}

		}
		return orderFromS
	}
	return nil
}
