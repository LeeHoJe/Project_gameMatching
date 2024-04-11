<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

</head>
<body>
 <main id="main-holder">
    <h1 id="login-header">signUp</h1>
    
    <div id="login-error-msg-holder">
      <p id="login-error-msg">Invalid username <span id="error-msg-second-line">and/or password</span></p>
    </div>
    
    <form id="login-form" method="post" action="<c:url value="/registDo" />" >
      <input type="text" name="userId"  class="login-form-field" placeholder="UserId">
      <input type="password" name="userPw"  class="login-form-field" placeholder="UserPw">
      <!-- <input type="password" name="password" id="user-pw2" class="login-form-field" placeholder="Password"> -->
      <input type="text" name="userNm" class="login-form-field" placeholder="UserNm">
      <button id= "button" type="submit">Login</button>
      
    </form>
  </main>
 
</body>

</html>