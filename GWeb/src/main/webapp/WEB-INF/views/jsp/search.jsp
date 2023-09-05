<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="jakarta.tags.core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8">
		<title>Search</title>
		<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
		<script src='https://www.w3schools.cn/fonts/kit/a076d05399.js'></script>
		<link rel="stylesheet" type="text/css" href="<%=basePath%>css/search.css"/>
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
							<a href="<%=basePath%>app/user"><img src="<%=basePath%>${user.headshot}"  class="tx_img"></a><a href="<%=basePath%>app/user" class="a1">${user.uname}</a><a href="<%=basePath%>app/user/logout" class="a2"><i class='fas fa-power-off' style='font-size:20px'></i></a>
						</div>
			       </c:otherwise>
			    </c:choose>
			</div>
			<div class="search">
				<img src="<%=basePath%>img/search.png" >
				<input type="text" id="search_input" value="" placeholder="Search the Game" />
			</div>
			<div class="content">
				<div class="left_arrow" onclick="switchover()">
					
				</div>
				<div class="content_main1" id="show1">
					<c:forEach var="news1" items="${news1}">
						<div class="main">
							<p>${news1.ntitle}</p>
							<img src="<%=basePath%>${news1.npic}" >
						</div>
					</c:forEach>	
				</div>
				<div class="content_main2" id="show2">
					<c:forEach var="news2" items="${news2}">
						<div class="main">
							<p>${news2.ntitle}</p>
							<img src="<%=basePath%>${news2.npic}" >
						</div>
					</c:forEach>	
				</div>
				<div class="right_arrow" onclick="switchover()">
					
				</div>
			</div>
		</div>
	</body>
	<script src="<%=basePath%>js/show.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
	var input = document.getElementById("search_input")
	input.addEventListener("keyup", function(event) {
		event.preventDefault()
		if (event.keyCode === 13) {
			document.location.href = "<%=basePath%>app/searchgame?gname="+input.value;
		}
	})
	</script>

</html>
