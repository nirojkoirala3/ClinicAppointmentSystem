<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<c:if test="${not empty img}">
			<p class="error">
				Please note: We support jpg, png, or gif image types.
			</p>
		</c:if>
		<c:if test="${not empty err}">
			<p class="error">
			Oops! It seems everybody wants to see a doctor today!
			</p>
		</c:if>			
	
        <c:forEach items="${exception.stackTrace}" var="ste">    ${ste} 
    </c:forEach>	

	</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>