<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Mon compte</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet"
	href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>

	<%@include file="/WEB-INF/header.jsp"%>
	<c:if test="${ !empty sessionScope.personne }">
		<c:set var="nom" value="${ personne.nomComplet }" />
		<c:set var="email" value="${ personne.email }" />
		<c:set var="type" value="${ personne.type }" />
		<c:set var="password" value="${ personne.password }" />
		<section class="breadcrumb_area blog_banner_two">
			<div class="overlay bg-parallax" data-stellar-ratio="0.8"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="page-cover text-center">
					<h2 class="page-cover-tittle f_48">
						Bonjour , Mr
						<c:out value="${ nom }" />
						</a>
					</h2>
					<ol class="breadcrumb">
						<li><a href="/bookingsys">Accueil</a></li>
						<li class="active">Mon Compte</li>
					</ol>
				</div>
			</div>
		</section>
		<section class="blog_area single-post-area">
			<div class="container">
				<div class="row">
					<div class="col-lg-4">
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget author_widget">
								<h3 class="widget_title">Mon Profil</h3>
								<svg xmlns="http://www.w3.org/2000/svg" width="150" height="150"
									fill="grey" class="bi bi-person-circle" viewBox="0 0 16 16">
  <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
  <path fill-rule="evenodd"
										d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
</svg>
								<h2>
									<c:out value="${ nom }" />
								</h2>
								<p>
									<c:out value="${ type }" />
								</p>
							</aside>
						</div>
					</div>
					<div class="col-lg">
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget author_widget">
								<h3 class="widget_title">Mes coordonnées</h3>
								<form class="row contact_form" action="account" method="post">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<div class="form-group">
											<input type="text" placeholder="Entrer votre name"
												class="form-control" id="name" name="nom" value="${nom}">
											<span>${form.erreurs["nom"] }</span>
										</div>
										<div class="form-group">
											<input type="email" class="form-control" id="email"
												name="email" placeholder="Entrer votre adresse email"
												value="${email}">
										</div>
										<div class="form-group">
											<input type="text" class="form-control" id="type" name="type"
												placeholder="Entrer votre type" value="${type}" readonly>
										</div>
										<div class="form-group">
											<input type="password" class="form-control" name="lastpass"
												placeholder="Entrer l'ancien mot de passe">
											<span>${form.erreurs["lastpass"] }</span>
										</div>
										<div class="form-group">
											<input type="password" class="form-control" name="password"
												placeholder="Entrer un nouveau mot de passe">
											<span>${form.erreurs["password"] }</span>
										</div>
										<div class="form-group">
											<input type="password" class="form-control" name="passconf"
												placeholder="Confirmer le nouveau mot de passe">
											<span>${form.erreurs["passconf"] }</span>
										</div>
									</div>
									<div class="col-md-12 text-right">
										<button type="submit" value="submit"
											class="btn button_hover theme_btn_two">Mise à jour</button>
									</div>
								</form>
							</aside>
						</div>
					</div>
				</div>
		</section>
	</c:if>
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="plugins/jquery/index.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script
		src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="js/custom.js"></script>
</body>
</html>
