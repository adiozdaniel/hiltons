package handlers

import (
	"encoding/json"
	"fmt"
	"log"
	"net/http"

	"github.com/adiozdaniel/hiltons/internal/config"
	"github.com/adiozdaniel/hiltons/internal/forms"
	"github.com/adiozdaniel/hiltons/internal/render"
	"github.com/adiozdaniel/hiltons/models"
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

	render.RenderTemplate(w, r, "home.page.tpl", &models.TemplateData{})
}

// Family - is the Family suite page
func (m *Repository) Family(w http.ResponseWriter, r *http.Request) {
	render.RenderTemplate(w, r, "family.page.tpl", &models.TemplateData{})
}

// Business - is the Business Suite Page
func (m *Repository) Business(w http.ResponseWriter, r *http.Request) {
	render.RenderTemplate(w, r, "business.page.tpl", &models.TemplateData{})
}

// Availability - handles the GET for search-availability
func (m *Repository) Availability(w http.ResponseWriter, r *http.Request) {
	render.RenderTemplate(w, r, "search-availability.page.tpl", &models.TemplateData{})
}

// PostAvailability - handles the POST for search-availability
func (m *Repository) PostAvailability(w http.ResponseWriter, r *http.Request) {
	start := r.Form.Get("start")
	end := r.Form.Get("end")

	w.Write([]byte(fmt.Sprintf("Start date is %s and end date is %s", start, end)))
}

type jsonResponse struct {
	OK      bool   `json:"ok"`
	Message string `json:"message"`
}

// AvailabilityJSON - handles requests for availability and sends back the response
func (m *Repository) AvailabilityJSON(w http.ResponseWriter, r *http.Request) {
	resp := jsonResponse{
		OK:      false,
		Message: "Available",
	}

	out, err := json.MarshalIndent(resp, "", "	")
	if err != nil {
		log.Println(err)
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(out)
}

// Reservation - is the Reservation page
func (m *Repository) Reservation(w http.ResponseWriter, r *http.Request) {
	var emptyReservation models.Reservation
	data := make(map[string]interface{})
	data["reservation"] = emptyReservation

	render.RenderTemplate(w, r, "make-reservation.page.tpl", &models.TemplateData{
		Form: forms.New(nil),
		Data: data,
	})
}

// PostReservation - handles the posting of a reservation form
func (m *Repository) PostReservation(w http.ResponseWriter, r *http.Request) {
	err := r.ParseForm()
	if err != nil {
		log.Println(err)
		return
	}

	reservation := models.Reservation{
		FirstName: r.Form.Get("first_name"),
		LastName:  r.Form.Get("last_name"),
		Email:     r.Form.Get("email"),
		Phone:     r.Form.Get("phone"),
	}

	form := forms.New(r.PostForm)
	// form.Has("first_name", r)
	form.Required("first_name", "last_name", "email")
	form.MinLength("first_name", 3, r)
	form.IsEmail("email")

	if !form.Valid() {
		data := make(map[string]interface{})
		data["reservation"] = reservation

		render.RenderTemplate(w, r, "make-reservation.page.tpl", &models.TemplateData{
			Form: form,
			Data: data,
		})
		return
	}
}

// Contact - is the Contact page
func (m *Repository) Contact(w http.ResponseWriter, r *http.Request) {
	render.RenderTemplate(w, r, "contact.page.tpl", &models.TemplateData{})
}

// About - is the About Us page
func (m *Repository) About(w http.ResponseWriter, r *http.Request) {
	// perform some business logic
	stringMap := make(map[string]string)
	stringMap["test"] = "Hello, again."

	remoteIP := m.App.Session.GetString(r.Context(), "remote_ip")
	stringMap["remote_ip"] = remoteIP

	//send data
	render.RenderTemplate(w, r, "about.page.tpl", &models.TemplateData{
		StringMap: stringMap,
	})
}
