<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="<c:url value='/resources/css/home.css'/>" rel="stylesheet" />
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Clinic Appointment System</title>
<tags:basecss></tags:basecss>
</head>
<body>
	<tags:header></tags:header>
	<div id="main">
		<!-- <h2>Welcome!</h2> -->
		<c:if test="${empty currentUser}">
		<!-- <p>The clinic Appointment system is developed to simplify the communication 
		process between a patient, a receptionist, and a doctor.  
		This is an automation of the clinic appointment process.</p>
			<p>Demo accounts:</p>
			<ul>
				<li>admin@mum.edu/admin</li>
				<li>doctor@mum.edu/doctor</li>
				<li>receptionist@mum.edu/receptionist</li>
				<li>patient@mum.edu/patient</li>
			</ul>	 -->				
			<div class="container">
				  <div id="myCarousel" class="carousel slide" data-ride="carousel">
				    <!-- Indicators -->
				    <ol class="carousel-indicators">
				      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				      <li data-target="#myCarousel" data-slide-to="1"></li>
				      <li data-target="#myCarousel" data-slide-to="2"></li>
				    </ol>
				
				    <!-- Wrapper for slides -->
				    <div class="carousel-inner">
				      <div class="item">
				        <img src="<c:url value="/resources/images/clicnic3.jpg"></c:url>" alt="" style="width:100%; height:600px;">
				      </div>
					  <div class="item active">
				        <img src="<c:url value="/resources/images/clicnic4.jpg"></c:url>" alt="" style="width:100%; height:600px;">
				      </div>				
				      <div class="item">
				        <img src="<c:url value="/resources/images/clicnic2.jpg"></c:url>" alt="" style="width:100%; height:600px;">
				      </div>
				    
				      <div class="item">
				        <img src="<c:url value="/resources/images/clicnic1.jpg"></c:url>" alt="" style="width:100%; height:600px;">
				      </div>
				    </div>
				
				    <!-- Left and right controls -->
				    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
				      <span class="glyphicon glyphicon-chevron-left"></span>
				      <span class="sr-only">Previous</span>
				    </a>
				    <a class="right carousel-control" href="#myCarousel" data-slide="next">
				      <span class="glyphicon glyphicon-chevron-right"></span>
				      <span class="sr-only">Next</span>
				    </a>
				  </div>
			</div>
			</c:if>	
		<c:if test="${not empty currentUser}">
			<!-- <p>Select a task that you would like to perform:</p> -->
			<c:choose>
				<c:when test="${currentUser.role == 'ROLE_ADMIN'}">
					<tags:admin></tags:admin>
				</c:when>
				<c:when test="${currentUser.role == 'ROLE_DOCTOR'}">
					<tags:doctor></tags:doctor>
				</c:when>
				<c:when test="${currentUser.role == 'ROLE_RECEPTIONIST'}">
					<tags:receptionist></tags:receptionist>
				</c:when>
				<c:when test="${currentUser.role == 'ROLE_PATIENT'}">
					<tags:patient></tags:patient>
				</c:when>
			</c:choose>
		</c:if>
		</div>
	<tags:footer></tags:footer>
	<tags:basejs></tags:basejs>
</body>
</html>