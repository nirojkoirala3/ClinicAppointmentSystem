<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link href="<c:url value='/resources/css/modal.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/doctor.css'/>" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h1>Your Medical History</h1>
		<table>
			<thead>
				<tr>
					<th>Date</th>
					<th>Symptomps</th>
					<th>diagnosis</th>
					<th>medication</th>
					<th>dosages</th>
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