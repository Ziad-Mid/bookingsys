<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>BookingSys - Sign Up</title>
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
}
</style>
</head>

<body>

	<div class="wrapper" style="background-image: url('image/sys.jpg')">
	<a class="button_hover theme_btn_two" href="/bookingsys"><i
					class="zmdi zmdi-arrow-left"></i> Accueil 
				</a>
		<div class="inner">
			<div class="image-holder">
				<img src="image/learn.jpg" alt="" />
			</div>
			<form action="signup" method="post">
				<h3>Inscrivez-vous</h3>
				<div class="form-wrapper">
					<input type="text" placeholder="Nom complet" name="nom"
						class="form-control" value="${personne.nomComplet}" /> <i
						class="zmdi zmdi-account"></i>
				</div>
				<div class="form-wrapper">
					<input type="email" placeholder="Entrer une adresse email"
						class="form-control" name="email" value="${personne.email}">
					<i class="zmdi zmdi-email"></i>
				</div>
				<div class="form-wrapper">
					<select name="type" class="form-control">
						<option value="none" selected>Type</option>
						<option value="Enseignant">Enseignant</option>
						<option value="Responsable de club">Responsable de club</option>
						<option value="Responsable de réservation">Responsable de
							réservation</option>
					</select> <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="Enter le mot de passe"
						class="form-control" name="password" value="${personne.password}">
					<i class="zmdi zmdi-lock"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" placeholder="Confirmer le mot de passe"
						class="form-control" name="passconf" value=""> <i
						class="zmdi zmdi-lock"></i>
				</div>
				
				<a class="button_hover theme_btn_two" data-toggle="modal"
					data-target="#opt-con"> S'inscrire <i
					class="zmdi zmdi-arrow-right"></i>
				</a>
				
						<p >
							Vous avez un compte? <a href="login" class="ici">Connectez vous!</a>
						</p>
					
				<div id="opt-con" class="modal fade" role="dialog">
					<div class="modal-dialog">
					
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" style="margin: 0 auto">Remarque</h4>
							</div>
							<div class="modal-body">
								<h6>
									En cliquant sur ACCEPTER vous acceptera nos termes et conditions
									pour plus d'information cliquez <a href="terms-conditions"
										class="ici">ici</a>
								</h6>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="button_hover theme_btn_two"
									data-dismiss="modal">Fermer</button>
								<button class="button_hover theme_btn_two" name="submitsignup" type="submit">Accepter</button>
							</div>
						</div>
						
						
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<c:if
		test="${ (!empty form.erreurs['nom'] || !empty form.erreurs['email'] || !empty form.erreurs['password'] || !empty form.erreurs['type']) && empty form.erreurs['email_check']}">
		<div class="bs-example">
			<div id="myModal" class="modal fade" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Erreur d'authentification</h5>
							<span class="close" data-dismiss="modal"> &times;</span>
						</div>
						<div class="modal-body">
							<p class="errors">
								<c:out value="${ form.erreurs['nom']}" />
							</p>
							<p class="errors" >
								<c:out value="${ form.erreurs['email']}" />
							</p>
							<p class="errors">
								<c:out value="${ form.erreurs['type']}" />
							</p>
							<p class="errors">
								<c:out value="${ form.erreurs['password']}" />
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${ !empty form.erreurs['email_check']}">
		<div class="bs-example">
			<div id="myModal" class="modal fade" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">Erreur d'authentification</h5>
							<span class="close" data-dismiss="modal"> &times;</span>
						</div>
						<div class="modal-body">
							<p class="errors">
								<c:out value="${ form.erreurs['email_check']}" />
							</p>
						</div>
						<div class="modal-footer">
							<a href="login" class="button_hover theme_btn_two"> Se
								connecter <i class="zmdi zmdi-arrow-right"></i>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>
