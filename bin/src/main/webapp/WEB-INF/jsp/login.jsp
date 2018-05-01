<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/login.css'/>" rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<form action="<spring:url value="/login"></spring:url>" method="post">
			<h1>Login</h1>
			<p>
				<label for="username" class="field-label">Username</label>
				<input type="text" id="username" name="username" maxlength="50" required="required" />
			</p>
			<p>
				<label for="password" class="field-label">Password</label>
				<input type="password" id="password" name="password" maxlength="50" required="required" />
			</p>
			<p>
				<label id="remember-me"><input type="checkbox" id="rememberMe" name="rememberMe" /> Remember Me?</label>
			</p>
			<p>
				<input type="submit" value="Login" />
			</p>
			<security:csrfInput />
		</form>
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