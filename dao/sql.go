package dao

import (
	"database/sql"
	_ "github.com/go-sql-driver/mysql"
	"log"
)

var (
	Db  *sql.DB
	err error
)

func init() {
	Db, err = sql.Open("mysql", "lige:1234@tcp(localhost:3306)/bookstore")
	if err != nil {
		log.Println("连接Mysql错误：", err)
	}

}
