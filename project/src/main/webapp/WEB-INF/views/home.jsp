<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!DOCTYPE html>
<html lang="en">
	<head>
	
	<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
	    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0"> <!-- 한글필터 -->
	<meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 한글필터 -->
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>메인화면</title>
	 <link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet" />
	</head>
	<body>
	    <main id="main-holder">
	    <h1>LoL-AutoMatching: Duo</h1>
	    <hr>
	    <form id="login-form">
	        <input type="button" value="Login" id="button" style="width: 
	        200px; height: 50px; padding: 20px;" onclick='location.href="${pageContext.request.contextPath}/loginView"'>
	</form>
	    </main>
	</body>
</html>
