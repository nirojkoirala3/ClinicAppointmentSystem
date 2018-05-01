<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinic Appointment System</title>
<link href="<c:url value='/resources/css/receptionist.css'/>"
	rel="stylesheet" />
<link href="<c:url value='/resources/css/main.css'/>" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
	<div class="container">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<div class="row">
			<div
				class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">

				<div class="panel panel-info">
					<div class="panel-heading"></div>
					<div class="panel-body">
						<div class="row">
							<div class="col-md-3 col-lg-3 " align="center">
								<div id="PassportSizePhoto">
							<p>
								<img alt="image" id="receptionistImage" src="<c:url value="/resources/images/${receptionist.lastName}_${receptionist.id}.jpg"></c:url>" alt=""/> 
							
							</p>
						</div>
							</div>

						</div>
						<div class=" col-md-9 col-lg-9 " align="center">
							<table class="table table-user-information">
								<tbody>
									<tr>
										<td>FirstName:</td>
										<td>${receptionist.firstName}</td>
									</tr>
									<tr>
										<td>LastName:</td>
										<td>${receptionist.lastName}</td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><a href="mailto:info@support.com">${receptionist.email}</a></td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<tags:footer></tags:footer>
</body>
</html>