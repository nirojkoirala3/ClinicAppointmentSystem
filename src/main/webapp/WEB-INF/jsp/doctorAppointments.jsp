<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h1>List of Appointments</h1>
		<table class="table">
			<thead>
				<tr>
					<th>#</th>
					<th>Patient Name</th>
					<th>Date</th>
					<th>Description</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${appointments}" var="appointment" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${appointment.patient.firstName} ${appointment.patient.lastName}</td>
						<td><fmt:formatDate value="${appointment.date}" type="date" pattern="MM-dd-yyyy" /></td>
						<td>${appointment.description}</td>
						<td><a href="<c:url value="/doctor/prescription"><c:param name="appointmentId" value="${appointment.id}"/></c:url>">Details</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>