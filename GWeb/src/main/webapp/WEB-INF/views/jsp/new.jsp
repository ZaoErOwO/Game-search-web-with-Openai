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
<title>news</title>
<script src='https://www.w3schools.cn/fonts/kit/a076d05399.js'></script>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/information.css" />
</head>
<body>
	<div class="nav">
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
		<div class="box1">
			<div class="banner">
				<div class="banner_pic" id="banner_pic">
					<div class="current">
						<img src="<%=basePath%>img/new/new1.png">
					</div>
					<div class="pic">
						<img src="<%=basePath%>img/new/new2.jpg"
							style="width: 700px; height: 390px;">
					</div>
				</div>
				<ol id="button">
					<li class="current"></li>
					<li class="but"></li>
				</ol>
			</div>
			<div class="box1_right">
				<ul>
					<li>
						<p style="line-height: 30px;">In 2023, this organisation has invested in 10 gaming companies</p> <span>3 hours ago</span>
					</li>
					<li>
						<p style="line-height: 30px;">A Week of Game Concept Stocks Key Dynamics at a Glance</p> <span>3 hours ago</span>
					</li>
					<li>
						<p style="line-height: 30px;">610 domestic game licences have been issued in 2023</p> <span>3 hours ago</span>
					</li>
				</ul>
				<span
					style="font-size: 15px; color: #999; font-weight: bold; padding-left: 15px; line-height: 30px; display: block; margin-top: 15px;">See more></span>
			</div>
		</div>
		<div class="box3">
			<ul>
				<li><img src="<%=basePath%>img/new/n1.jpg">
					<p style="line-height: 20px;">88 game licences issued in July, Xishanju, China Handy Games and others</p></li>
				<li><img src="<%=basePath%>img/new/n2.jpg">
					<p style="line-height: 20px;">Steam Sales Weekly Chart: 'Legacy 2' shoots up to #5; 'Baldur's Gate 3' release imminent</p></li>
				<li><img src="<%=basePath%>img/new/n3.png">
					<p style="line-height: 20px;">The case of "Original God" plug-in production and sale has been detected</p></li>
				<li><img src="<%=basePath%>img/new/n1.jpg">
					<p style="line-height: 20px;">Chris and Dom are back to discuss what is in the works for Goose Goose Duck!</p></li>
			</ul>
		</div>
		<div class="box4">
			<div class="box4-main">
				<div class="box4-banner">
					<img src="<%=basePath%>img/new/banner1.jpg" width="100%">
				</div>
				<ul>
					<c:forEach var="nw" items="${news}">
						<li><a href="<%=basePath%>app/newsinfo?nid=${nw.nid}"><img src="<%=basePath%>${nw.npic}"></a>
							<div class="text">
								<h1>${nw.ntitle }</h1>
								<p>${nw.ncontent }</p>
								<span>${nw.ntime }</span>
							</div></li>
					</c:forEach>
				</ul>
			</div>
			<div class="box4-right">
				<ul>
					<li>
						<p style="line-height: 15px;">Game Business Opportunities:Drama Outsourcing, Overseas Local Resources, etc.</p> <span>You Xiao Li ·
							2023-05-15</span>
					</li>
					<li>
						<p style="line-height: 15px;">Game industry service column: research and development company to sell 25% of the equity to seek financing</p> <span>Buddha ·
							2022-11-16</span>
					</li>
					<li>
						<p style="line-height: 15px;">Game industry service column: FMCG brands looking for different industries to cooperate with the volume of 100-500 million</p> <span>Drumstick ·
							2022-11-01</span>
					</li>
					<li>
						<p style="line-height: 15px;">Game industry service column: Suzhou enterprises looking for the main game beauty, card / RPG master plan</p> <span>Drumstick
							· 2022-10-12</span>
					</li>
					<li>
						<p style="line-height: 15px;">Game industry service column: new independent games, XR project financing needs</p> <span>Drumstick ·
							2022-10-12</span>
					</li>
					<li>
						<p style="line-height: 15px;">Game Industry Service Column: Friendship Time's Overseas Project Seeks Main Beauty</p> <span>Drumstick ·
							2022-10-12</span>
					</li>
				</ul>
			</div>

		</div>
</body>
<script src="<%=basePath%>js/script.js" type="text/javascript"
	charset="utf-8"></script>
</html>
