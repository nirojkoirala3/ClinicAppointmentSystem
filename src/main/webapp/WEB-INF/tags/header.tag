<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div id="header">
	<a id="root-link" href="<c:url value="/" />">CLINIC APPOINTMENT SYSTEM</a>
	<div class="tools">

	<c:if test="${currentUser.role == 'ROLE_PATIENT'}">
			<a href="?language=en" >English</a> | <a href="?language=sw" >Swahili</a> | 
	</c:if>
			
		<security:authorize access="isAnonymous()">
			<a href="<spring:url value="/registerPatient"></spring:url>">Sign Up</a> |
			<a href="<spring:url value='/login' />">Login</a>
		</security:authorize>
		<security:authorize access="isAuthenticated()">
			<span><i><strong>User: <security:authentication property="principal.username" /></strong></i></span>
			&nbsp;&nbsp;&nbsp;><i><a id="logout" onclick="document.getElementById('logout-form').submit();">Logout</a></i>
			<form id="logout-form" action="<spring:url value="/logout"></spring:url>" method="post" class="hidden">
				<security:csrfInput />
			</form>
		</security:authorize>
	</div>
</div>