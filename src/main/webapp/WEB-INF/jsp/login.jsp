<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/login.css'/>" rel="stylesheet" />
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<!-- <h1>Clinic Appointment Login</h1> -->


		<div class="login-section">
			<h2>Login</h2>
			<form id="loginForm"
				action="<spring:url value="/login"></spring:url>" method="post">

				<div class="form-group">
					<label for="username" class="field-label">User Name</label> <input
						type="text" name="username" class="form-control" id="username"
						placeholder="Username" maxlength="50">
				</div>

				<div class="form-group">
					<label for="password" class="field-label">Password</label> <input
						type="password" id="password" name="password" class="form-control"
						placeholder="Password" maxlength="50" />
				</div>
				
				<button type="submit" name="login-btn" class="btn btn-primary">Login</button>

				<security:csrfInput />
			</form>
		</div>
		<c:if test="${not empty error}">
			<p class="error">
				<spring:message code="AbstractUserDetailsAuthenticationProvider.badCredentials" />
			</p>
		</c:if>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>