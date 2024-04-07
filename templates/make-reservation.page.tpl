{{template "base" .}}
{{define "content"}}
<!-- Reservations content -->
<div style="background-color: #1d1614; padding: 1em 0 0 2em; color: bisque">
	<div class="my-container">
		<div class="col">
			<h1>Make Reservations</h1>
			<h2>Do your bookings here</h2>
		</div>

		{{$res := index .Data "reservation"}}

		<div class="container">
			<div class="col">
				<form
					action="/make-reservation"
					method="post"
					class=""
					novalidate
				>
					<input
						type="hidden"
						name="csrf_token"
						value="{{.CSRFToken}}"
					/>

					<div class="form-group mb-1 mt-2">
						<label for="first_name">First Name:</label>
						{{with .Form.Errors.Get "first_name"}}
						<label
							for="first_name"
							class="text-danger"
							>{{.}}</label
						>
						{{ end }}
						<input type="text" name="first_name" id="first_name"
						class="form-control
						{{with .Form.Errors.Get "first_name"}} is-invalid {{ end }}"
						value="{{ $res.FirstName }}" required />
					</div>

					<div class="form-group mb-1 mt-2">
						<label for="last_name">Last Name:</label>
						{{with .Form.Errors.Get "last_name"}}
						<label
							for="last_name"
							class="text-danger"
							>{{.}}</label
						>
						{{ end }}
						<input type="text" name="last_name" id="last_name"
						class="form-control
						{{with .Form.Errors.Get "last_name"}} is-invalid {{ end }}"
						value="{{ $res.LastName }}" required />
					</div>

					<div class="form-group mb-1 mt-2">
						<label for="email">Email Address:</label>
						{{with .Form.Errors.Get "email"}}
						<label
							for="email"
							class="text-danger"
							>{{.}}</label
						>
						{{ end }}
						<input type="email" name="email" id="email" class="form-control
						{{with .Form.Errors.Get "email"}} is-invalid {{ end }}" value="{{
							$res.Email
						}}" required />
					</div>

					<div class="form-group mb-1 mt-2 mb-2">
						<label for="phone">Phone Number:</label>
						{{with .Form.Errors.Get "phone"}}
						<label
							for="phone"
							class="text-danger"
							>{{.}}</label
						>
						{{ end }}
						<input type="phone" name="phone" id="phone" class="form-control
						{{with .Form.Errors.Get "phone"}} is-invalid {{ end }}" value="{{
							$res.Phone
						}}" required />
					</div>
					<hr />
					<input
						type="submit"
						class="reserve-btn titles"
						value="make reservation"
					/>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Reservations content -->
{{ end }}
