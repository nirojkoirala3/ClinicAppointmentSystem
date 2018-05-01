<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring" %>
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
			<a class="go-back" href="<c:url value='/home' />"><spring:message code="GoBack" /></a>
		</div>
		<h3><spring:message code="AppointmentStatus" /></h3>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th><spring:message code="AppointmentID" /></th>
					<th><spring:message code="AppointmentPatientName" /></th>
					<th><spring:message code="AppointmentDescription" /></th>
					<th><spring:message code="AppointmentStatus" /></th>
					<th><spring:message code="AppointmentDate" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${appointments}" var="appointment">
					<tr>
						<td>${appointment.id}</td>
						<td>${appointment.patient.firstName}</td>
						<td>${appointment.description}</td>
						<td>${appointment.bookingtype}</td>
						<td><fmt:formatDate pattern="MM-dd-yyyy HH:mm" value="${appointment.date}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>