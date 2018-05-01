<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/prescription.css' />" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/doctor/appointment' />">Go Back</a>
		</div>
		<h1>Appointment Details</h1>
		<p>
			Patient Name:
			<strong>${appointment.patient.firstName} ${appointment.patient.lastName}</strong>
			<br />
			Date:
			<strong><fmt:formatDate value="${appointment.date}" type="date" pattern="MM-dd-yyyy" /></strong>
			<br />
			Description:
			<strong>${appointment.description}</strong>
		</p>
		<h2>List of Prescriptions</h2>
		<p>
		<a href="<c:url value='prescription/addPrescription?appointmentId=${appointment.id}'/>" class="btn btn-info">Add Prescription</a>
		</p>
		<table class="table">
			<thead>
				<tr>
					<th>Date</th>
					<th>Symptoms</th>
					<th>Diagnosis</th>
					<th>Medication</th>
					<th>Dosages</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="prescription-list">
				<c:forEach items="${prescriptions}" var="prescription">
					<tr id="prescription-${prescription.id}">
						<td><fmt:formatDate value="${prescription.date}" type="date" pattern="MM-dd-yyyy" /></td>
						<td>${prescription.symptomps}</td>
						<td>${prescription.diagnosis}</td>
						<td>${prescription.medication}</td>
						<td>${prescription.dosages}</td>
						<td>
							 <a class="edit" href="<c:url value='/doctor/prescription/edit/${prescription.id}'/>">Edit</a>
							<%-- <a class="edit" data-id="${prescription.id}">Edit</a> | --%>
							<%-- <a class="delete" data-id="${prescription.id}">Delete</a> --%>
							 <a class="delete" href="<c:url value='/doctor/prescription/delete/${prescription.id}'/>">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
	<%-- <script type="text/javascript" src="<c:url value='/resources/js/prescription.js'/>"></script> --%>
</body>
</html>