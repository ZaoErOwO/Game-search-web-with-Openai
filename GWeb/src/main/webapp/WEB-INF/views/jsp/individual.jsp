<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Personal account</title>
<script src='https://www.w3schools.cn/fonts/kit/a076d05399.js'></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/individual.css" />
<script type="text/javascript">
if("${msg}"!="")
alert("${msg}");
</script>
</head>
<body>
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
						src="<%=basePath%>${user.headshot}" class="tx_img"></a><a
						href="<%=basePath%>app/user" class="a1">${user.uname}</a><a
						href="<%=basePath%>app/user/logout" class="a2"><i
						class='fas fa-power-off' style='font-size: 20px'></i></a>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div class="hero-image">
		<div class="hero-text">
			<h1 style="font-size: 50px">
				<img src="<%=basePath%>${user.headshot}">
			</h1>
			<p>${user.uname}</p>
		</div>
	</div>
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'London')"
			id="defaultOpen">Personal Info</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">Personal Collection</button>
	</div>

	<div id="London" class="tabcontent">
		<table border="0" cellspacing="" cellpadding="">
			<tr>
				<td>Username:</td>
				<td>${user.uname}</td>
			</tr>
			<tr>
				<td>Gender:</td>
				<td>${user.sex}</td>
			</tr>
			<tr>
				<td>Mobile number:</td>
				<td>${user.tel}</td>
			</tr>
			<tr>
				<td>Mailbox:</td>
				<td>${user.email}</td>
			</tr>

		</table>
	</div>

	<div id="Paris" class="tabcontent">
		<ul>
			<c:forEach var="fas" items="${fas}">
				<li>
				<img src="<%=basePath%>${fas.gpic1}">
					<p>${fas.gname}</p>
					<button><a href="<%=basePath%>app/user/removecollection?gname=${fas.gname}">Cancel favourites</a></button></li>
			</c:forEach>
		</ul>
	</div>



</body>
<script src="<%=basePath%>js/script.js" type="text/javascript"
	charset="utf-8"></script>
</html>
