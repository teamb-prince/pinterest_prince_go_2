package main

import (
	"log"

	"github.com/teamb-prince/pinterest_prince_go/config"
	"github.com/teamb-prince/pinterest_prince_go/logs"
	"github.com/teamb-prince/pinterest_prince_go/server"
)

func main() {
	c, err := config.ReadConfig()
	if err != nil {
		logs.Error("Invalid config: %s", err)
		panic(err)
	}

	sqlDB, err := connectToDb(c.DB.Host, c.DB.Port, c.DB.User, c.DB.Password, c.DB.DBName)
	if sqlDB != nil {
		defer sqlDB.Close()
	}
	if err != nil {
		logs.Error("DB connection failure: %s", err)
		panic(err)
	}

	err = server.Start(c.Server.Port, sqlDB)
	if err != nil {
		log.Fatal(err)
	}

}
