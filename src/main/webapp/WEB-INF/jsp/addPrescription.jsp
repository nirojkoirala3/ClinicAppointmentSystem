<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/resources/css/prescription.css' />" rel="stylesheet" />
<tags:basecss></tags:basecss>
<title>Add Prescription</title>
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
	<div id="container">
			<form:form modelAttribute="addPrescription" action="" method="post" class="form-horizontal" id="prescriptionForm">
				<form:input type="hidden" id="appointmentId" path="appointment.id" value="${appointment.id}" />
				<form:input type="hidden" id="doctorId" path="doctor.id" value="${appointment.doctor.id}" />
				<form:input type="hidden" id="patientId" path="patient.id" value="${appointment.patient.id}" />
				<legend>Add New Prescription</legend>
				<p>
					<label for="symptomps" class="col-sm-3 control-label">Symptoms</label>
					<form:textarea id="symptomps" path="symptomps" rows="2" cols="40"></form:textarea>
				</p>
				<p>
					<label for="diagnosis" class="col-sm-3 control-label">Diagnosis</label>
					<form:textarea id="diagnosis" path="diagnosis" rows="2" cols="40"></form:textarea>
				</p>
				<p>
					<label for="medication" class="col-sm-3 control-label">Medication</label>
					<form:textarea id="medication" path="medication" rows="2" cols="40"></form:textarea>
				</p>
				<p>
					<label for="dosages" class="col-sm-3 control-label">Dosage</label>
					<form:textarea id="dosages" path="dosages" rows="2" cols="40"></form:textarea>
				</p>
				<div class="form-group">
			        <div class="col-sm-offset-3 col-sm-9">
			          <button type="submit" class="btn btn-success">Save</button>
			           <a href="<c:url value='/doctor/prescription?appointmentId=${appointment.id}'/>" class="btn btn-danger">Cancel</a>
       				 </div>
       			 
      			</div>
			</form:form>
		</div>
	</div>
	<tags:basejs></tags:basejs>
	<tags:footer></tags:footer>
</body>
</html>