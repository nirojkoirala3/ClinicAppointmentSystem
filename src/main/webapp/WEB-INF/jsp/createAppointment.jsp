<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
		<h3><spring:message code="MakeAppointment" /></h3>
		<hr>
		<form:form modelAttribute="appointment" action="create" method="post">
			<div id="appointment-info">
				<p>
					<label for="description"><spring:message code="makeapp.description" /></label>
					<form:textarea path="description" rows="5" />
					<form:errors path="description" cssClass="error" />
				</p>
				<p id="button-panel">
					<input id="reset" type="reset"  class="btn btn-primary"
						value="<spring:message code="savePatient.form.reset.label"/>"
						tabindex="4"> <input id="submit" type="submit"  class="btn btn-primary"
						tabindex="5"
						value="<spring:message code="createAppointment.form.submit.label"/>">
				</p>
			</div>
		</form:form>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>