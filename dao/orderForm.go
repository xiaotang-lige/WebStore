package dao

import (
	"bookStore/model"
	"log"
)

// AddOrder 添加订单
func AddOrder(o *model.OrderForm) error {
	if _, err := Db.Exec("insert into `order`(id,userid,commodityId,createtime,delivertime,allprice,state,seller,client) values(?,?,?,?,?,?,?,?,?)", o.Id, o.UserId, o.CommodityId, o.CreateTime, o.DeliverTime, o.AllPrice, o.State, o.SellerPutaway, o.Client); err != nil {
		return err
	}
	return nil
}

// QueryOrderId id查询
func QueryOrder(s string) *model.OrderForm {
	row := Db.QueryRow("select * from `order`where id=?", s)
	o := &model.OrderForm{}
	if err := row.Scan(&o.Id, &o.CommodityId, &o.CreateTime, &o.DeliverTime, &o.AllPrice, &o.State, &o.UserId, &o.SellerPutaway, &o.Client); err != nil {
		log.Println(err)
		return nil
	}
	return o
}

func QueryOrderUserId(s string) *model.OrderForm {
	row := Db.QueryRow("select * from `order`where userid=?", s)
	o := &model.OrderForm{}
	if err := row.Scan(&o.Id, &o.CommodityId, &o.CreateTime, &o.DeliverTime, &o.AllPrice, &o.State, &o.UserId, &o.SellerPutaway, &o.Client); err != nil {
		log.Println(err)
		return nil
	}
	return o
}

// QueryOrderSeller seller查询
func QueryOrderSeller(s string) *model.OrderForm {
	row := Db.QueryRow("select * from `order`where seller=?", s)
	o := &model.OrderForm{}
	if err := row.Scan(&o.Id, &o.CommodityId, &o.CreateTime, &o.DeliverTime, &o.AllPrice, &o.State, &o.UserId, &o.SellerPutaway, &o.Client); err != nil {
		log.Println(err)
		return nil
	}
	return o
}
func UpdateOrderState(id string, state int) error {
	_, err := Db.Exec("update `order`set state=? where id=?", state, id)
	return err
}
func UpdateOrderDelivertime(id string, s string) error {
	_, err := Db.Exec("update `order`set delivertime=? where id=?", s, id)
	return err
}
