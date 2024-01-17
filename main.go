package main

import (
	"net/http"
	"src/oapi"

	"github.com/labstack/echo/v4"
)

type Server struct{}

type HelloWorld struct {
	Message string `json:"message"`
}

func (h Server) CreatePets(ctx echo.Context) error {
	return ctx.JSON(http.StatusOK, HelloWorld{
		Message: "hiyoko",
	})
}

func (h Server) ListPets(ctx echo.Context, params oapi.ListPetsParams) error {
	return ctx.JSON(http.StatusOK, HelloWorld{
		Message: "hiyoko",
	})
}

func (h Server) ShowPetById(ctx echo.Context, petId string) error {
	return ctx.JSON(http.StatusOK, HelloWorld{
		Message: "hiyoko",
	})
}

func main() {
	e := echo.New()
	s := Server{}

	oapi.RegisterHandlers(e, s)
	e.Logger.Fatal(e.Start(":8080"))
}
