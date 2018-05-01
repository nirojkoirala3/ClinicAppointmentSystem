<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
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
		<h3><spring:message code="MedicalHistory" /></h3>
		<hr>
		<table class="table">
			<thead>
				<tr>
					<th><spring:message code="AppointmentDate" /></th>
					<th><spring:message code="AppointmentSymptomps" /></th>
					<th><spring:message code="AppointmentDiagnosis" /></th>
					<th><spring:message code="AppointmentMedication" /></th>
					<th><spring:message code="AppointmentDosages" /></th>
				</tr>
			</thead>
			<tbody id="prescription-list">
				<c:forEach items="${prescriptions}" var="prescription">
					<tr>
						<td><fmt:formatDate value="${prescription.date}" type="date" pattern="MM-dd-yyyy" /></td>
						<td>${prescription.symptomps}</td>
						<td>${prescription.diagnosis}</td>
						<td>${prescription.medication}</td>
                         <td>${prescription.dosages}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
	<script type="text/javascript"
		src="<c:url value='/resources/js/doctor.js'/>"></script>
</body>
</html>