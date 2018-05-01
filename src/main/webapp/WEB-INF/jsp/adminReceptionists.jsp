<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/modal.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/receptionist.css'/>"
	rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h1>List of Receptionists</h1>
		<p>
			<a href="<c:url value='receptionist/addReceptionist'/>">Add Receptionist</a>
		</p>
		<table class="table">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>

				</tr>
			</thead>
			<tbody id="receptionist-list">
				<c:forEach items="${receptionists}" var="receptionist">
					<tr id="receptionist-${receptionist.id}">
						<td>${receptionist.firstName}</td>
						<td>${receptionist.lastName}</td>
						<td>${receptionist.email}</td>
						<td>
							<a class="edit btn btn-primary"	href="receptionist/addReceptionist/${receptionist.id}">Edit</a> 
							<a class="delete btn btn-primary" href="receptionist/deleteReceptionist/${receptionist.id}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>