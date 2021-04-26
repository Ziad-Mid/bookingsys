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
</head>
<style>
.form-control {
	width: 165px;
}
</style>
<body>
	<div class="wrapper" style="background-image: url('image/sys.jpg')">
		<div class="inner">
			<form action="signup" method="post">
				<div class="form-wrapper">
					<input type="text" class="form-control" name="authcode"
						placeholder="Code de vérification">
				</div>
				<div class="form-wrapper">
					<button class="button_hover theme_btn_two" name="submitverif"
						type="submit" data-toggle="modal" data-target="#myModal">Vérifier</button>
				</div>
			</form>

			<c:if test="${ !empty erreurcode }">
				<div class="bs-example">
					<div id="myModal" class="modal fade" tabindex="-1">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Erreur de vérification</h5>
									<span class="close" data-dismiss="modal"> &times;</span>
								</div>
								<div class="modal-body">
									<p class="errors">
										<c:out value="${ erreurcode}" />
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#myModal").modal("show");
	});
</script>
</html>

