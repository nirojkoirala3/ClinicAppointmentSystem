<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="list-group" style="width:250px">
<a class="list-group-item" href="<spring:url value="/patient/details">
</spring:url>"><spring:message code="PatientProfile" /></a>
<a class="list-group-item" href="<c:url value="/patient/appointment/create" />">
<spring:message code="MakeAppointment" /></a>
<a class="list-group-item" href="<spring:url value="/patient/appointment/status"></spring:url>">
<spring:message code="AppointmentStatus" /></a>
<a class="list-group-item" href="<spring:url value="/patient/medicalReport"></spring:url>">
<spring:message code="MedicalHistory" /></a>
</div>