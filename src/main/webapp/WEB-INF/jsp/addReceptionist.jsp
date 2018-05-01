<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
<link href="<c:url value='/resources/css/receptionist.css'/>"
	rel="stylesheet" />
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
	<div class="container">
		<p class=pull-right>
			Language : <a href="?language=en">English</a>| <a href="?language=de">Dutch</a>
		</p>
		<%-- Current Locale : ${pageContext.response.locale} --%>
		<div class="col-md-5">
			<div class="form-area">
				<form:form method="post" action="?${_csrf.parameterName}=${_csrf.token}" modelAttribute="addReceptionist" 
				enctype = "multipart/form-data">
				<div>
					<form:errors path="*" cssClass="errorClass"></form:errors>
				</div>
					<br style="clear: both">
					<h3 style="margin-bottom: 25px; text-align: center;">
						<spring:message code="label.addNewReceptionist" />
					</h3>
					<div class="form-group">
						<label for="firstname"><spring:message
								code="label.firstname" /></label>
						<form:input type="text" class="form-control" path="firstName"></form:input>
						<form:errors cssClass="errorClass" path="firstName"></form:errors>
					</div>
					<div class="form-group">
						<label for="lastname"><spring:message
								code="label.lastname" /></label>
						<form:input type="text" class="form-control" path="lastName"></form:input>
						<form:errors cssClass="errorClass" path="lastName"></form:errors>
					</div>

					<div class="form-group">
						<label for="email"><spring:message code="label.email" /></label>
						<form:input type="text" class="form-control" id="email"
							path="email"></form:input>
						<form:errors cssClass="errorClass" path="email"></form:errors>
					</div>

					<%-- <div class="form-group">
						<label for="phone"><spring:message code="receptionist.phone" /> Phone</label>
						<form:input class="form-control" id="phone" path="phone" />
						<form:errors cssClass="errorClass" path="phone"></form:errors>
					</div> --%>
					<div class="form-group">
						<label for="password"><spring:message
								code="label.password" /></label>
						<form:input type="password" class="form-control" id="password"
							path="user.password"></form:input>
						<form:errors cssClass="errorClass" path="user.password"></form:errors>
					</div>
					
					<div class="form-group">
					<label for="image" class="cols-sm-2 control-label">Image</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span>
							<form:input type="file" class="form-control" path="image" name="image"
								id="image" />
						</div>
					</div>
					<c:if test="${not empty imgError}">
					<p class="error">
						<spring:message code="receptionistPhotoError" />
					</p>
				</c:if>
				</div>

					<button name="submit" class="btn btn-primary pull-right">
						<spring:message code="label.save" />
					</button>&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/admin/receptionist'/>"
						class="btn btn-danger pull-right"><spring:message
							code="label.cancel" /></a>
				</form:form>
			</div>
		</div>
	</div>
	</div>
	<tags:footer></tags:footer>
</body>
</html>

