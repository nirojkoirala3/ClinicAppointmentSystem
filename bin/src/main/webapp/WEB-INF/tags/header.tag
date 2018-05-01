<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="header">
	<a id="root-link" href="<c:url value="/" />">Clinic Appointment System</a>
	<div class="tools">
		<security:authorize access="isAnonymous()">
			<a href="<spring:url value="/registerPatient"></spring:url>">Sign Up</a> |
			<a href="<spring:url value='/login' />">Login</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<span>Hi, <strong>${currentUser.username}</strong>!</span>
			<a id="logout" onclick="document.getElementById('logout-form').submit();">Logout</a>
			<form id="logout-form" action="<spring:url value="/logout"></spring:url>" method="post" class="hidden">
				<security:csrfInput />
			</form>
		</security:authorize>
	</div>
</div>