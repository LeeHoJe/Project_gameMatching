<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert title here</title>
	 <link href="${pageContext.request.contextPath }/css/login.css" rel="stylesheet" />
	</head>
	<body>
		<main id="main-holder">
		    <h1 id="login-header">Login</h1>
		    
		    <div id="login-error-msg-holder">
		      <p id="login-error-msg">Invalid username <span id="error-msg-second-line">and/or password</span></p>
		    </div>
		    
		    <form id="login-form" method="post" action="<c:url value="/loginDo" />" >
		      <input type="text" name="userId" class="login-form-field" placeholder="Id" required>
		      <input type="password" name="userPw" class="login-form-field" placeholder="Password" required>
		      <!--아이디 기억  -->
        <div class="form-flooting f3-mb" >
        아이디 기억하기 <input name="remember" type="checkbox"
        ${cookie.rememberId.value == null ? "":"checked"}/>
          <input name="fromUrl" type="hidden" value="${fromUrl }"/>
            </div>
            <a id="button" href="<c:url value="/lobbyView" />" >
		      <button id= "button" type="submit">Login</button>
		      </a>
		      <br>
		      <input type="button" value="Sign Up" id="button" onclick ='location.href="${pageContext.request.contextPath}/registView"'>
		      <%-- <input type="button" value="Login" id="button" onclick ='location.href="${pageContext.request.contextPath}/lobbyView"'>
		       --%><br>
		     </form>
		      
		 
		  
		  </main>
	</body>
</html>