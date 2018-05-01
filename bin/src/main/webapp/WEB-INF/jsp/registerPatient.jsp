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
		<h1>Sign Up</h1>
		<form:form modelAttribute="newPatient" action="registerPatient" method="post">
			<div>
				<form:errors path="*" cssClass="error" />
			</div>
			<div id="account-info">
				<h2>Account Information</h2>
				<p>
					<label for="firstName" class="field-label"><spring:message code="savePatient.form.fname.label" /></label>
					<form:input path="firstName" />
					<form:errors path="firstName" cssClass="error" />
				</p>
				<p>
					<label for="lastName" class="field-label"><spring:message code="savePatient.form.lname.label" /></label>
					<form:input path="lastName" />
					<form:errors path="lastName" cssClass="error" />
				</p>

				<p>
					<label for="birthDate" class="field-label"><spring:message
							code="savePatient.form.bdate.label" /></label>
					<form:input path="birthDate" id="birthDate" />
					<form:errors path="birthDate" cssClass="error" />
				</p>
				<p>
					<label for="email" class="field-label"><spring:message
							code="savePatient.form.email.label"></spring:message></label>
					<form:input path="email" id="email" />
					<form:errors path="email" cssClass="error" />
					<p>
				<p>
					<label for="password" class="field-label"><spring:message
							code="savePatient.form.password.label" /></label>
					<form:password path="user.password" id="password" />
					<form:errors path="user.password" cssClass="error" />
				</p>
				<p>
					<label for="cpassword" class="field-label"><spring:message
							code="savePatient.form.cpassword.label"></spring:message></label>
					<form:password path="confirmedPassword" id="cpassword" />
					<form:errors path="confirmedPassword" cssClass="error" />
				</p>
			</div>
			<div id="address-info">
				<h2>Address Information</h2>
				<p>
					<label for="street" class="field-label"><spring:message code="address.street" /></label>
					<form:input path="address.street" id="street" />
					<form:errors path="address.street" cssClass="error" />
				</p>
				<p>
					<label for="state" class="field-label"><spring:message code="address.state" />
					</label>
					<form:input path="address.state" id="state" />
					<form:errors path="address.state" cssClass="error" />
				</p>
				<p>
					<label for="city" class="field-label"><spring:message code="address.city" /></label>
					<form:input path="address.city" id="city" />
					<form:errors path="address.city" cssClass="error" />
				</p>
				<p>
					<label for="zipCode" class="field-label"><spring:message code="address.zipCode" /></label>
					<form:input path="address.zipCode" id="zipCode" />
					<form:errors path="address.zipCode" cssClass="error" />
				</p>
			</div>
			<p id="button-panel">
				<input id="reset" type="reset"
					value="<spring:message code="savePatient.form.reset.label"/>"
					tabindex="4"> 
					<input id="submit" type="submit"
					tabindex="5"
					value="<spring:message code="savePatient.form.add.label"/>">
			</p>
		</form:form>
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>