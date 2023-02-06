package dao

import "bookStore/model"

func AddPlayFormS(p *model.PlayFormS) error {
	var err error
	for _, v := range p.OrderFormId {
		_, err = Db.Exec("insert into play(id, userId, orderFormId,allMoney,allAmount) value (?,?,?,?,?)", p.Id, p.UserId, v, p.AllMoney, p.AllAmount)

	}
	return err
}
func QueryPlayFormS(i, u string) *model.PlayFormS {
	if row, err := Db.Query("select orderFormId from play where id=? and userId=?", i, u); err != nil {
		return nil
	} else {
		playS := &model.PlayFormS{
			Id:     i,
			UserId: u,
		}
		for row.Next() {
			var s string
			row.Scan(&s)
			playS.OrderFormId = append(playS.OrderFormId, s)
		}
		return playS
	}
	return nil
}
