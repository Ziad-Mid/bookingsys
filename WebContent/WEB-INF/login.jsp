<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>BookingSys - Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css" />

<!-- STYLE CSS -->
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/mycs.css" />
<link rel="stylesheet" href="css/registerStyle.css" />
<link rel="stylesheet" href="css/boot.min.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
	$(document).ready(function() {
		$("#myModal").modal("show");
	});
</script>
<style>
.ici {
	color: red;
	text-decoration:underline;
}

.hey {
	color: black;
}
</style>
</head>

<body>
	<div class="wrapper" style="background-image: url('image/joe.jpg')">
	<a class="button_hover theme_btn_two" href="/bookingsys"><i
					class="zmdi zmdi-arrow-left"></i> Accueil 
				</a>
		<div class="inner">
			<div class="image-holder">
				<img src="image/ensa.png" alt="" />
			</div>
			<form action="login" method="post">
				<h3>Connectez-vous</h3>
				<div class="form-wrapper">
					<input type="email" placeholder="Entrer votre Email" name="email"
						class="form-control" value="${personne.email}" /> <i
						class="zmdi zmdi-email"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="Entrer le mot de passe"
						class="form-control" name="password" /> <i class="zmdi zmdi-lock"></i>
				</div>
				<div class="form-wrapper">
					<p class="hey">
						Vous n'avez pas un compte? <a href="signup" class="ici">Créez un.</a>
					</p>
				</div>
				<button type="submit" class="button_hover theme_btn_two"
					style="margin-top: 15px; font-size: 12px;">
					Se connecter<i class="zmdi zmdi-arrow-right"></i>
				</button>
				<c:if test="${ !empty form.erreurs['login'] }">
					<div class="bs-example">
						<div id="myModal" class="modal fade" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Erreur d'authentification</h5>
										<span class="close" data-dismiss="modal"> &times;</span>
									</div>
									<div class="modal-body">
										<p>
											<c:out value="${ form.erreurs['login']}" />
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
				<c:if
					test="${ !empty form.erreurs['password'] || !empty form.erreurs['email']  }">
					<div class="bs-example">
						<div id="myModal" class="modal fade" tabindex="-1">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Erreur d'authentification</h5>
										<span class="close" data-dismiss="modal"> &times;</span>
									</div>
									<div class="modal-body">
										<p>
											<c:out value="${ form.erreurs['email']}" />
										</p>
										<p>
											<c:out value="${ form.erreurs['password']}" />
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</form>
		</div>
	</div>
</body>
</html>
