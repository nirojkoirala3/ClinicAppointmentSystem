<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/doctor.css'/>" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h1>List of Doctors</h1>
		<p>
		<a href="<c:url value='doctor/addDoctor'/>" class="btn btn-info">Add Doctor</a>
		</p>
		<table class="table">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Speciality</th>
					<th>Email</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="doctor-list">
				<c:forEach items="${doctors}" var="doctor">
					<tr id="doctor-${doctor.id}">
						<td>${doctor.firstName}</td>
						<td>${doctor.lastName}</td>
						<td>${doctor.speciality}</td>
						<td>${doctor.email}</td>
						<td>
							<a class="edit btn btn-primary" href="doctor/addDoctor/${doctor.id}" >Edit</a>
							<a class="delete btn btn-primary" href="doctor/deleteDoctor/${doctor.id}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
	<script type="text/javascript" src="<c:url value='/resources/js/doctor.js'/>"></script>
</body>
</html>