<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>S'Inscrire</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>

	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

	<div class="main">

		<!-- Sign up form -->
		<section class="signup">
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Inscription</h2>
					
						<form method="post" action="Inscription" class="register-form"
							id="register-form">
							<div class="form-group">
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Nom"  required/>
							</div>
							<div class="form-group">
								<label for="lastname"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="lastname" id="lastname" placeholder="Votre Pr�nom" required />
							</div>
							<div class="form-group">
								<label for="pseudo"><i
									class="zmdi zmdi-account material-icons-pseudo"></i></label> <input
									type="text" name="pseudo" id="pseudo" placeholder="Pseudo" />
							</div>
							
							<div class="form-group">
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder=" Email" required />
							</div>
							<div class="form-group">
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Mot de passe"  required/>
							</div>
							<div class="form-group">
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Retape le mot de passe" />
							</div>
							<div class="form-group">
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="Login.jsp" class="signup-image-link">J'ai d�j� un compte</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
	<script type="text/javascript">
	 // document.getElementById("register-form").addEventListener("submit", function(event) {
		
		var status = document.getElementById("status").value;
		if(status === 'succes') {
			swal("F�licitation", "Compte cr�er avec succ�s", "success");
		}else if(status === 'pass') {
			swal("Oups", "Mot de passe non identique", "error"
		  )};
		else swal("Desol�", "Renseigner tous les champs correctement", "error");
		event.preventDefault();
	  //});
	</script>


</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>