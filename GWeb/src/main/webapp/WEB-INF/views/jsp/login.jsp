<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=basePath%>jQueryUI/jquery-ui.min.js"></script>
<link rel="stylesheet" href="<%=basePath%>jQueryUI/jquery-ui.min.css" />
<link rel="stylesheet"
	href="<%=basePath%>jQueryUI/jquery-ui.theme.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<script src='https://www.w3schools.cn/fonts/kit/a076d05399.js'></script>
<title>login</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>css/login.css" />
<script type="text/javascript">       
function login(){	   
	  var span =  document.getElementById("msg");	   
	  var uname =  document.getElementById("uname").value;
	  var pwd =  document.getElementById("pwd").value;
	
	  if(uname == ""){
		span.innerHTML = "Username cannot be empty!";
		return;
	  }	 
	  if(pwd == ""){
		  span.innerHTML = "Password cannot be empty!";
		  return;
	  }
	  $.ajax({
		   type: "POST",
		   url: "<%=basePath%>app/login",
		   data: "uname="+uname+"&pwd="+pwd,
		   success: function(msg){
		       if(msg == "0"){
		    	   span.innerHTML = "User name or password input error, please re-enter...";
		       }else if(msg == "1"){
		    	   alert(uname+"Login successful!");
		    	   document.location.href = "<%=basePath%>app/search";
		       }else{
		    	   span.innerHTML = "Network abnormality, please contact the administrator";
		       }
		   }
		}); 
 }
</script>
</head>
<body>
	<div class="wrap">
		<div class="nav">
			<ul>
				<li><a href="">GWeb</a></li>
				<li><a href="<%=basePath%>app/search">Search</a></li>
				<li><a href="<%=basePath%>app/gamelist">Library</a></li>
				<li><a href="<%=basePath%>app/newslist">News</a></li>
				<li><a href="">Communtiy</a></li>
			</ul>
			<c:choose>
				<c:when test="${user == null}">
					<div class="login_btn">
						<a href="<%=basePath%>app/login">login</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="user_info">
						<a href="<%=basePath%>app/user"><img
							src="<%=basePath%>${user.headshot}"  class="tx_img"></a><a
							href="<%=basePath%>app/user" class="a1">${user.uname}</a><a
							href="<%=basePath%>app/user/logout" class="a2"><img
							src="<%=basePath%>img/gj.png"></a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="login">
			<img src="<%=basePath%>img/bg.png" alt="login image"
				class="login__img">

			<form class="login__form" method="post" id="myform">
				<h1 class="login__title">Login</h1>

				<div class="login__content">
					<div class="login__box">
						<i class="ri-user-3-line login__icon"></i>

						<div class="login__box-input">
							<input type="text" required class="login__input" placeholder=" "
								id="uname"> <label for="" class="login__label">UserName</label>
						</div>
					</div>

					<div class="login__box">
						<i class="ri-lock-2-line login__icon"></i>

						<div class="login__box-input">
							<input type="password" required class="login__input" id="pwd"
								placeholder=" "> <label for="" class="login__label">Password</label>
							<i class="ri-eye-off-line login__eye" id="login-eye"></i>
						</div>

					</div>
					<span id="msg">${msg}</span>
				</div>

				<div class="login__check">
					<div class="login__check-group">
						<input type="checkbox" class="login__check-input"> <label
							for="" class="login__check-label">Remember me</label>
					</div>

					<a href="#" class="login__forgot">Forgot Password?</a>
				</div>
				<input type="button" class="login__button" onclick="login()" value="Login">


				<p class="login__register">
					Don't have an account? <a href="#">Register</a>
				</p>
			</form>
		</div>
	</div>
	<!--=============== MAIN JS ===============-->
	<script src="<%=basePath%>js/main.js"></script>
</body>
</html>
