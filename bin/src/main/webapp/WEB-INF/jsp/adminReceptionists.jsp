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
<link href="<c:url value='/resources/css/modal.css'/>" rel="stylesheet" />
<link href="<c:url value='/resources/css/receptionist.css'/>" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/home' />">Go Back</a>
		</div>
		<h1>List of Receptionists</h1>
		<p>
			<button id="add-receptionist">Add Receptionist</button>
		</p>
		<table>
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th></th>
					
				</tr>
			</thead>
			<tbody id="receptionist-list">
				<c:forEach items="${receptionists}" var="receptionist">
					<tr id="receptionist-${receptionist.id}">
						<td>${receptionist.firstName}</td>
						<td>${receptionist.lastName}</td>
						<td>${receptionist.email}</td>
						<td>
							<a class="edit" data-id="${receptionist.id}">Edit</a> |
							<a class="delete" data-id="${receptionist.id}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="receptionist-modal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<input type="hidden" id="app-path" value="<c:url value='/'/>" />
				<input type="hidden" id="receptionistId" />
				<input type="hidden" id="userId" />
				<h1 class="modal-title">Add New Receptionist</h1>
				<p>
					<label for="firstName" class="field-label">First Name</label>
					<input type="text" id="firstName" name="firstName" />
				</p>
				<p>
					<label for="lastName" class="field-label">Last Name</label>
					<input type="text" id="lastName" name="lastName" />
				</p>
				<p>
					<label for="email" class="field-label">Email</label>
					<input type="text" id="email" name="email" />
				</p>
				<p>
					<label for="password" class="field-label">Password</label>
					<input type="password" id="password" name="password" />
				</p>
				<button id="save-receptionist">Save</button>
			</div>
		</div>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
	<script type="text/javascript" src="<c:url value='/resources/js/receptionist.js'/>"></script>
</body>
</html>