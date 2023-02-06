package model

import (
	"log"
	"testing"
)

func TestVerify_SellerName(t *testing.T) {
	u := &User{SellerName: "小王"}
	v := Verify{u}
	log.Println(v.SellerName())
}
