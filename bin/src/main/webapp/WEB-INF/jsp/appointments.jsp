<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/patient.css'/>" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h1>List of Appointments</h1>
		<table>
			<thead>
				<tr>
					<th>id</th>
					<th>Patient Name</th>
					<th>Description</th>
					<th>Appointment Status</th>
					<th>Cancel Appointment</th>
					<th>Confirm Appointment</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${appointments}" var="appointment">
					<tr>
						<td>${appointment.id}</td>
						<td>${appointment.patient.firstName}</td>
						<td>${appointment.description}</td>
						<td>${appointment.bookingtype}</td>
						<td><a href="<c:url value="/receptionist/appointment/cancel?id=${appointment.id}" />">Cancel</a></td>
						<td><a href="<c:url value="/receptionist/appointment/confirm?id=${appointment.id}" />">Confirm</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>