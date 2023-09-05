<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Game info</title>
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
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/game_info.css" />
<script type="text/javascript">
if("${msg}"!="")
alert("${msg}");
</script>
<script type="text/javascript">
	$(document).ready(function(){
	    $("#start").click(function(){
	        var gameUrl = $("#gameUrl").val();
	        var isConfirmed = confirm("Do you want to start the game?");
	        if (isConfirmed) {
	            window.open(gameUrl); 
	            startTime();
	        }
	    });
	});
</script>
</head>
<body>
	<div class="top">
		<div class="back">
			<div class="left_arrow"></div>
			<a href="<%=basePath%>app/gamelist"><p>Back</p></a>
		</div>
		<div class="search">
			<img src="<%=basePath%>img/search.png"> <input type="text"
				id="search_input2" value="" />
		</div>
	</div>
	<div class="box1">
		<p id="gname">${gm.gname }</p>
		<button type="button"> </button>
	</div>
	<div class="box2">
		<div class="box2_left">
			<div class="container">
				<div class="mySlides">
					<img src="<%=basePath%>${gm.gpic1}"
						style="width: 100%; height: 355px;">
				</div>

				<div class="mySlides">
					<img src="<%=basePath%>${gm.gpic2}"
						style="width: 100%; height: 355px;">
				</div>

				<div class="mySlides">
					<img src="<%=basePath%>${gm.gpic3}"
						style="width: 100%; height: 355px;">
				</div>

				<div class="mySlides">
					<img src="<%=basePath%>${gm.gpic4}"
						style="width: 100%; height: 355px;">
				</div>

				<div class="mySlides">
					<img src="<%=basePath%>${gm.gpic5}"
						style="width: 100%; height: 355px;">
				</div>

				<div class="mySlides">
					<img src="<%=basePath%>${gm.gpic6}"
						style="width: 100%; height: 355px;">
				</div>

				<!-- Next and previous buttons -->
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>

				<!-- Thumbnail images -->
				<div class="row">
					<div class="column">
						<img class="demo cursor" src="<%=basePath%>${gm.gpic1}"
							style="width: 100%; height: 68px;" onclick="currentSlide(1)"
							alt="The Woods">
					</div>
					<div class="column">
						<img class="demo cursor" src="<%=basePath%>${gm.gpic2}"
							style="width: 100%; height: 68px;" onclick="currentSlide(2)"
							alt="Cinque Terre">
					</div>
					<div class="column">
						<img class="demo cursor" src="<%=basePath%>${gm.gpic3}"
							style="width: 100%; height: 68px;" onclick="currentSlide(3)"
							alt="Mountains and fjords">
					</div>
					<div class="column">
						<img class="demo cursor" src="<%=basePath%>${gm.gpic4}"
							style="width: 100%; height: 68px;" onclick="currentSlide(4)"
							alt="Northern Lights">
					</div>
					<div class="column">
						<img class="demo cursor" src="<%=basePath%>${gm.gpic5}"
							style="width: 100%; height: 68px;" onclick="currentSlide(5)"
							alt="Nature and sunrise">
					</div>
					<div class="column">
						<img class="demo cursor" src="<%=basePath%>${gm.gpic6}"
							style="width: 100%; height: 68px;" onclick="currentSlide(6)"
							alt="Snowy Mountains">
					</div>
				</div>
			</div>
		</div>
		<div class="box2_right">
			<img src="<%=basePath%>${gm.gpic1}" class="box2_right_img">
			<p class="box2_right_title">${gm.gdescribes}</p>
			<div class="box2_txt" style="margin-top: 6px;">
				<span class="span1">Recent reviews:</span>
				<p>
					Special praise<span>(83820)</span>
				</p>
			</div>
			<div class="box2_txt">
				<span class="span1">All Reviews:</span>
				<p>
					Special praise<span>(7381749)</span>
				</p>
			</div>
			<div class="box2_txt">
				<span class="span1">Date of Issue:</span>
				<p style="color: #ccc;">${gm.gdate}</p>
			</div>
			<div class="box2_txt">
				<span class="span1">Developer:</span>
				<p style="margin-left: 40px;">${gm.gdevelopers}</p>
			</div>
			<div class="box2_txt">
				<span class="span1">Publisher:</span>
				<p style="margin-left: 40px;">${gm.gdevelopers}</p>
			</div>
			<div style="width: 350px; height: 40px;">
				<button type="button" id="start">Start</button>
				<input type="hidden" id="gameUrl" value="<%= request.getAttribute("gameUrl") %>">
				<c:choose>
					<c:when test="${fa == null}">
						<a href="<%=basePath%>app/user/collection?gname=${gm.gname}">
							<i class='far fa-heart'
							style='font-size: 24px; color: red; margin-top: 18px; margin-left: 14px;float: left;'></i>
						</a>
					</c:when>
					<c:otherwise>
						<a href="<%=basePath%>app/user/removecollection?gname=${gm.gname}">
							<i class='fas fa-heart'
							style='font-size: 24px; color: red; margin-top: 18px; margin-left: 14px;float: left;'></i>
						</a>
					</c:otherwise>
				</c:choose>
				<div class="time">
						<p id="showTime"></p>
						<div class="btns">
							<input type="button" id="stop" onclick="stopTime()" value="Stop"/>
							<input type="button" onclick="clearTime()" value="Zero" style="margin-top: 5px;"/>
						</div>
				</div>
			</div>
		</div>
	</div>
	<div class="content">
		<div class="content_left">
			<p class="content_left_title">Comments</p>
			<c:forEach var="coms" items="${coms}">
				<div class="comment">
					<div class="comment_top">
						<img src="<%=basePath%>${coms.headshot}">
						<div class="name_time">
							<p>${coms.cname}</p>
							<span>Posted in:${coms.cdate}</span>
						</div>
					</div>
					<div class="comment_text">
						<p>${coms.cpart}</p>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="content_right">
			<p class="content_right_title">News</p>
			<c:forEach var="news3" items="${news3}">
				<div class="new">
					<div class="newname_time">
						<p>${news3.ntitle}</p>
						<span>${news3.ntime}</span>
					</div>
					<img src="<%=basePath%>${news3.npic}">
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script type="text/javascript">
	let slideIndex = 1;
	showSlides(slideIndex);

	// Next/previous controls
	function plusSlides(n) {
		showSlides(slideIndex += n);
	}

	// Thumbnail image controls
	function currentSlide(n) {
		showSlides(slideIndex = n);
	}

	function showSlides(n) {
		let i;
		let slides = document.getElementsByClassName("mySlides");
		let dots = document.getElementsByClassName("demo");
		let captionText = document.getElementById("caption");
		if (n > slides.length) {
			slideIndex = 1
		}
		if (n < 1) {
			slideIndex = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
	}
</script>
<script type="text/javascript">
		var input = document.getElementById("search_input2")
		input.addEventListener("keyup", function(event) {
			event.preventDefault()
			if (event.keyCode === 13) {
				document.location.href = "<%=basePath%>app/searchgame?gname="+ input.value;
		}
	})
</script>
<script>
	    var ms = 0;
	    var secs = 0;
	    var mins = 0;
	    var hours = 0;
	    var timeoutId;
	
	var isCounting = false;
	
	function startTime()
	{
	    if(!isCounting)
	    {
	        isCounting = true;
	        timeoutId = setInterval(countTime,1);        
	    }
	
	    document.getElementById("start").value = "Timing";
	}
	
	function stopTime()
	{
	    if(isCounting)
	    {
	        isCounting = false;
	        clearTimeout(timeoutId); 
	        document.getElementById("start").value = "Continue";
	    }
	}
	
	function countTime()
	{
	    ms+=1;
	    if(ms>=100)
	    {
	        secs+=1;
	        ms = 0;
	    }
	    if(secs>=60)
	    {
	        mins+=1;
	        secs = 0;
	    }
	    if(mins>=60)
	    {
	        hours+=1;
	        mins = 0;
	    }
	
	//    ms = checkTime(ms);
	//    secs = checkTime(secs);
	//    mins = checkTime(mins);
	//    hours = checkTime(hours);
	
	
	    document.getElementById("showTime").innerHTML = hours + " : " + mins + " : " + secs + " : " + ms;
	}
	
	function checkTime(time)
	{
	    if(time<10)
	        time = "0"+time;
	
	    return time;
	}
	function resetTime()
	{
	    ms = 0;
	    secs = 0;
	    mins = 0;
	    hours = 0;
	
	}
	function clearTime()
	{
	    resetTime();
	    document.getElementById("showTime").innerHTML = hours + " : " + mins + " : " + secs + " : " + ms;
	    if(!isCounting)
	        document.getElementById("start").value = "Start";
	}
	
	
	</script>
</html>
