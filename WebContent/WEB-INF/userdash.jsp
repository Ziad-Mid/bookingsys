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
<title>Mon espace</title>
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
.modal-p {
	color: red;
}
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
									data-toggle="collapse" href="#collapse1" role="button"
									aria-expanded="false" aria-controls="collapse1"
									data-parent="#accordion">
										<p>Nouvelle réservation</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse5" role="button"
									aria-expanded="false" aria-controls="collapse5"
									data-parent="#accordion">
										<p>Mes notifications (${SizeMyNotif })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse3" role="button"
									aria-expanded="false" aria-controls="collapse3"
									data-parent="#accordion">
										<p>Mes réservations validées (${SizeMyReservationTraited })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse2" role="button"
									aria-expanded="false" aria-controls="collapse2"
									data-parent="#accordion">
										<p>Mes réservations en attente
											(${SizeMyReservationNotTraited })</p>
								</a></li>
								<li><a class="d-flex justify-content-between"
									data-toggle="collapse" href="#collapse4" role="button"
									aria-expanded="false" aria-controls="collapse4"
									data-parent="#accordion">
										<p>Mes réservations refusées (${SizeMyReservationRefused })</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="collapse show" id="collapse1">
						<div class="container accomodation_area section_gap">
							<div class="hotel_booking_area position">
								<div class="container">
									<div class="hotel_booking_table">
										<div class="col-lg-1"></div>
										<div class="col-lg-11">
											<div class="boking_table">
												<form method="post" action="dashboard">
													<div class="row">
														<div class="col-md-4">
															<div class="book_tabel_item">
																<div class="form-group">
																	<div class="book_tabel_item">
																		<div class="input-group">
																			<select class="wide" name="pavillon" id="pavillon"
																				onchange="sample(this.value);">
																				<c:forEach items="${pavillons}" var="mapPavillons">
																					<option
																						value="<c:out value="${ mapPavillons.getPavillon() }"/>"><c:out
																							value="${ mapPavillons.getPavillon() }" /></option>
																				</c:forEach>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="form-group">
																	<div class="input-group">
																		<input type="text" class="form-control"
																			placeholder="Heure de Début" name="hd"  /> <span
																			class="input-group-addon"> <i
																			class="fa fa-calendar" aria-hidden="true"></i>
																		</span>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4">
															<div class="book_tabel_item">
																<div class="p1 box" id="salles1">
																	<div class="input-group">
																		<select class="wide" name="salle1">
																			<c:forEach items="${salles1}" var="mapSalles">
																				<option
																					data-display="<c:out value="${ mapSalles.getNom() }"/>"><c:out
																						value="${ mapSalles.getNom() }" /></option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
																<div class="p2 box" id="salles2">
																	<div class="input-group">
																		<select class="wide" name="salle2">
																			<c:forEach items="${salles2}" var="mapSalles">
																				<option
																					data-display="<c:out value="${ mapSalles.getNom() }"/>"><c:out
																						value="${ mapSalles.getNom() }" /></option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
																<div class="p3 box" id="salles3">
																	<div class="input-group">
																		<select class="wide" name="salle3">
																			<c:forEach items="${salles3}" var="mapSalles">
																				<option
																					data-display="<c:out value="${ mapSalles.getNom() }"/>"><c:out
																						value="${ mapSalles.getNom() }" /></option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
																<div class="p4 box" id="salles4">
																	<div class="input-group">
																		<select class="wide" name="salle4">
																			<c:forEach items="${salles4}" var="mapSalles">
																				<option
																					data-display="<c:out value="${ mapSalles.getNom() }"/>"><c:out
																						value="${ mapSalles.getNom() }" /></option>
																			</c:forEach>
																		</select>
																	</div>
																</div>
																<div class="form-group">
																	<div class="input-group">
																		<input type="text" class="form-control"
																			placeholder="Heure de Fin" name="hf" /> <span
																			class="input-group-addon"> <i
																			class="fa fa-calendar" aria-hidden="true"></i>
																		</span>
																	</div>
																</div>
															</div>
														</div>
														<div class="col-md-4">
															<div class="book_tabel_item">
																<div class="form-group">
																	<div class="input-group">
																		<input type="text" class="form-control"
																			placeholder="Date de réservation" name="dr" /> <span
																			class="input-group-addon"> <i
																			class="fa fa-calendar" aria-hidden="true"></i>
																		</span>
																	</div>
																</div>
																<button type="submit"
																	class="book_now_btn button_hover swalDefaultSuccess">Vérifier</button>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-lg">
															<div class="book_tabel_item">
																<div class="form-group">
																	<div class="input-group">
																		<textarea name="motif" class="form-control"
																			placeholder="Motif de réservation : Quelle activité vous voulez pratiquer dans cette salle ?"
																			cols="20"></textarea>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<c:if
														test="${!empty form.erreurs['motif'] || !empty form.erreurs['hf'] || !empty form.erreurs['hd'] || !empty form.erreurs['salle'] || !empty form.erreurs['dr']  }">
														<div class="bs-example">
															<div id="myModal" class="modal fade" tabindex="-1">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Erreur</h5>
																			<span class="close" data-dismiss="modal">
																				&times;</span>
																		</div>
																		<div class="modal-body">
																			<p class="modal-p">
																				<c:out value="${ form.erreurs['dr']}" />
																			</p>
																			<p class="modal-p">
																				<c:out value="${ form.erreurs['hd']}" />
																			</p>
																			<p class="modal-p">
																				<c:out value="${ form.erreurs['hf']}" />
																			</p>
																			<p class="modal-p">
																				<c:out value="${ form.erreurs['motif']}" />
																			</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</c:if>
													<c:if
														test="${ !empty form.erreurs['statut'] && empty form.erreurs['motif'] && empty form.erreurs['hf'] && empty form.erreurs['hd'] && empty form.erreurs['salle'] && empty form.erreurs['dr']  }">
														<div class="bs-example">
															<div id="myModal" class="modal fade" tabindex="-1">
																<div class="modal-dialog">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title">Information</h5>
																			<span class="close" data-dismiss="modal">
																				&times;</span>
																		</div>
																		<div class="modal-body">
																			<p>
																				<c:out value="${ form.erreurs['statut']}" />
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
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="collapse" id="collapse2">
						<div class="container accomodation_area section_gap">
							<c:if test="${ !empty attente }">
								<table class="table table-hover">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="width: 15%">#Réservation</th>
											<th scope="col" style="width: 20%">Personne</th>
											<th scope="col" style="width: 20%">Salle réservé</th>
											<th scope="col" style="width: 20%">Date de réservation</th>
											<th scope="col" style="width: 5%"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${attente}" var="mapReservations"
											varStatus="vs">
											<c:set var="nom"
												value="${ mapReservations.getPersonne().getNomComplet() }" />
											<c:set var="salle"
												value="${ mapReservations.getSalle().getNom() }" />
											<c:set var="date" value="${ mapReservations.getDate()  }" />
											<c:set var="id" value="${ mapReservations.getId()}" />
											<tr>
												<th scope="row" data-toggle="modal"
													data-target="#info${vs.index }">#<c:out value="${id }" /></th>
												<td data-toggle="modal" data-target="#info${vs.index }"><c:out
														value="${nom }" /></td>
												<td data-toggle="modal" data-target="#info${vs.index }"><c:out
														value="${salle }" /></td>
												<td data-toggle="modal" data-target="#info${vs.index }"><c:out
														value="${date }" /></td>
												<td>
													<button class="button_hover theme_btn_two"
														data-toggle="modal" data-target="#opt-ref">Annuler</button>
												</td>
											</tr>

											<div id="opt-ref" class="modal fade" role="dialog">
												<div class="modal-dialog">
													<!-- Modal content-->
													<div class="modal-content">
														<div class="modal-header">
															<h4 class="modal-title" style="margin: 0 auto">Remarque</h4>
														</div>
														<div class="modal-body">
															<h5>Est-ce-que vous êtes sur d'annuler cette
																réservation ?</h5>
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-danger"
																data-dismiss="modal">Non</button>
															<a href="dashboard/refuser?id=${id }"><button
																	type="button" class="btn btn-success">Oui</button></a>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${ empty attente }">
								<h1>Aucune réservation est mise en ligne.</h1>
							</c:if>
							<c:forEach items="${attente}" var="mapReservations"
								varStatus="vs">
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
					<div class="collapse" id="collapse3">
						<div class="container accomodation_area section_gap">
							<c:if test="${ !empty valide }">
								<table class="table">
									<thead class="thead-dark">
										<tr>
											<th scope="col" style="width: 20%">#Réservation</th>
											<th scope="col" style="width: 20%">Salle réservé</th>
											<th scope="col" style="width: 20%">Date de réservation</th>
											<th scope="col" style="width: 20%">Heure de début</th>
											<th scope="col" style="width: 20%">Heure de fin</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${valide}" var="mapReservations">
											<c:set var="salle"
												value="${ mapReservations.getSalle().getNom() }" />
											<c:set var="date" value="${ mapReservations.getDate()  }" />
											<c:set var="id" value="${ mapReservations.getId()}" />
											<c:set var="heured"
												value="${ mapReservations.getHeureDebut() }" />
											<c:set var="heuref"
												value="${ mapReservations.getHeureFin() }" />
											<c:set var="motif" value="${ mapReservations.getMotif()}" />
											<tr>
												<th scope="row">#<c:out value="${id }" /></th>
												<td><c:out value="${salle }" /></td>
												<td><c:out value="${date }" /></td>
												<td><c:out value="${heured }" /></td>
												<td><c:out value="${heuref }" /></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
							<c:if test="${ empty valide }">
								<h1>Aucune réservation validée.</h1>
							</c:if>
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
													data-dismiss="modal">Close</button>
											</div>
										</div>

									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="collapse" id="collapse5">
						<div class="container accomodation_area section_gap comments-area">
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
								<hr>
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
		var d1 = document.getElementById("salles1");
		var d2 = document.getElementById("salles2");
		var d3 = document.getElementById("salles3");
		var d4 = document.getElementById("salles4");
		d1.style.display = "block";
		d2.style.display = "none";
		d3.style.display = "none";
		d4.style.display = "none";
		function sample(value) {
			if (value == "Pavillon H") {
				d1.style.display = "block";
				d2.style.display = "none";
				d3.style.display = "none";
				d4.style.display = "none";
			} else if (value == "Pavillon F") {
				d1.style.display = "none";
				d2.style.display = "block";
				d3.style.display = "none";
				d4.style.display = "none";
			} else if (value == "Pavillon K") {
				d1.style.display = "none";
				d2.style.display = "none";
				d3.style.display = "block";
				d4.style.display = "none";
			} else if (value == "Espace Amphis") {
				d1.style.display = "none";
				d2.style.display = "none";
				d3.style.display = "none";
				d4.style.display = "block";
			}
		}
	</script>
	<script>
		$(document).ready(function() {
			$("#myModal").modal("show");
		});
	</script>
</body>
</html>