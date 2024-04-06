package routes

import (
	"log"
	"net/http"

	"github.com/adiozdaniel/hiltons/internal/config"
	"github.com/justinas/nosurf"
)

// WriteToConsole is a middleware that writes a message to the console
func WriteToConsole(next http.Handler, page string) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		log.Println(page)
		next.ServeHTTP(w, r)
	})
}

//NoSurf adds CSRF protection to all POST Requests
func NoSurf(next http.Handler) http.Handler {
	csrfHandler := nosurf.New(next)

	csrfHandler.SetBaseCookie(http.Cookie{
		HttpOnly: true,
		Path:     "/",
		Secure:   config.App.InProduction,
		SameSite: http.SameSiteLaxMode,
	})
	return csrfHandler
}

// SessionLoad loads and saves the sessions on every request
func SessionLoad(next http.Handler) http.Handler {
	return config.App.Session.LoadAndSave(next)
}
