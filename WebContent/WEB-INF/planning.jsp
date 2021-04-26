<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="icon" href="image/favicon.png" type="image/png">
<title>Planning</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="vendors/linericon/style.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="vendors/nice-select/css/nice-select.css">
<link rel="stylesheet" href="vendors/owl-carousel/owl.carousel.min.css">
<!-- main css -->
<link rel="stylesheet" href="css/style.css">
<link rel="stylesheet" href="css/responsive.css">
</head>
<body>
	<c:import url="/WEB-INF/header.jsp" />
				<div class="container accomodation_area section_gap">
					<c:if test="${ !empty valide }">
						<table class="table table-hover table-dark">
							<thead class="thead-dark">
								<tr>
									<th scope="col" style="width: 20%">#Réservation</th>
									<th scope="col" style="width: 20%">Personne</th>
									<th scope="col" style="width: 20%">Salle réservé</th>
									<th scope="col" style="width: 20%">Date de réservation</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${valide}" var="mapReservations"
									varStatus="vs">
									<c:set var="nom"
										value="${ mapReservations.getPersonne().getNomComplet() }" />
									<c:set var="salle"
										value="${ mapReservations.getSalle().getNom() }" />
									<c:set var="date" value="${ mapReservations.getDate()  }" />
									<c:set var="id" value="${ mapReservations.getId()}" />
									<tr data-toggle="modal" data-target="#info${vs.index }">
										<th scope="row">#<c:out value="${id }" /></th>
										<td><c:out value="${nom }" /></td>
										<td><c:out value="${salle }" /></td>
										<td><c:out value="${date }" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</c:if>
					<c:if test="${ empty valide }">
						<h1>Aucune réservation.</h1>
					</c:if>
					<c:forEach items="${valide}" var="mapReservations" varStatus="vs">
						<c:set var="date" value="${ mapReservations.getDate()  }" />
						<c:set var="heured" value="${ mapReservations.getHeureDebut() }" />
						<c:set var="heuref" value="${ mapReservations.getHeureFin() }" />
						<c:set var="id" value="${ mapReservations.getId()}" />
						<c:set var="motif" value="${ mapReservations.getMotif()}" />
						<div id="info${vs.index }" class="modal fade" role="dialog">
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
													<th scope="row">Id Réservation</th>
													<td>#${id }</td>
												</tr>
												<tr>
													<th scope="row">Date de Réservation</th>
													<td>${date }</td>
												</tr>
												<tr>
													<th scope="row">Heure de Début</th>
													<td>${heured }</td>
												</tr>
												<tr>
													<th scope="row">Heure de Fin</th>
													<td>${heuref }</td>
												</tr>
											</tbody>
										</table>
										<table class="table">
											<tbody>
												<tr>
													<th scope="row" style="text-align: center;">Motif</th>
												</tr>
												<tr>
													<td>${motif}</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div class="modal-footer">
										<button type="button" class="button_hover theme_btn_two"
											data-dismiss="modal">Fermer</button>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>
				</div>
	<c:import url="/WEB-INF/footer.jsp" />
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/popper.js"></script>
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
	<script>
		$("[data-toggle='toggle']").click(function() {
			var selector = $(this).data("target");
			$(selector).toggleClass('in');
		});
	</script>
</body>
</html>