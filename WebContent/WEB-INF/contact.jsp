<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="image/favicon.png" type="image/png">
<title>Contact</title>
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
	<!--================Header Area =================-->
	<c:import url="/WEB-INF/header.jsp" />
	<!--================Header Area =================-->

	<!--================Breadcrumb Area =================-->
	<section class="breadcrumb_area blog_banner_two">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle f_48">Contact</h2>
				<ol class="breadcrumb">
					<li><a href="/bookingsys">Home</a></li>
					<li class="active">Contact</li>
				</ol>
			</div>
		</div>
	</section>
	<!--================Breadcrumb Area =================-->

	<!--================Blog Area =================-->
	<section class="blog_area single-post-area">
		<div class="container">
			<div class="row">
				<div class="col-lg posts-list">
					<div class="comment-form">
						<h4>Laisser un message</h4>
						<form method="post" action="contact">
							<div class="form-group form-inline">
								<div class="form-group col-lg-6 col-md-6 name">
									<input type="text" class="form-control" id="name" name="nom"
										placeholder="Nom Complet">
								</div>
								<div class="form-group col-lg-6 col-md-6 email">
									<input type="email" class="form-control" id="email"
										name="email" placeholder="Email">
								</div>
							</div>
							<div class="form-group">
								<input type="text" class="form-control" name="objet"
									id="subject" placeholder="Objet">
							</div>
							<div class="form-group">
								<textarea class="form-control mb-10" rows="5" name="message"
									placeholder="Message"></textarea>
							</div>
							<button type="submit" class="button_hover theme_btn_two">Envoyer
							</button>
							<c:if
								test="${ !empty form.erreurs['nom'] || !empty form.erreurs['email'] || !empty form.erreurs['objet'] || !empty form.erreurs ['message'] }">

								<div id="myModal" class="modal fade">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" style="margin: 0 auto">Erreur
													d'envoie</h5>
											</div>
											<div class="modal-body">
												<p>
													<c:out value="${ form.erreurs['nom']}" />
												</p>
												<p>
													<c:out value="${ form.erreurs['email']}" />
												</p>
												<p>
													<c:out value="${ form.erreurs['objet']}" />
												</p>
												<p>
													<c:out value="${ form.erreurs['message']}" />
												</p>
											</div>
											<div class="modal-footer">
												<button type="button" class="button_hover theme_btn_two"
													data-dismiss="modal">Fermer</button>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</form>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!--================ start footer Area  =================-->
	<c:import url="/WEB-INF/footer.jsp" />
	<!--================ End footer Area  =================-->


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script
		src="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.js"></script>
	<script src="vendors/nice-select/js/jquery.nice-select.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/stellar.js"></script>
	<script src="vendors/lightbox/simpleLightbox.min.js"></script>
	<script src="js/custom.js"></script>
	<script>
		$(document).ready(function() {
			$("#myModal").modal("show");
		});
	</script>
</body>
</html>