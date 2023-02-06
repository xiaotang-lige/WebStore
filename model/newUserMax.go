package model

type UserS struct {
	Id string
}

func (u *UserS) Query() *User {
	return nil
}
func (u *UserS) Add() {

}
