{{template "base" .}}
{{define "content"}}
<!-- Reservations content -->
<div style="background-color: #1d1614; padding: 1em 0 0 2em; color: bisque">
	<div class="row">
		<div class="col">
			<h1>Reservations</h1>
			<h2>Check Reservations here</h2>
		</div>
	</div>

	<form
		action="/search-availability"
		method="post"
		novalidate
		class="needs-validation"
	>
		<input
			type="hidden"
			name="csrf_token"
			value="{{.CSRFToken}}"
		/>
		<div class="input-group mb-1 w-50 mt-2">
			<label
				class="input-group-text"
				for="rooms"
				>Choose your package</label
			>
			<select
				class="form-select"
				id="rooms"
				name="rooms"
			>
				<option value="business">Business Class</option>
				<option value="family">Family Class</option>
			</select>
		</div>

		<div id="reservation-dates">
			<label
				class="mb-1"
				for="start"
				>Starting Date &nbsp;</label
			>
			<input
				placeholder="Arrival..."
				required
				class="form-control w-50"
				type="text"
				name="start"
				style="background-color: #1d1614; color: bisque"
				id="start_date"
				aria-describedby="startDateHelp"
			/>
			<p class="text-center w-50">
				<small id="startDateHelp">Please choose a date from the Calendar</small>
			</p>
			<label
				class="mb-1"
				for="end"
				>End Date &nbsp;</label
			>
			<input
				placeholder="Departure..."
				required
				class="form-control w-50"
				type="text"
				name="end"
				style="background-color: #1d1614; color: bisque"
				id="start_date"
				aria-describedby="startDateHelp"
			/>
			<p class="text-center w-50">
				<small id="startDateHelp">Please choose a date from the Calendar</small>
			</p>
		</div>
		<button
			class="reserve-btn titles"
			type="submit"
		>
			Check Availability
		</button>
	</form>
</div>
<!-- Reservations content -->
{{ end }}

{{define "js"}}
<script>
	const elem = document.getElementById("reservation-dates");
	const rangepicker = new DateRangePicker(elem, {
		format: "dd-mm-yyyy",
	});
</script>
{{ end }}
