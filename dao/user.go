package dao

//// QueryUser 通过结构体查询查询信息  此查询很慢，有待优化
//func QueryUser(user *model.User) *model.User {
//	if user.UserName != "" && user.Password != "" {
//		row := Db.QueryRow("select * from users where id=?", user.UserName)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	} else if user.Id != "" {
//		row := Db.QueryRow("select * from users where id=?", user.Id)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	} else if user.UserName != "" {
//		row := Db.QueryRow("select * from users where username=?", user.UserName)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	} else if user.Email != "" {
//		row := Db.QueryRow("select *  from users where email=?", user.Email)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	} else if user.Number != 0 {
//		row := Db.QueryRow("select * from users where number=?", user.Number)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	} else if user.Phone != 0 {
//		row := Db.QueryRow("select * from users where phone=?", user.Phone)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	} else if user.SellerName != "" {
//		row := Db.QueryRow("select * from users where phone=?", user.Phone)
//		if err := row.Scan(&user.Id, &user.UserName, &user.Password, &user.Email, &user.Position, &user.Number, &user.Phone, &user.SellerName); err != nil {
//			log.Println("出错了", err)
//			return nil
//		}
//		return user
//	}
//	return nil
//}
