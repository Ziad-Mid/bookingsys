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
<title>Découvrir nos salles</title>
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
	<%@include file="/WEB-INF/header.jsp"%>
	<!--================Header Area =================-->

	<!--================Breadcrumb Area =================-->
	<section class="breadcrumb_area">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">DÉCOUVRIR NOS SALLES</h2>
				<ol class="breadcrumb">
					<li><a href="/bookingsys">Home</a></li>
					<li>Découvrir nos salles</li>
					<li class="active"><c:out value="${ pavillon }" /></li>
				</ol>
			</div>
		</div>
	</section>
	<!--================Breadcrumb Area =================-->

	<!--================ Accomodation Area  =================-->
	<section class="accomodation_area section_gap">
		<div class="container">
			<div class="section_title text-center">
				<h2 class="title_color">
					<c:out value="${ pavillon }" />
				</h2>
				<h5>
					Capacité<small>/Type</small>
				</h5>
			</div>
			<div class="row mb_30">
				<c:forEach items="${salles}" var="mapSalles" varStatus="vs">
					<div class="col-lg-3 col-sm-6">
						<div class="accomodation_item text-center">
							<div class="hotel_img">
								<img src="image/${ mapSalles.getType() }.jpg" alt=""> <button
									class="btn theme_btn button_hover" data-toggle="modal"
									data-target="#salle${vs.index }">Voir plus</button>
							</div>
							<h4 class="sec_h4">
								<c:out value="${ mapSalles.getNom() }" />
							</h4>
						</div>
					</div>
				</c:forEach>
			</div>
			<c:forEach items="${salles}" var="mapSalles" varStatus="vs">
				<c:set var="nom" value="${ mapSalles.getNom()  }" />
				<c:set var="capacite" value="${ mapSalles.getCapacite() }" />
				<c:set var="type" value="${ mapSalles.getType() }" />
				<c:set var="id" value="${ mapSalles.getId()}" />
				<div id="salle${vs.index }" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" style="margin: 0 auto">Information</h4>
							</div>
							<div class="modal-body">
								<table class="table">
									<tbody>
										<tr>
											<th scope="row">Id Salle</th>
											<td>#${id }</td>
										</tr>
										<tr>
											<th scope="row">Salle</th>
											<td>${nom }</td>
										</tr>
										<tr>
											<th scope="row">Type de salle</th>
											<td>${type }</td>
										</tr>
										<tr>
											<th scope="row">Capacité</th>
											<td>${capacite }</td>
										</tr>
									</tbody>
								</table>
								<div class="modal-footer">
									<button type="button" class="button_hover theme_btn_two"
										data-dismiss="modal">fermer</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>

	<!-- Modal content-->

	<!--================ Accomodation Area  =================-->
	<!--================Booking Tabel Area =================-->
	<c:import url="/WEB-INF/footer.jsp" />


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="plugins/jquery/index.js"></script>
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
</body>
</html>