{{template "base" .}}
{{define "content"}}

<!-- carousel -->
<div
	id="carouselExampleDark"
	class="carousel carousel-dark slide carousel-fade"
	data-bs-ride="carousel"
>
	<div class="carousel-indicators">
		<button
			type="button"
			data-bs-target="#carouselExampleDark"
			data-bs-slide-to="0"
			class="active"
			aria-current="true"
			aria-label="Slide 1"
		></button>
		<button
			type="button"
			data-bs-target="#carouselExampleDark"
			data-bs-slide-to="1"
			aria-label="Slide 2"
		></button>
		<button
			type="button"
			data-bs-target="#carouselExampleDark"
			data-bs-slide-to="2"
			aria-label="Slide 3"
		></button>
		<button
			type="button"
			data-bs-target="#carouselExampleDark"
			data-bs-slide-to="3"
			aria-label="Slide 4"
		></button>
	</div>
	<div class="carousel-inner">
		<div
			class="carousel-item active"
			data-bs-interval="10000"
		>
			<img
				src="/static/images/hq720.jpg"
				height="400"
				class="d-block w-100"
				alt="hq720"
			/>
			<div
				class="carousel-caption d-none d-md-block"
				style="color: rgb(252, 251, 252); margin-bottom: 235px"
			>
				<h2 class="slide-label titles">Norfolk Supreme Quarters</h2>
				<hr />
				<p
					class="titles"
					style="
						color: rgb(63, 2, 63);
						margin-bottom: 30px;
						text-align: center;
						background-color: #333;
						color: bisque;
						padding: 0.5em;
						height: 1em;
						border-radius: 1em;
						display: inline;
					"
				>
					Magnificence at it's supreme outfit
				</p>
			</div>
		</div>
		<div
			class="carousel-item"
			data-bs-interval="2000"
			aria-label="Slide 2"
		>
			<img
				src="/static/images/hq721.jpg"
				height="400"
				class="d-block w-100"
				alt="hq721"
			/>
			<div
				class="carousel-caption d-none d-md-block"
				style="color: bisque; margin-bottom: 235px"
			>
				<h2 class="slide-label titles">Hilton Crest Premiers</h2>
				<hr />
				<p
					class="titles"
					style="
						color: rgb(63, 2, 63);
						margin-bottom: 30px;
						text-align: center;
						background-color: #333;
						color: bisque;
						padding: 0.5em;
						height: 1em;
						border-radius: 1em;
						display: inline;
					"
				>
					The Cradle of Opulence and prowess
				</p>
			</div>
		</div>
		<div
			class="carousel-item"
			data-bs-interval="2000"
			aria-label="Slide 3"
		>
			<img
				src="/static/images/room6.jpg"
				height="400"
				class="d-block w-100"
				alt="hq722"
			/>
			<div
				class="carousel-caption d-none d-md-block"
				style="color: bisque; margin-bottom: 235px"
			>
				<h2 class="slide-label titles">Crystal Palace Homes</h2>
				<hr />
				<p
					class="titles"
					style="
						color: rgb(63, 2, 63);
						margin-bottom: 30px;
						text-align: center;
						background-color: #333;
						color: bisque;
						padding: 0.5em;
						height: 1em;
						border-radius: 1em;
						display: inline;
					"
				>
					Only the Royals take over the seats
				</p>
			</div>
		</div>
		<div
			class="carousel-item"
			data-bs-interval="2000"
			aria-label="Slide 4"
		>
			<img
				src="/static/images/room7.png"
				height="400"
				class="d-block w-100"
				alt="hq723"
			/>
			<div
				class="carousel-caption d-none d-md-block"
				style="color: bisque; margin-bottom: 235px"
			>
				<h2 class="slide-label titles">Masai Mara Kings</h2>
				<hr />
				<p
					class="titles"
					style="
						color: rgb(63, 2, 63);
						margin-bottom: 30px;
						text-align: center;
						background-color: #333;
						color: bisque;
						padding: 0.5em;
						height: 1em;
						border-radius: 1em;
						display: inline;
					"
				>
					The Epitome of elegance and natural beauty
				</p>
			</div>
		</div>
	</div>
	<button
		class="carousel-control-prev"
		type="button"
		data-bs-target="#carouselExampleDark"
		data-bs-slide="prev"
	>
		<span
			class="carousel-control-prev-icon"
			aria-hidden="true"
		></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button
		class="carousel-control-next"
		type="button"
		data-bs-target="#carouselExampleDark"
		data-bs-slide="next"
	>
		<span
			class="carousel-control-next-icon"
			aria-hidden="true"
		></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>
<!-- End of carousel-->
<div style="background-color: #333; color: bisque">
	<div class="container">
		<div class="row">
			<div class="col mt-4">
				<h1 class="text-center">Get a Home away from Home</h1>
				<p>
					This is a supreme Luxury on the brinks of the Indian Ocean, that will
					give you and your loved ones, memories that will last a lifetime!
				</p>
				<p>
					Sunnier days are right around the corner. Whether you're planning for
					a spring break adventure or getting a head start on summer travel
					plans, let Hilton help curate your warm weather getaway.
				</p>
			</div>
		</div>

		<div class="row">
			<div class="col text-center">
				<a
					href="/search-availability"
					class="reserve-btn mb-3 titles"
					>Make Reservation Now!</a
				>
			</div>
		</div>
	</div>
</div>
{{ end }}
