<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Se Connecter</title>

<!-- Font Awesome icons-->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- Styles CSS -->
<link rel="stylesheet" href="css/style.css">
</head>
<body>
   <% 
    String con = request.getParameter("logout");
   
    // Vérifier si l'utilisateur a cliqué sur déconnecter
    if (con != null && con.equals("ok")) {
       // session.invalidate();
        session.setAttribute("name", null);
        //response.sendRedirect("Login.jsp");
    }
	%>
	<input type="hidden" id="status" value="<%= request.getParameter("status") %>">
	<div class="main">

		<!-- Formulaire de connexion -->
		<section class="sign-in">
			<div class="container">
				<div class="signin-content">
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="Image inscription">
						</figure>
						<a href="Inscription.jsp" class="signup-image-link">Créer un compte</a>
					</div>

					<div class="signin-form">
						<h2 class="form-title">Se Connecter</h2>
						<form method="post" action="Login" class="register-form" id="login-form" name="myForm">
							<div class="form-group">
								<label for="username"><i class="fas fa-user"></i></label>
								<input type="text" name="username" id="username" placeholder="Votre pseudo" />
							</div>
							<div class="form-group">
								<label for="password"><i class="fas fa-lock"></i></label>
								<input type="password" name="password" id="password" placeholder="Mot de passe" />
							</div>
							<div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
								<label for="remember-me" class="label-agree-term">
									<span><span></span></span>Se souvenir de moi
								</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signin" id="signin" class="form-submit" value="Se connecter" />
							</div>
						</form>
						<div class="social-login">
							<span class="social-label">Ou connectez-vous avec</span>
							<ul class="socials">
								<li><a href="#"><i class="fab fa-facebook"></i></a></li>
								<li><a href="#"><i class="fab fa-twitter"></i></a></li>
								<li><a href="#"><i class="fab fa-google"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		function verifierFormulaire() {
			var status = document.getElementById("status").value;
			if (status === 'failed') {
				swal("Oups", "Nom d'utilisateur ou mot de passe incorrect", "error");
			}
		}
		verifierFormulaire();
	</script>
    
</body>
</html>
