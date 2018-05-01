<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
			<a class="go-back" href="<c:url value='/receptionist/appointment' />">Go
				Back</a>
		</div>

		<h1>Confirm Appointment</h1>
		<div class="pateintDetails">
			<p>
				Patient Name: <strong>${appointment.patient.firstName}&nbsp;${appointment.patient.lastName}</strong>
			</p>
			<p>
				Symptoms description: <strong>${appointment.description}</strong>
			</p>
			<p>
				Appointment Status: <strong>${appointment.bookingtype}</strong>
			</p>
			<p>
				<strong>Confirm the appointment by choosing a doctor from
					the list, entering the date, and click Confirm button.</strong>
			</p>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Doctor Speciality</th>
					<th>Confirmation Date</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${listofDoctor}" var="doctor">
					<form:form action="" method="post" modelAttribute="appointment">
						<form:errors path="*" cssClass="error" element="p" />
						<form:input type="hidden" value="${doctor.id}" path="doctor.id" />
						<form:input type="hidden" value="${doctor.email}"
							path="doctor.email" />
						<form:input type="hidden" value="${appointment.id}" path="id" />
						<form:input type="hidden" value="${appointment.description}"
							path="description" />
						<form:input type="hidden" value="${appointment.bookingtype}"
							path="bookingtype" />
						<tr>
							<td><form:input type="text" value="${doctor.firstName}"
									path="doctor.firstName" readonly="readonly" class="disabled" /></td>
							<td><form:input type="text" value="${doctor.lastName}"
									path="doctor.lastName" readonly="readonly" class="disabled" /></td>
							<td><form:input type="text" value="${doctor.speciality}"
									path="doctor.speciality" readonly="readonly" class="disabled" /></td>
							<td><form:input type="text" path="date"
									placeholder="MM-dd-yyyy" /></td>
							<td><input type="submit" class="btn btn-primary"
								value="Confirm" /></td>
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