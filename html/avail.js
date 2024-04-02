let attention = Prompt();
(function () {
	"use strict";
	window.addEventListener(
		"load",
		function () {
			//fetch all forms
			let forms = document.getElementsByClassName("needs-validation");

			//loop over and prevent submission
			Array.prototype.filter.call(forms, function (form) {
				form.addEventListener(
					"submit",
					function (event) {
						if (form.checkValidity() === false) {
							event.preventDefault();
							event.stopPropagation();
						}
						form.classList.add("was-validated");
					},
					false
				);
			});
		},
		false
	);
})();
const elem = document.getElementById("reservation-dates");
const rangepicker = new DateRangePicker(elem, {
	format: "dd-mm-yyyy",
});

function notify(msg, msgType) {
	notie.alert({
		type: msgType, // optional, default = 4, enum: [1, 2, 3, 4, 5, 'success', 'warning', 'error', 'info', 'neutral']
		text: msg,
		stay: true, // optional, default = false
		time: Number, // optional, default = 3, minimum = 1,
		position: "top", // optional, default = 'top', enum: ['top', 'bottom']
	});
}

function swal(title, text, icon, confirmButtonText) {
	Swal.fire({
		title: title, //'Error!',
		text: text, //'Do you want to continue',
		icon: icon, //'error',
		confirmButtonText: confirmButtonText, //'Cool'
	});
}

document.getElementById("checker");
addEventListener("click", function () {
	// notify("Hey, am clicked", "success")
	// swal('Warning', 'Do you want to continue', 'warning', 'Fatal!')
	// attention.toast({msg:"Failed!!!", icon:"error"});
	let html = `
					<form id="check-availability-form" action="" method="post" novalidate class="needs-validation">
						<div class="form-row">
							<div class="col">
								<div class="form-row" id="reservation-dates-modal">
									<div class="col">
										<input placeholder="Arrival..." disabled required class="form-control" type="text" name="start" style="background-color: #1d1614; color: bisque;" id="start" aria-describedby="startDateHelp">
									</div>
									<div class="col">
										<input placeholder="Arrival..." disabled required class="form-control" type="text" name="end" style="background-color: #1d1614; color: bisque;" id="end" aria-describedby="endDateHelp">
									</div>
								</div>
							</div>
						</div>
					</form>
				`;
	attention.custom({
		msg: html,
		title: "Choose your dates",
	});
});

function Prompt() {
	let toast = function (c) {
		const { msg = "", icon = "success", position = "top-end" } = c;

		const Toast = Swal.mixin({
			toast: true,
			position: position,
			showConfirmButton: false,
			timer: 3000,
			timerProgressBar: true,
			didOpen: (toast) => {
				toast.onmouseenter = Swal.stopTimer;
				toast.onmouseleave = Swal.resumeTimer;
			},
		});

		Toast.fire({
			icon: icon,
			title: msg,
		});
	};

	let success = function (c) {
		const { msg = "", icon = "success", footer = "am cool!" } = c;
		Swal.fire({
			icon: icon,
			title: "",
			text: msg,
			footer: `<a href="#">${footer}</a>`,
			background: "#ebeaca",
		});
	};

	let error = function (c) {
		const { msg = "", icon = "error", footer = "Something went wrong!" } = c;
		Swal.fire({
			icon: icon,
			title: "",
			text: msg,
			footer: `<a href="#">${footer}</a>`,
			background: "#ebeaca",
		});
	};

	async function custom(c) {
		const { msg = "", title = "" } = c;

		const { value: formValues } = await Swal.fire({
			title: title,
			html: msg,
			focusConfirm: false,
			showConfirmButton: true,
			showCancelButton: true,
			willOpen: () => {
				const elem = document.getElementById("reservation-dates-modal");
				const rp = new DateRangePicker(elem, {
					format: "dd-mm-yyyy",
					showOnFocus: true,
				});
			},
			preConfirm: () => {
				return [
					document.getElementById("start").value,
					document.getElementById("end").value,
				];
			},
		});
		if (formValues) {
			Swal.fire(JSON.stringify(formValues));
		}
	}

	// let toast = function() {
	//   console.log("button clicked and toasted");
	// }
	return {
		toast: toast,
		success: success,
		error: error,
		custom: custom,
	};
}
