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
		<h1>Welcome to Clinic Appointment System!</h1>
		<c:if test="${empty currentUser}">
			<p>You can log in with one of the following demo accounts:</p>
			<ul>
				<li>admin@mum.edu/admin</li>
				<li>doctor@mum.edu/doctor</li>
				<li>receptionist@mum.edu/receptionist</li>
				<li>patient@mum.edu/patient</li>
			</ul>
		</c:if>
		<c:if test="${not empty currentUser}">
			<p>Select a task that you would like to perform:</p>
			<c:choose>
				<c:when test="${currentUser.role == 'ROLE_ADMIN'}">
					<tags:admin></tags:admin>
				</c:when>
				<c:when test="${currentUser.role == 'ROLE_DOCTOR'}">
					<tags:doctor></tags:doctor>
				</c:when>
				<c:when test="${currentUser.role == 'ROLE_RECEPTIONIST'}">
					<tags:receptionist></tags:receptionist>
				</c:when>
				<c:when test="${currentUser.role == 'ROLE_PATIENT'}">
					<tags:patient></tags:patient>
				</c:when>
			</c:choose>
		</c:if>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>