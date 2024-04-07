package main

import (
	"encoding/gob"
	"fmt"
	"log"
	"net/http"
	"time"

	"github.com/adiozdaniel/hiltons/internal/config"
	"github.com/adiozdaniel/hiltons/internal/handlers"
	"github.com/adiozdaniel/hiltons/internal/render"
	"github.com/adiozdaniel/hiltons/internal/routes"
	"github.com/adiozdaniel/hiltons/models"
	"github.com/alexedwards/scs/v2"
)

const portNumber = ":8080"

// declare a variable for session
var session *scs.SessionManager

func main() {
	//what the session will store
	gob.Register(models.Reservation{})

	//change this to true when in production
	config.App.InProduction = false

	// Initialize session store
	session = scs.New()
	session.Lifetime = 24 * time.Hour
	// you can store in database, we wont
	// persist even after browser is closed or restarted
	session.Cookie.Persist = true
	session.Cookie.SameSite = http.SameSiteLaxMode
	// for http in development mode check the config
	// session.Cookie.Secure = false
	session.Cookie.Secure = config.App.InProduction

	// initialize session
	config.App.Session = session

	tc, err := render.CreateTempCache()
	if err != nil {
		fmt.Println("Something went wrong at the main", err)
	}

	config.App.TemplateCache = tc
	config.App.UseCache = false

	repo := handlers.NewRepo(&config.App)
	handlers.NewHandlers(repo)
	render.NewTemplates(&config.App)

	fmt.Printf("Server running on port: %s\n", portNumber)

	srv := &http.Server{
		Addr:    portNumber,
		Handler: routes.Routes(&config.App),
	}

	err = srv.ListenAndServe()
	if err != nil {
		log.Fatal("Server Error", err)
	}
}
