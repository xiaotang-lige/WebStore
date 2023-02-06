package dao

import (
	"bookStore/model"
	"github.com/google/uuid"
	"io"
	"log"
	"net/http"
	"os"
	"strconv"
)

// UpImage  处理上传图片 用户名路径,m模式0创建logo 1创建资源图片
func UpImage(r *http.Request, user string, m int) *model.Image {
	//用户资源目录是否存在
	if _, err := os.Stat("views/seller/" + user); err != nil {
		os.Mkdir("views/seller/"+user, 0666)
	}
	p := "views/seller/" + user + "/"
	image := &model.Image{
		Bool: false,
		Path: "",
	}
	file, fileHeader, err := r.FormFile("ImageP")
	if err != nil {
		log.Println(err)
		file.Close()
		return nil
	}
	if fileHeader.Size > 1000000 {
		log.Println("图片太大了")
		file.Close()
		return nil
	}
	if fileHeader.Header["Content-Type"][0] != "image/png" {
		log.Println("请上传png/jpg格式")
		file.Close()
		return nil

	}
	path := ""
	if m == 0 {
		path = p + "logo.png"
	} else if m == 1 {
		id := strconv.Itoa(int(uuid.New().ID()))
		path = p + id + ".png"
		//检查文件名是否存在
		b := func(s string) bool {
			_, err = os.Stat(path)
			if err == nil {
				return true
			}
			return false
		}
		if b(path) {
			for {
				d := p + strconv.Itoa(int(uuid.New().ID())) + ".png"
				c := b(d)
				if c == false {
					path = d
					break
				}
			}
		}
	}

	or, err := os.Create(path)
	if err != nil {
		log.Println(err)
		file.Close()
		or.Close()
		return nil
	}
	copyLen, err := io.Copy(or, file)
	if err != nil {
		log.Println(err)

		return nil
	}
	if fileHeader.Size != copyLen {
		log.Println("复制出错！")
		file.Close()
		or.Close()
		return nil
	}
	defer file.Close()
	defer or.Close()
	image.Bool = true
	image.Path = path
	return image
}
