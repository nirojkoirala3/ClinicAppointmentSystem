<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value='/resources/css/doctor.css'/>" rel="stylesheet" />
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
	<div id="container" >
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h3>Your details</h3>
		<hr>
		
		
			<div id="PassportSizePhoto">
				<p>
					<img id="doctorImage" src="<c:url value="/resources/images/${doctor.lastName}_${doctor.id}.jpg"></c:url>" alt="doctor Image"/> 
				
				</p>
			</div>
			
			<div id="detailForm">
				
				<p>
					<label class="field-label">First Name</label>
					<span>${doctor.firstName}</span>
				</p>
				<p>
					<label class="field-label">Last Name</label>
					<span>${doctor.lastName}</span>
				</p>

				<p>
					<label class="field-label">Email</label>
					<span>${doctor.email}</span>
				</p>
			</div>
			
			<p id="button-panel">
			
			<!-- <hr> -->
			</p>
		
	</div>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>