package main

import (
	"github.com/a-h/templ"
	"github.com/labstack/echo/v4"

	"chore-manager/views"
)

func main() {
	e := echo.New()

	e.Static("/static", "assets")

	e.GET("/", homeHandler)
	e.Logger.Fatal(e.Start(":3000"))
}

func homeHandler(c echo.Context) error {
	titlePage := "Test"

	return renderView(c, views.HomeIndex(
		titlePage,
		[]string{}, []string{},
		// getFlashmessages(c, "error"),
		// getFlashmessages(c, "success"),
		views.Home(titlePage),
	))
}

func renderView(c echo.Context, cmp templ.Component) error {
	c.Response().Header().Set(echo.HeaderContentType, echo.MIMETextHTML)

	return cmp.Render(c.Request().Context(), c.Response().Writer)
}
