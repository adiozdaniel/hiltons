package config

import (
	"html/template"
	"log"

	"github.com/alexedwards/scs/v2"
)

var App AppConfig

//AppConfig holds the application config
type AppConfig struct {
	UseCache      bool
	TemplateCache map[string]*template.Template
	InfoLog       *log.Logger
	// for setting up cookies
	InProduction bool
	Session      *scs.SessionManager
}
