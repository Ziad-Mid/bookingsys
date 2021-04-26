<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header class="header_area">
	<div class="container">
		<nav class="navbar navbar-expand-lg navbar-light">
			<!-- Brand and toggle get grouped for better mobile display -->
			<ul class="nav navbar-nav menu_nav ml-auto">
				<li class="nav-item"><a class="nav-link"
					style="font-size: 20px; font-weight: 40px" href="/bookingsys">BookingSys</a>
				</li>
			</ul>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse offset"
				id="navbarSupportedContent">
				<ul class="nav navbar-nav menu_nav ml-auto">
					<li class="nav-item ${home_active }"><a class="nav-link" href="/bookingsys">Accueil</a>
					</li>
					<li class="nav-item submenu dropdown ${salle_active }"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false"
						href="salles">Découvrir nos salles</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="salles?id=4">Espaces
									Amphis</a></li>
							<li class="nav-item"><a class="nav-link" href="salles?id=1">Pavillon
									H</a></li>
							<li class="nav-item"><a class="nav-link" href="salles?id=2">Pavillon
									F</a></li>
							<li class="nav-item"><a class="nav-link" href="salles?id=3">Pavillon
									K</a></li>
						</ul></li>
					<li class="nav-item ${planning_active}"><a class="nav-link" href="planning">Planning
							des réservations</a></li>
					<li class="nav-item ${contact_active }"><a class="nav-link" href="contact">Contact</a>
					</li>
					<li class="nav-item submenu dropdown ${compte_active }"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">Mon
							compte </a> <%-- Si aucun client n'existe en session, affichage d'un message par défaut. --%>
						<c:choose>
							<c:when test="${ empty sessionScope.personne }">
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="signup">S'inscrire</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="login">Se
											connecter</a></li>
								</ul>
							</c:when>
							<c:otherwise>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="dashboard">Hi,
											<c:set var="username" value="${ personne.nomComplet }" /> <c:out
												value="${ username }" />
									</a></li>
									<li class="nav-item"><a class="nav-link" href="account">Mon Profil</a></li>
									<li class="nav-item"><a class="nav-link"
										href="deconnexion">Déconnexion</a></li>
								</ul>
							</c:otherwise>
						</c:choose></li>
				</ul>
			</div>
		</nav>
	</div>
</header>