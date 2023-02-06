package dao

import (
	"bookStore/model"
	"fmt"
	"log"
)

// AddBook 添加图书
func AddBook(b *model.Book) int {
	if _, err := Db.Exec("insert into books(id,title, author, price, sales, stock, img_path) values (?,?,?,?,?,?)", b.Title, b.Author, b.Price, b.Sales, b.Stock, b.ImgPath); err != nil {
		log.Println("添加book出错：", err)
		return 0
	}
	return 1
}

// DeleteBook 删除图书,成功返回1
func DeleteBook(s string) int {
	if _, err := Db.Exec("DELETE from books where id=?", s); err != nil {
		panic(err)
		return 0
	}
	return 1
}

// UpdateBook 更新图书
func UpdateBook(m *model.Book) error {
	_, err := Db.Exec("update books set title=?,author=?,price=?,sales=?,stock=?,img_path=? where id=?", m.Title, m.Author, m.Price, m.Sales, m.Stock, m.ImgPath, m.Id)
	return err
}

// GetBook 获取图书详情
func GetBook(i string) *model.Book {
	row := Db.QueryRow("select id,title,author,price,sales,stock,img_path,sellerputaway from books where id=?", i)
	book := &model.Book{}
	if err := row.Scan(&book.Id, &book.Title, &book.Author, &book.Price, &book.Sales, &book.Stock, &book.ImgPath, &book.SellerPutaway); err != nil {
		return nil
	}
	return book
}

// GetAllBooks 获取全部图书
func GetAllBooks() (*model.Page, int) {
	if rows, err := Db.Query("select id,title,author,price,sales,stock,img_path,sellerputaway from books"); err != nil {
		log.Println("获取全部图书错误：", err)
		return nil, 0
	} else {
		var books []*model.Book
		for rows.Next() {
			book := &model.Book{}
			if err := rows.Scan(&book.Id, &book.Title, &book.Author, &book.Price, &book.Sales, &book.Stock, &book.ImgPath, &book.SellerPutaway); err != nil {
				log.Println("rows.scan错误：", err)
				return nil, 0
			} else {
				books = append(books, book)
			}
		}
		page := &model.Page{Books: books}
		return page, 1
	}
}
func QuerySellerBooks(i int) *model.Page {
	if rows, err := Db.Query("select * from books where sellerputaway=?", i); err != nil {
		log.Println("获取卖家的全部图书错误：", err)
		return nil
	} else {
		var books []*model.Book
		book := &model.Book{}
		if err := rows.Scan(&book.Id, &book.Title, &book.Author, &book.Price, &book.Sales, &book.Stock, &book.ImgPath, &book.SellerPutaway); err != nil {
			log.Println("rows.scan错误：", err)
			return nil
		} else {
			books = append(books, book)
		}
		page := &model.Page{Books: books}
		return page
	}
}

// QueryPageBookS 分页图书信息,p单页显示
func QueryPageBookS(i int, p int) *model.Page {
	row := Db.QueryRow("select count(*) from books where stock>0")
	var BooksSun int
	err := row.Scan(&BooksSun)
	onePageSize := p
	var allPage int
	if BooksSun%onePageSize != 0 {
		allPage = BooksSun/onePageSize + 1
	} else {
		allPage = BooksSun / onePageSize
	}
	rowS, err := Db.Query("select id, title, author, price, sellerputaway, stock, img_path, sales from books where stock > 0  limit ?,?", (i-1)*onePageSize, onePageSize)
	if err != nil {
		log.Println(err)
	}
	var bookS []*model.Book
	for rowS.Next() {
		book := &model.Book{}
		err = rowS.Scan(&book.Id, &book.Title, &book.Author, &book.Price, &book.SellerPutaway, &book.Stock, &book.ImgPath, &book.Sales)
		bookS = append(bookS, book)
	}
	fmt.Println(allPage)
	pageS := &model.Page{
		Books:    bookS,
		HowPages: allPage,
		Record:   onePageSize,
		Current:  i,
	}
	if err != nil {
		log.Println("QueryPageBooks:", err)
	}
	return pageS
}

// 分页图书信息卖家
func QueryPageBookSeller(i int, p int, name string) *model.Page {
	row := Db.QueryRow("select count(*) from books where sellerputaway=?", name)
	var BooksSun int
	err := row.Scan(&BooksSun)
	onePageSize := p
	var allPage int
	if allPage = BooksSun % onePageSize; allPage != 0 {
		allPage = BooksSun/onePageSize + 1
	}
	rowS, err := Db.Query("select id, title, author, price, sellerputaway, stock, img_path, sales from  books where sellerputaway=? limit ?,?", name, (i-1)*onePageSize, onePageSize)
	if err != nil {
		log.Println(err)
	}
	var bookS []*model.Book
	for rowS.Next() {
		book := &model.Book{}
		err = rowS.Scan(&book.Id, &book.Title, &book.Author, &book.Price, &book.SellerPutaway, &book.Stock, &book.ImgPath, &book.Sales)
		book.BookState = "normal"
		bookS = append(bookS, book)
	}
	pageS := &model.Page{
		Books:    bookS,
		HowPages: allPage,
		Record:   onePageSize,
		Current:  i,
	}
	if err != nil {
		log.Println("QueryPageBooks:", err)
	}
	return pageS
}
