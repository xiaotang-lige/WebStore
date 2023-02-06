package dao

import (
	"crypto/rand"
	"fmt"
	"github.com/google/uuid"
	"log"
)

// CreateUuId 生成UUID
func CreateUuId() (uuid string) {
	u := new([16]byte)
	_, err := rand.Read(u[:])
	if err != nil {
		log.Fatalln("Cannot generate UUID", err)
	}
	u[8] = (u[8] | 0x40) & 0x7F
	u[6] = (u[6] & 0xF) | (0x4 << 4)
	uuid = fmt.Sprintf("%x%x", u[0:4], u[4:6])
	return
}
func UuId() string {
	u, _ := uuid.NewUUID()
	return CreateUuId() + u.String() + CreateUuId()
}
