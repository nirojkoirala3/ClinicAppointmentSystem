<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<c:url value='/resources/css/doctor.css'/>" rel="stylesheet" />
<tags:basecss></tags:basecss>
<title>Add Doctor</title>
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
	<div>
		<a href="?language=en">English</a>/<a href="?language=fr">French</a>
	</div>
	<div class="container">
		<div class="row main">					
			<form:form method="post" action="?${_csrf.parameterName}=${_csrf.token }" modelAttribute="addDoctor"
				id="doctorForm" enctype="multipart/form-data">
				<div>
					<form:errors path="*" cssClass="error"></form:errors>
				</div>
				<div class="form-group">
					<label for="firstName" class="cols-sm-2 control-label"><spring:message
							code="doctor.firstName.label" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span>
							<form:input type="text" class="form-control" path="firstName"
								id="firstName" placeholder="First Name" />
							<form:errors cssClass="error" path="firstName"></form:errors>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="lastName" class="cols-sm-2 control-label"><spring:message
							code="doctor.lastName.label" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa"
								aria-hidden="true"></i></span>
							<form:input type="text" class="form-control" path="lastName"
								id="lastName" placeholder="Last Name" />
							<form:errors cssClass="error" path="lastName"></form:errors>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="speciality" class="cols-sm-2 control-label"><spring:message
							code="doctor.speciality.label" /></label>
					<div class="dropdown dropdown-lg">
						<div class="input-group">
							<form:select id="speciality" path="speciality"
								class="form-control">
								<form:option value="CARDIOLOGIST">
									<spring:message code="doctor.speciality.cardiologist.label" />
								</form:option>
								<form:option value="DERMATOLOGISTS">
									<spring:message code="doctor.speciality.dermatologists.label" />
								</form:option>
								<form:option value="GASTROENTEROLOGIST">
									<spring:message
										code="doctor.speciality.gastroenterologist.label" />
								</form:option>
								<form:option value="NEUROLOGIST">
									<spring:message code="doctor.speciality.neurologist.label" />
								</form:option>
							</form:select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="email" class="cols-sm-2 control-label"><spring:message
							code="doctor.email.label" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-envelope fa" aria-hidden="true"></i></span>
							<form:input type="text" class="form-control" path="email"
								id="email" placeholder="Enter your Email" />
							<form:errors cssClass="error" path="email"></form:errors>
						</div>
					</div>
				</div>

				<div class="form-group">
					<label for="password" class="cols-sm-2 control-label"><spring:message
							code="doctor.password.label" /></label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<form:input type="password" class="form-control"
								path="user.password" id="password"
								placeholder="Enter your Password" />
								<!-- pattern="((?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,})" -->
							<form:errors cssClass="error" path="user.password"></form:errors>
						</div>
					</div>
				</div>
				
				 <div class="form-group">
					<label for="image" class="cols-sm-2 control-label"><spring:message
							code="doctor.image.label" /></label>
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
						<spring:message code="doctorPhotoError" />
					</p>
				</c:if>
				</div> 
				
				<div class="form-group ">
					<input type="submit"
						value="<spring:message code="doctor.save.label" />"
						class="btn btn-info" /> <a href="<c:url value='/admin/doctor'/>"
						class="btn btn-danger"><spring:message
							code="doctor.cancel.label" /></a>
				</div>
			</form:form>
		</div>
	</div>
	</div>
	<tags:basejs></tags:basejs>
	<tags:footer></tags:footer>
</body>
</html>