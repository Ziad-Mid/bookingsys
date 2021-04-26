<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>BookingSys</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="<c:url value ="/css/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value ="/vendors/linericon/style.css" />" />
<link rel="stylesheet"
	href="<c:url value ="/css/font-awesome.min.css" />" />
<link rel="stylesheet"
	href="<c:url value ="/vendors/owl-carousel/owl.carousel.min.css" />" />
<link rel="stylesheet"
	href="<c:url value ="/vendors/bootstrap-datepicker/bootstrap-datetimepicker.min.css" />" />
<link rel="stylesheet"
	href="<c:url value ="/vendors/nice-select/css/nice-select.css" />" />
<link rel="stylesheet"
	href="<c:url value ="/vendors/owl-carousel/owl.carousel.min.css" />" />
<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<!-- main css -->
<link rel="stylesheet" href="<c:url value ="/css/style.css" />" />
<link rel="stylesheet" href="<c:url value ="/css/styleText.css" />" />
<link rel="stylesheet" href="<c:url value ="/css/responsive.css" />" />
<link rel="stylesheet"
	href="<c:url value ="/plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css" />" />
<script>
	$(document).ready(function() {
		$("#opt-1").modal("show");
	});
	$(document).ready(function() {
		$("#opt-2").modal("show");
	});
</script>
</head>

<body>
	<!--================Header Area =================-->
	<c:import url="/WEB-INF/header.jsp" />

	<section class="banner_area">
		<div class="booking_table d_flex align-items-center">
			<div class="overlay bg-parallax" data-stellar-ratio="0.9"
				data-stellar-vertical-offset="0" data-background=""></div>
			<div class="container">
				<div class="banner_content text-center">
					<h6 data-aos="fade-down" data-aos-duration="1000">Sécurisons notre établissement</h6>
					<h2>
						Réserver <span class="txt-rotate" data-period="2000"
							data-rotate='[ "gratuitement.", "en toute sécurité.", "rapidement.", "en seule clique." ]'></span>
					</h2>
					<h3 data-aos="fade-left" data-aos-duration="1000">La sécurité c'est notre priorité</h3>
					<h4 data-aos="fade-right" data-aos-duration="1000">ENSA Agadir EN FORCE</h4>
					<c:if test="${ empty sessionScope.personne }">
						<a href="/bookingsys/login" class="btn theme_btn button_hover " data-aos="fade-up" data-aos-duration="1500">Commencer
							<i class="zmdi zmdi-arrow-right"></i>
						</a>
					</c:if>
					<c:if test="${ !empty sessionScope.personne}">
						<a href="/bookingsys/dashboard" class="btn theme_btn button_hover ">Espace
							Client</a>
					</c:if>
				</div>
			</div>
		</div>
	</section>
	<!--================Banner Area =================-->
	<!--================ Accomodation Area  =================-->
	<section class="accomodation_area section_gap" id="section2">
		<div class="container">
			<div class="section_title text-center">
				<h2 class="title_color" data-aos="zoom-in" data-aos-duration="1000">Nos Salles</h2>
				<p data-aos="zoom-in" data-aos-duration="1500" >Des larges salles bien climatisées sont à la disposition des
					étudiants et enseignant, qui prennent une grande capacité.</p>
			</div>
			<div class="row mb_30">
				<div class="col-lg-3 col-sm-6">
					<div class="accomodation_item text-center">
						<div class="hotel_img" data-aos="fade-right" data-aos-duration="1500">
							<img src="image/amphis.jpg" alt="" /> <a
								href="/bookingsys/salles?id=4" class="btn theme_btn button_hover">Voir
								plus</a>
						</div>
						<a href="#">
							<h4 class=" sec_h4"  data-aos="fade-up" data-aos-duration="1500">Espace Amphis</h4>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="accomodation_item text-center">
						<div class="hotel_img" data-aos="fade-up" data-aos-duration="1500">
							<img src="image/salle1.jpg" alt="" /> <a
								href="/bookingsys/salles?id=1" class="btn theme_btn button_hover">Voir
								plus</a>
						</div>
						<a href="#">
							<h4 class="sec_h4" data-aos="fade-up" data-aos-duration="1500">Pavillon H</h4>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="accomodation_item text-center">
						<div class="hotel_img" data-aos="fade-up" data-aos-duration="1500">
							<img src="image/salleK.jpg" alt="" /> <a
								href="/bookingsys/salles?id=2" class="btn theme_btn button_hover">Voir
								plus</a>
						</div>
						<a href="#">
							<h4 class="sec_h4" data-aos="fade-up" data-aos-duration="1500">Pavillon F</h4>
						</a>
					</div>
				</div>
				<div class="col-lg-3 col-sm-6">
					<div class="accomodation_item text-center">
						<div class="hotel_img" data-aos="fade-left" data-aos-duration="1500">
							<img src="image/salleK.jpg" alt="" /> <a
								href="/bookingsys/salles?id=3" class="btn theme_btn button_hover">Voir
								plus</a>
						</div>
						<a href="#">
							<h4 class="sec_h4" data-aos="fade-up" data-aos-duration="1500">Pavillon K</h4>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Accomodation Area  =================-->

	<!--================ Facilities Area  =================-->
	<section class="facilities_area section_gap" id="section1">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8"
			data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="section_title text-center">
				<h2 class="title_w" data-aos="zoom-in" data-aos-duration="1000" >Pour réserver</h2>
				<h6 class="title_w" data-aos="zoom-in" data-aos-duration="1500">Voir si vous étes éligible pour réserver une
					de nos salles</h6>
			</div>
			<div class="row mb_30">
				<div class="col-lg-4 col-md-6" data-aos="fade-right" data-aos-duration="1000">
					<div class="facilities_item">
						<h4 class="sec_h4">
							<i class="lnr lnr-book"></i>Enseignant
						</h4>
						<p>Chaque professeur à l'ENSA a la possibilité de réserver en
							tout moment, si une seance de rattrapage est soumis ou autre.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6" data-aos="fade-right" data-aos-duration="1500">
					<div class="facilities_item">
						<h4 class="sec_h4">
							<i class="lnr lnr-user"></i>Responsable de Club
						</h4>
						<p>Un responsable de club peut aussi réserver une de nos
							salles en tout moment à condition qu'il spécifie le genre de
							l'activité veut pratiquer.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-6" data-aos="fade-right" data-aos-duration="2000">
					<div class="facilities_item">
						<h4 class="sec_h4">
							<i class="lnr lnr-pencil"></i>Personne administratif
						</h4>
						<p>Le coté a été prise en considération aussi, chaque personne
							administratif a tout l'accés en tout moment dans le cadre
							universitaire.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ Facilities Area  =================-->

	<!--================ About History Area  =================-->
	<section class="about_history_area section_gap" id="section3">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d_flex align-items-center">
					<div class="about_content">
						<h2 class="title title_color" data-aos="fade-down" data-aos-duration="2000">A propos de nous</h2>
						<h4 data-aos="fade-right" data-aos-duration="2000">Mission & Vision</h4>
						<p data-aos="fade-up" data-aos-duration="2000">En raison de perte de quelques équipements à
							l'établissement, notre équipe a développé cette application web
							qui sert à gérer la réservation des salles en toute sécurité, et
							organiser la manière de quel les salles sont étés géré avant.</p>
						<a href="terms-conditions" class="button_hover theme_btn_two" data-aos="fade-up" data-aos-duration="2000">Termes
							et conditions</a>
					</div>
				</div>
				<div class="col-md-6" data-aos="zoom-in" data-aos-duration="2000">
					<video src="video/ads.mp4" width="600" height="300" autoplay loop
						muted controls></video>
				</div>
			</div>
		</div>
	</section>
	<!--================ start footer Area  =================-->
	<c:import url="/WEB-INF/footer.jsp" />
	<!--================ End footer Area  =================-->
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="plugins/jquery/jquery-3.2.1.min.js"></script>
	<script src="plugins/jquery/index.js"></script>
	<script src="plugins/sweetalert2/sweetalert2.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/mail-script.js"></script>
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
			$('a[href^="#"]').on('click', function(e) {
				e.preventDefault();
				var target = this.hash;
				var $target = $(target);
				$('html, body').stop().animate({
					'scrollTop' : $target.offset().top
				}, 900, 'swing', function() {
					// window.location.hash = target;
				});
			});
		});
	</script>
	<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
      AOS.init({
        duration: 3000,
        once: false,
      });
    </script>
</body>

</html>