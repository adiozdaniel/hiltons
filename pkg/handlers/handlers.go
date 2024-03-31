package handlers

import (
	"net/http"

	"github.com/adiozdaniel/hiltons/models"
	"github.com/adiozdaniel/hiltons/pkg/config"
	"github.com/adiozdaniel/hiltons/pkg/render"
)

//Repo the repository used by the handlers
var Repo *Repository

/*using repository pattern*/
//Repository is the repository type
type Repository struct {
	App *config.AppConfig
}

// NewRepo creates a new repository
func NewRepo(a *config.AppConfig) *Repository {
	return &Repository{
		App: a,
	}
}

// NewHandlers sets the repository for the handlers
func NewHandlers(r *Repository) {
	Repo = r
}

// Home - is the Home page
func (m *Repository) Home(w http.ResponseWriter, r *http.Request) {
	remoteIP := r.RemoteAddr
	m.App.Session.Put(r.Context(), "remote_ip", remoteIP)

	render.RenderTemplate(w, "home.page.tpl", &models.TemplateData{})
}

// Home - is the Home page
func (m *Repository) About(w http.ResponseWriter, r *http.Request) {
	// perform some business logic
	stringMap := make(map[string]string)
	stringMap["test"] = "Hello, again."

	remoteIP := m.App.Session.GetString(r.Context(), "remote_ip")
	stringMap["remote_ip"] = remoteIP

	//send data
	render.RenderTemplate(w, "about.page.tpl", &models.TemplateData{
		StringMap: stringMap,
	})
}
