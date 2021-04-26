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
<title>Admin Espace</title>
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
<style>
.admin{
color:red;
}
</style>
</head>
<body>
	<c:import url="/WEB-INF/header.jsp" />
	<section class="blog_area">
		<div class="container-fluid">
			<div class="row" id="accordion">
				<div class="col-lg-3">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<h3 class="widget_title">Profil</h3>
							<h4>Hi, ${personne.nomComplet }</h4>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Activitée</h4>
							<ul class="list_style cat-list">
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse1" role="button" aria-expanded="false"
									aria-controls="" data-parent="#accordion">
										<p>Mes notifications (${SizeMyNotif })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse6" role="button" aria-expanded="false"
									aria-controls="" data-parent="#accordion">
										<p>Ma boite de réception (${SizeMessage})</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse2" role="button"
									aria-expanded="false" aria-controls="collapse2"
									data-parent="#accordion">
										<p>Utilisateurs inscrits (${SizeUsers })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse3" role="button"
									aria-expanded="false" aria-controls="collapse3"
									data-parent="#accordion">
										<p>Réservations validées (${SizeReservationTraited })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse5" role="button"
									aria-expanded="false" aria-controls="collapse5"
									data-parent="#accordion">
										<p>Réservations en attente (${SizeReservationNotTraited })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse4" role="button"
									aria-expanded="false" aria-controls="collapse4"
									data-parent="#accordion">
										<p>Réservations refusées (${SizeReservationRefused })</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="collapse" id="collapse1">
						<div class="container accomodation_area section_gap comments-area">
							<c:if test="${!empty notifications}">
								<c:forEach items="${notifications}" var="mapReservations">
									<div class="comment-list">
										<div class="single-comment justify-content-between d-flex">
											<div class="user justify-content-between d-flex">
												<div class="desc">
													<h5 class="admin">
														<a>BookingSys - Admin</a>
													</h5>
													<p class="date">Le ${mapReservations.getTime() }</p>
													<p class="comment">${mapReservations.getText() }</p>
												</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:if>
							<c:if test="${empty notifications}">
							<h1>Aucune notification.</h1>
							</c:if>
						</div>
					</div>
					<div class="collapse show" id="collapse6">
						<div class="container accomodation_area section_gap comments-area">
							<c:if test="${!empty Messages}">
								<c:forEach items="${Messages}" var="mapMessages">
									<div class="comment-list">
										<div class="single-comment justify-content-between d-flex">
											<div class="user justify-content-between d-flex">
												<div class="desc">
													<h5 style="text-transform: uppercase;">${mapMessages.getNom()}</h5>
													<p class="date">Le ${mapMessages.getTime() }</p>
													<h6>Objet : “${mapMessages.getObjet() }”</h6>
													<p class="comment">${mapMessages.getMessage() }</p>
												</div>
											</div>
										</div>
										<hr>
									</div>
									<hr>
								</c:forEach>
							</c:if>
							<c:if test="${empty Messages}">
							<h1>Aucune message.</h1>
							</c:if>
						</div>
					</div>
					<div class="collapse" id="collapse2">
						<div class="container accomodation_area section_gap">
							<table class="table">
								<thead class="thead-dark">
									<tr>
										<th scope="col" style="width: 10%">#id</th>
										<th scope="col" style="width: 20%">Nom Complet</th>
										<th scope="col" style="width: 30%">Email</th>
										<th scope="col" style="width: 35%">Type</th>
										<th scope="col" style="width: 5%"></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${personnes}" var="mapPersonnes"
										varStatus="vs">
										<c:set var="nom" value="${ mapPersonnes.getNomComplet() }" />
										<c:set var="type" value="${ mapPersonnes.getType() }" />
										<c:set var="id" value="${ mapPersonnes.getId()}" />
										<c:set var="email" value="${ mapPersonnes.getEmail()}" />
										<tr>
											<th scope="row">#<c:out value="${id }" /></th>
											<td><c:out value="${nom }" /></td>
											<td><c:out value="${email }" /></td>
											<td><c:out value="${type }" /></td>
											<td>
												<button class="btn btn-danger" data-toggle="modal"
													data-target="#opt-ret">Retirer</button>
											</td>
										</tr>
										<div id="opt-ret" class="modal fade" role="dialog">
											<div class="modal-dialog">
												<!-- Modal content-->
												<div class="modal-content">
													<div class="modal-header">
														<h4 class="modal-title" style="margin: 0 auto">Remarque</h4>
													</div>
													<div class="modal-body">
														<h5>Est-ce-que vous êtes sur de retirer cet
															utilisateur ?</h5>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-danger"
															data-dismiss="modal">Non</button>
														<a href="#"><button type="button"
																class="btn btn-success">Oui</button></a>
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
					<div class="collapse" id="collapse3">
						<div class="container accomodation_area section_gap">
							<c:if test="${ !empty valide }">
								<table class="table table-hover">
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
								<h1>Aucune réservation validée.</h1>
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
															<td>${motif }</td>
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
					</div>
					<div class="collapse" id="collapse4">
						<div class="container accomodation_area section_gap">
							<c:if test="${ !empty refuse }">
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="width: 20%">#Réservation</th>
											<th scope="col" style="width: 20%">Personne</th>
											<th scope="col" style="width: 20%">Salle réservé</th>
											<th scope="col" style="width: 20%">Date de réservation</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${refuse}" var="mapReservations"
											varStatus="vs">
											<c:set var="nom"
												value="${ mapReservations.getPersonne().getNomComplet() }" />
											<c:set var="salle"
												value="${ mapReservations.getSalle().getNom() }" />
											<c:set var="date" value="${ mapReservations.getDate()  }" />
											<c:set var="id" value="${ mapReservations.getId()}" />
											<tr data-toggle="modal" data-target="#info2${vs.index }">
												<th scope="row">#<c:out value="${id }" /></th>
												<td><c:out value="${nom }" /></td>
												<td><c:out value="${salle }" /></td>
												<td><c:out value="${date }" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${ empty refuse }">
								<h1>Aucune réservation refusée.</h1>
							</c:if>
							<c:forEach items="${refuse}" var="mapReservations" varStatus="vs">
								<c:set var="date" value="${ mapReservations.getDate()  }" />
								<c:set var="heured" value="${ mapReservations.getHeureDebut() }" />
								<c:set var="heuref" value="${ mapReservations.getHeureFin() }" />
								<c:set var="id" value="${ mapReservations.getId()}" />
								<c:set var="motif" value="${ mapReservations.getMotif()}" />
								<div id="info2${vs.index }" class="modal fade" role="dialog">
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
															<td>${motif }</td>
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
					</div>
					<div class="collapse" id="collapse5">
						<div class="container accomodation_area section_gap">
							<c:if test="${ !empty attente }">
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="width: 15%">#Réservation</th>
											<th scope="col" style="width: 15%">Personne</th>
											<th scope="col" style="width: 20%">Salle réservé</th>
											<th scope="col" style="width: 20%">Date de réservation</th>
											<th scope="col" style="width: 15%"></th>
											<th scope="col" style="width: 15%"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${attente}" var="mapReservations"
											varStatus="v">
											<c:set var="nom"
												value="${ mapReservations.getPersonne().getNomComplet() }" />
											<c:set var="salle"
												value="${ mapReservations.getSalle().getNom() }" />
											<c:set var="date" value="${ mapReservations.getDate()  }" />
											<c:set var="id" value="${ mapReservations.getId()}" />
											<tr>
												<th scope="row" data-toggle="modal"
													data-target="#info1${v.index }">#<c:out value="${id }" /></th>
												<td data-toggle="modal" data-target="#info1${v.index }"><c:out
														value="${nom }" /></td>
												<td data-toggle="modal" data-target="#info1${v.index }"><c:out
														value="${salle }" /></td>
												<td data-toggle="modal" data-target="#info1${v.index }"><c:out
														value="${date }" /></td>
												<td><button class="btn btn-success" data-toggle="modal"
														data-target="#opt-v${v.index }">Valider</button></td>
												<td><button class="btn btn-danger" data-toggle="modal"
														data-target="#opt-r${v.index }">Refuser</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${ empty attente }">
								<h1>Aucune réservation en attente.</h1>
							</c:if>
							<c:forEach items="${attente}" var="mapReservations" varStatus="v">
								<c:set var="id" value="${ mapReservations.getId()}" />
								<div id="opt-v${v.index }" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" style="margin: 0 auto">Remarque</h4>
											</div>
											<div class="modal-body">
												<h5>
													Est-ce-que vous êtes sur de valider la réservation #
													<c:out value="${id }" />
													?
												</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Non</button>
												<a href="dashboard/valider?id=<c:out value="${id }" />"><button
														type="button" class="btn btn-success">Oui</button></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<c:forEach items="${attente}" var="mapReservations" varStatus="v">
								<c:set var="id" value="${ mapReservations.getId()}" />
								<div id="opt-r${v.index }" class="modal fade" role="dialog">
									<div class="modal-dialog">
										<!-- Modal content-->
										<div class="modal-content">
											<div class="modal-header">
												<h4 class="modal-title" style="margin: 0 auto">Remarque</h4>
											</div>
											<div class="modal-body">
												<h5>
													Est-ce-que vous êtes sur de refuser la réservation #
													<c:out value="${id }" />
													?
												</h5>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-danger"
													data-dismiss="modal">Non</button>
												<a href="dashboard/refuser?id=<c:out value="${id }" />"><button
														type="button" class="btn btn-success">Oui</button></a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<c:forEach items="${attente}" var="mapReservations" varStatus="v">
								<c:set var="date" value="${ mapReservations.getDate()  }" />
								<c:set var="heured" value="${ mapReservations.getHeureDebut() }" />
								<c:set var="heuref" value="${ mapReservations.getHeureFin() }" />
								<c:set var="id" value="${ mapReservations.getId()}" />
								<c:set var="motif" value="${ mapReservations.getMotif()}" />
								<div id="info1${v.index }" class="modal fade" role="dialog">
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
					</div>
				</div>
			</div>
		</div>
	</section>
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