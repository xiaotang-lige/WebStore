package dao

import (
	"bookStore/model"
)

// QueryCartS 获取全部购物商品
func QueryCartS(userId string) []*model.Cart {
	if row, err := Db.Query("select * from cart where userId=?", userId); err == nil {
		var cartS []*model.Cart
		for row.Next() {
			cart := &model.Cart{}
			if row.Scan(&cart.UserId, &cart.BookId, &cart.SoleMoney, &cart.Amount) == nil {
				cart.Book = GetBook(cart.BookId)
				cartS = append(cartS, cart)
			} else {
				return nil
			}
		}
		return cartS

	}
	return nil
}

func AddCart(cart *model.Cart) error {
	_, err := Db.Exec("insert into cart(userId, bookId, money, amount) VALUES(?,?,?,?)", cart.UserId, cart.BookId, cart.SoleMoney, cart.Amount)
	return err
}
func QueryCart(bookId, userId string) *model.Cart {
	row := Db.QueryRow("select money,amount from cart where bookId=? and userId=?", bookId, userId)
	cart := &model.Cart{}
	if row.Scan(&cart.SoleMoney, &cart.Amount) == nil {
		return cart
	}
	return nil
}
func UpdateCart(bookId, userId string, money float64, amount float64) error {
	_, err := Db.Exec("update cart set Money=?,amount=? where bookId=? and userId=?", money, amount, bookId, userId)
	return err
}
func DeleteCart(bookId, userId string) error {
	_, err := Db.Exec("delete from cart where bookId=? and userId=?", bookId, userId)
	return err
}
