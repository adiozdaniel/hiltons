{{template "base" .}}
{{define "content"}}
<div class="container">
	<div class="row">
		<div class="col">
			<h1>This is the about page</h1>
			<p>Please leave your contacts</p>
			<p>Follow us on Tweeter and Facebook</p>

			<p>This came from the template: {{index .StringMap "test"}}</p>
			<p>
				{{if ne (index .StringMap "remote_ip") ""}}
				Your remote IP address is: {{index .StringMap "remote_ip"}}
				{{else}}
				Problem getting Your IP Address. Visit <a href="/">Home Page</a>
				{{ end }}
			</p>
		</div>
	</div>
	{{ end }}
</div>
