<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Game library</title>
		<style type="text/css">
			
			

			* {
				box-sizing: border-box;
				padding: 0;
				margin: 0;
			}

			body{
				background-color: rgb(29, 39, 56);
			}

			a {
				color: white;
			}

			body,
			input,
			button {
				font-size: var(--normal-font-size);
				font-family: var(--body-font);
			}

			body {
				color: var(--white-color);
			}

			input,
			button {
				border: none;
				outline: none;
			}

			a {
				text-decoration: none;
			}

			img {
				max-width: 100%;
				height: auto;
			}

			li {
				list-style: none;
			}

			.nav {
				width: 100%;
				height: 60px;
				background-color: #263a57;
			}

			.nav ul {
				float: left;
			}

			.nav ul li {
				float: left;
				color: white;
				width: 120px;
				text-align: center;
				line-height: 60px;
			}

			.nav ul li a {
				color: #ccc;
			}

			.nav a:hover {
				color: white;
			}

			.login_btn {
				width: 120px;
				height: 50px;
				float: right;
				text-align: center;
				margin-top: 5px;
			}

			.login_btn a {
				line-height: 50px;
				color: #ccc;
			}

			.user_info {
				width: 160px;
				height: 50px;
				float: right;
			}

			.user_info .a1 {
				float: left;
				line-height: 60px;
				color: #ccc;
				margin-left: 10px;
			}

			.user_info .a1:hover {
				color: white;
			}

			.tx_img {
				border-radius: 50%;
				overflow: hidden;
			}

			.user_info img {
				width: 30px;
				float: left;
				margin-top: 10px;
				margin-left: 10px;
			}
			::-webkit-scrollbar {
			  width: 10px;
			  margin-right: 5px;
			}
			
			/* 滚动槽 */
			::-webkit-scrollbar-track {
			  border-radius: 15px;
			  background-color: #263a57;
			}
			
			/* 滚动条滑块 */
			::-webkit-scrollbar-thumb {
			  background-color: white;
			  border-radius: 15px;
			  width: 10px;
			  height: 50px;
			}

			.box {
				width: 100%;
				height: 673px;
				background-color: rgb(29, 39, 56);
				margin-top: 20px;
				display: flex;
			}

			.left {
				width: 20%;
				height: 100%;
				background-color: #263a57;
				overflow-y: auto;
			}

			.right {
				width: 79%;
				height: 100%;
				margin-left: 1%;
				background-color: #263c58;
				overflow-y: auto;
			}

			.left ul {
				width: 100%;
				height: auto;
				border-bottom: 1px solid white;

			}

			.left ul li {
				width: 100%;
				height: 40px;
				line-height: 40px;
				font-size: 15px;
				text-align: center;
				color: white;
			}

			.right ul li {
				width: 90%;
				height: 150px;
				position: relative;
			}

			.right ul li:nth-child(n+2) {
				margin-top: 20px;
			}

			.right ul li img {
				height: 150px;
				width: 350px;
			}

			.right ul li h1 {
				color: white;
				position: absolute;
				left: 370px;
				top: 10px;
				font-size: 20px;
			}

			.content {
				width: 500px;
				height: 70px;
				position: absolute;
				left: 370px;
				top: 40px;
				font-size: 13px;
				color: #ccc;
				overflow: hidden;
			}

			.type {
				width: 500px;
				height: 20px;
				font-size: 12px;
				color: #999;
				position: absolute;
				bottom: 5px;
				left: 370px;
				overflow: hidden;
			}
			
		</style>
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
							<a href="<%=basePath%>app/user"><img src="<%=basePath%>${user.headshot}"  class="tx_img"></a><a href="<%=basePath%>app/user" class="a1">${user.uname}</a><a href="<%=basePath%>app/user/logout" class="a2"><i class='fas fa-power-off' style='font-size:20px'></i></a>
						</div>
			       </c:otherwise>
			    </c:choose>

		</div>
		<div class="box">
			<div class="left">
				<ul>
					<c:forEach var="gtype" items="${gameTypes}">
						<c:if test="${gtype.tpd=='a' }">
							<li><a href="<%=basePath%>app/gametype?tname=${gtype.tname}">${gtype.tname }</a></li>
						</c:if>

					</c:forEach>
				</ul>
				<ul>
					<c:forEach var="gtype" items="${gameTypes}">
						<c:if test="${gtype.tpd=='b' }">
							<li><a href="<%=basePath%>app/gametype?tname=${gtype.tname}">${gtype.tname }</a></li>
						</c:if>

					</c:forEach>
				</ul>
				<ul>
					<c:forEach var="gtype" items="${gameTypes}">
						<c:if test="${gtype.tpd =='c'}">
							<li><a href="<%=basePath%>app/gametype?tname=${gtype.tname}">${gtype.tname }</a></li>
						</c:if>

					</c:forEach>
				</ul>
				<ul>
					<c:forEach var="gtype" items="${gameTypes}">
						<c:if test="${gtype.tpd=='d' }">
							<li><a href="<%=basePath%>app/gametype?tname=${gtype.tname}">${gtype.tname }</a></li>
						</c:if>

					</c:forEach>
				</ul>
				<ul>
					<c:forEach var="gtype" items="${gameTypes}">
						<c:if test="${gtype.tpd=='e' }">
							<li><a href="<%=basePath%>app/gametype?tname=${gtype.tname}">${gtype.tname }</a></li>
						</c:if>

					</c:forEach>
				</ul>
			</div>
			<div class="right">
				<ul>
					<c:forEach var="gm" items="${games}">
						<li>
							<a href="<%=basePath%>app/gameinfo?gname=${gm.gname}"><img src="<%=basePath%>${gm.gpic1}"
									height="150px" width="200px"></a>
							<h1>${gm.gname }</h1>
							<div class="content">
								${gm.gdevelopers}
							</div>
							<div class="type">
								${gm.type}
							</div>
						</li>
						
						
					</c:forEach>

				</ul>
			</div>
		</div>
	</body>
</html>


