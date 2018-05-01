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
<style type="text/css">
	input.disabled {
		border: none;
	}
</style>
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<div class="page-tools">
			<a class="go-back" href="<c:url value='/receptionist/appointment' />">Go Back</a>
		</div>
		<h1>Confirm Appointment</h1>
		<p>Patient Name: <strong>${appointment.patient.firstName}&nbsp;${appointment.patient.lastName}</strong></p>
		<p>Symptoms description: <strong>${appointment.description}</strong></p>
		<p>Appointment Status: <strong>${appointment.bookingtype}</strong></p>
		<p><strong>Confirm the appointment by choosing a doctor from the list, entering the date, and click Confirm button.</strong></p>
		<table>
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Doctor Speciality</th>
					<th>Confirmation Date</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listofDoctor}" var="doctor">
	        		<form:form action="" method="post" modelAttribute="appointment">
		              	<form:errors path="*" cssClass="error" element="p" />
		              	<input type="hidden" value="${doctor.id}" name="doctor.id"/>
						<input type="hidden" value="${doctor.email}" name="doctor.email"/>
						<input type="hidden" value="${appointment.id}" name="id"/>
						<input type="hidden" value="${appointment.description}" name="description"/>
						<input type="hidden" value="${appointment.bookingtype}" name="bookingtype"/>
						<tr>
							<td><input type="text" value="${doctor.firstName}" name="doctor.firstName" readonly="readonly" class="disabled" /></td>
							<td><input type="text" value="${doctor.lastName}" name="doctor.lastName" readonly="readonly" class="disabled" /></td>
							<td><input type="text" value="${doctor.speciality}" name="doctor.speciality" readonly="readonly" class="disabled" /></td>
							<td><input type="text" name="date" placeholder="MM-dd-yyyy" required="required" /></td>
							<td><input type="submit" value="Confirm"/></td>
						</tr>
					</form:form>
				</c:forEach>
			</tbody>
		</table>				
	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>