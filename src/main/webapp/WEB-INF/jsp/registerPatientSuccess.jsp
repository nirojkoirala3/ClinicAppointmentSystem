<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
		<h4><spring:message code="savePatient.form.success" /></h4>
		
		<c:if test="${not empty patient}">
			
			<div id="account-info">
				<h3><spring:message code="savePatient.form.AccountInfo" /></h3>
				<p>
					<label class="field-label"><spring:message code="savePatient.form.fname.label" /></label>
					<span>${patient.firstName}</span>
				</p>
				<p>
					<label class="field-label"><spring:message code="savePatient.form.lname.label" /></label>
					<span>${patient.lastName}</span>
				</p>

				<p>
					<label class="field-label"><spring:message
							code="savePatient.form.bdate.label" /></label>
					<span>${patient.birthDate}</span>
				</p>
				<p>
					<label class="field-label"><spring:message
							code="savePatient.form.email.label"></spring:message></label>
					<span>${patient.email}</span>
				</p>
			</div>
			<div id="address-info">
				<h3><spring:message code="savePatient.form.AddressInfo" /></h3>
				<p>
					<label class="field-label"><spring:message code="address.street" /></label>
					<span>${patient.address.street}</span>
				</p>
				<p>
					<label class="field-label"><spring:message code="address.state" />
					</label>
					<span>${patient.address.state}</span>
				</p>
				<p>
					<label class="field-label"><spring:message code="address.city" /></label>
					<span>${patient.address.city}</span>
				</p>
				<p>
					<label class="field-label"><spring:message code="address.zipCode" /></label>
					<span>${patient.address.zipCode}</span>
				</p>
			</div>
			
			<div id="PassportSizePhoto">
				<h3><spring:message code="savePatient.form.PassportPhoto" /></h3>
				<p>
					<img width="150px" height="150px" src="<c:url value="/resources/images/${patient.lastName}_${patient.id}.jpg"></c:url>" alt="" /> 
				
				</p>
			</div>
			
		</c:if>
					<p id="button-panel">
			
			<hr>
			Please <a href="<spring:url value="/login"></spring:url>">login</a> to make an appointment.
			</p>
	</div>
		
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>