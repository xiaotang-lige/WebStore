package web

import (
	"bookStore/model"
	"encoding/json"
	"log"
	"net/http"
)

func Test(w http.ResponseWriter, r *http.Request) {
	m := &model.NavState{}
	m.R(r)
	m.Head()
	ss, err := json.Marshal(m)
	if err != nil {
		log.Println(err)
		return
	}
	w.Write(ss)
}
