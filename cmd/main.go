package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"
	"path/filepath"

	"github.com/a-h/templ"
	"github.com/labstack/echo/v4"
	_ "modernc.org/sqlite"

	"chore-manager/db"
	mysql "chore-manager/sql"
	"chore-manager/views"
)

var choresDB *sql.DB

func main() {
	ctx := context.Background()

	choresDB = mustConnectDB(ctx)
	defer choresDB.Close()

	e := echo.New()

	e.Static("/static", "assets")

	e.GET("/", listHandler)
	e.Logger.Fatal(e.Start(":3000"))
}

func mustConnectDB(ctx context.Context) *sql.DB {
	const dbPath = "db"

	err := os.MkdirAll(dbPath, os.ModePerm)
	if err != nil {
		panic(err)
	}
	// defer os.RemoveAll(dir)

	fn := filepath.Join(dbPath, "chores.db")
	fmt.Printf("Using database file: %s", fn)

	db, err := sql.Open("sqlite", fn)
	if err != nil {
		panic(err)
	}

	if _, err := db.ExecContext(ctx, mysql.DDL); err != nil {
		log.Panicf("creating schema: %v", err)
	}

	// if _, err := db.ExecContext(ctx, mysql.Seed); err != nil {
	// 	log.Panicf("inserting seed: %v", err)
	// }

	return db
}

func listHandler(c echo.Context) error {

	errors := []string{}
	successes := []string{}

	queries := db.New(choresDB)
	duties, err := queries.FindDuties(c.Request().Context())
	if err != nil {
		errors = append(errors, fmt.Sprintf("Error while loading duties: %v", err))
	}

	for _, d := range duties {
		fmt.Printf("Duty: %+v", d)
	}

	return renderView(c, views.ListIndex(
		"List",
		errors, successes,
		views.List(duties),
	))
}

func renderView(c echo.Context, cmp templ.Component) error {
	c.Response().Header().Set(echo.HeaderContentType, echo.MIMETextHTML)

	return cmp.Render(c.Request().Context(), c.Response().Writer)
}
