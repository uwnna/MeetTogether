<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<title>MeetTogether - Article Verify</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<style type="text/css">
body {
	background-color: #e7eef1;
	font-family: 微軟正黑體;
}

.point {
	cursor: pointer;
}

.hero-wrap {
	width: 100%;
	height: 300px;
	position: inherit;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: top center;
}

.hero-wrap .overlay {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	content: '';
	opacity: .4;
	background: #000000;
	height: 300px;
}

@media ( max-width : 991.98px) {
	.hero-wrap {
		height: 450px;
	}
	.hero-wrap .overlay {
		height: 450px;
	}
}

.hero-wrap.hero-wrap-2 {
	height: 300px !important;
	position: relative;
}

.hero-wrap.hero-wrap-2 .overlay {
	width: 100%;
	opacity: .05;
	height: 300px;
}

.hero-wrap.hero-wrap-2 .slider-text {
	height: 300px !important;
}

.ftco-section {
	padding: 2em 0;
	position: relative;
}

@media ( max-width : 767.98px) {
	.ftco-section {
		padding: 2em 0;
	}
} /* 留言左側section與上方距離，原為6em */
.mt-5, .my-5 {
	margin-top: 1em !important;
} /* 發文單篇與上方距離，原為3rem */
.reply {
	padding: 5px 10px;
	background: #e6e6e6;
	color: #000000;
	text-transform: uppercase;
	font-size: 11px;
	letter-spacing: .1em;
	font-weight: 400;
	border-radius: 4px;
}

.reply:hover {
	color: #fff;
	background: black;
}

.col-md-8 {
    -webkit-box-flex: 0;
    -ms-flex: 0 0 95%;
    flex: 0 0 95%;
    max-width: 95%; }
.MemberPic {
	border-radius: 50%;
	height: 30px;
	margin: 8px 5px;
	display: inline-flex;
	align-items: center;
	float: left;
}
.likeBtn, .dislikeBtn, .replyBtn {
	height: 20px;
	cursor: pointer;
}
p {
	margin-bottom: 0;
}
</style>
<script type="text/javascript">
	$(document).ready(
		function() {
			$("#Postbox").hide();
			$("#Postbutton").click(function() {
				$("#Postbox").toggle("blind"); /* 展開發文表單 */
				/* $('html,body').animate({
					scrollTop : 0
				}); 返回到頁面頂端 */
			});
			$("#ViewMyPost").click(
				function() {
					top.location.href = "${pageContext.request.contextPath}/GetUserPostServlet?memberId=${userId}";
				});
			$("#ViewAllPost").click(
				function() {
					top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
				});
			$("input#deletePost").click(function() {
				var c = confirm('是否確認刪除');
				console.log(c);
				if (c) {
					$(this).parent("form#deletePostForm").submit();
				} else {
				}
			});
			
			$("#nverify").click(function() {
				top.location.href = "${pageContext.request.contextPath}/GetAllPostServlet";
			});
			$(".reupload").hide();
			$("#renewPhoto").click(function() {
				if ($(this).prop("checked") == false) {
					$(".reupload").hide();
				} else if ($(this).prop("checked") == true){
					$(".reupload").show();
				}
			});
		});
</script>
</head>
<body>
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/">Meet<span>Together</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a
						href="${pageContext.request.contextPath}/" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="#" class="nav-link">About</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Our Car</a></li>
					<li class="nav-item active"><a
						href="${pageContext.request.contextPath}/GetAllPostServlet"
						class="nav-link">Blog</a></li>
					<li class="nav-item"><a href="#" class="nav-link">Member
							Center</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10927/images/blog00.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-end justify-content-start">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs">
						<span class="mr-2"><a
							href="${pageContext.request.contextPath}/">首頁 <i
								class="ion-ios-arrow-forward"></i></a></span> <span>討論區 <i
							class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-3 bread">討論區</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<!-- .col-md-8 -->
				<!-- 左側選單 -->
				<div class="col-md-4 sidebar ftco-animate">
					<div class="sidebar-box ftco-animate">
						<h3 id="Postbutton" class="point">+ 發表文章</h3>
						<h3 id="ViewMyPost" class="point">+ 看自己的文章</h3>
						<h3 id="ViewAllPost" class="point">+ 看所有文章</h3>
					</div>
					<div class="sidebar-box ftco-animate">
						<div class="categories">
							<h3>分類查詢</h3>
							<c:forEach items="${msgType}" var="type" varStatus="typeCnt">
								<li><a href="${pageContext.request.contextPath}/SearchPostByType?typeId=${type.key}">${type.value}
									<input type="hidden" id="msgTypeId" value="${type.key}">
									<span id="msgTypeCnt${typeCnt.count}" class="msgTypeCnt">${mtc.value }</span>
								</a></li>
							</c:forEach>
						</div>
					</div>
					<div class="sidebar-box ftco-animate">
						<h3>關鍵字查詢</h3>
						<form action="./SearchPostServlet" method="GET"
							class="search-form">
							<div class="form-group">
								<span class="icon icon-search"></span> <input type="text"
									class="form-control" name="queryString" id="queryString"
									placeholder="Type a keyword" autocomplete="off">
							</div>
						</form>
					</div>
					<div class="sidebar-box ftco-animate">
						<h3>熱門文章</h3>
						<c:forEach items="${popularMsgBeans}" var="recentMsgBean">
						<div class="block-21 mb-4 d-flex">
							<a class="blog-img mr-4"
								style="background-image: url(${pageContext.request.contextPath}/getImage?type=member&id=${recentMsgBean.member.memberId});"></a>
							<div class="text">
								<h3 class="heading">
									<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${recentMsgBean.msgId}">${recentMsgBean.msgTitle }</a>
								</h3>
								<div class="meta">
									<div>
										<span class="icon-calendar"></span>${recentMsgBean.createTimeFormat}
									</div>
									<div>
										<a href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${recentMsgBean.member.memberId}"><span class="icon-person"></span>${recentMsgBean.member.memberName}</a>
									</div>
									<div>
										<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${recentMsgBean.msgId}"><span class="icon-chat"></span>${recentMsgBean.replyCount}</a>
									</div>
								</div>
							</div>
						</div>
						</c:forEach>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Tag Cloud</h3>
						<div class="tagcloud">
							<a href="#" class="tag-cloud-link">dish</a>
							<a href="#" class="tag-cloud-link">menu</a>
							<a href="#" class="tag-cloud-link">food</a>
							<a href="#"class="tag-cloud-link">sweet</a>
							<a href="#" class="tag-cloud-link">tasty</a>
							<a href="#" class="tag-cloud-link">delicious</a>
							<a href="#" class="tag-cloud-link">desserts</a>
							<a href="#" class="tag-cloud-link">drinks</a>
						</div>
					</div>
				</div>

				<!-- 右側文章 -->
				<div style="width: 66%">
					<!-- 發文 -->
					<div id="Postbox" class="col-md-8 order-md-last ftco-animate">
						<form:form method="post" action="./PostServlet"
							enctype="multipart/form-data" id="postForm"
							modelAttribute="messageBean">
							<form:input type="hidden" path="mbId" value="${userId}" />
							<table>
								<tr>
									<td>文章分類
									<td><form:select path="mtId" style="width: 100%"
											class="form-control">
											<form:options items="${msgType}" />
										</form:select>
								<tr>
									<td>文章標題
									<td><form:input type="text" name="msgTitle" id="msgTitle"
											path="msgTitle" size="65%" autocomplete="off"
											class="form-control" required="required" /> <form:errors
											path="msgTitle" class="errors"></form:errors>
								<tr>
									<td>文章內容
									<td><form:textarea rows="7em" cols="65%" name="msgText"
											id="msgText" path="msgText" class="form-control"
											required="required" /> <form:errors path="msgText"
											class="errors"></form:errors>
								<tr>
									<td>上傳照片
									<td><form:input type="file" name="msgImage" id="msgImage"
											path="msgImage" class="form-control" />
							</table>
							<br>
							<input type="submit" value="發文" name="post" id="post"
								class="reply" />
							<input type="reset" value="清空" name="cancel" id="cancel"
								class="reply" />
						</form:form>
						<br>
					</div>

					<!-- 一則文章 -->
<%-- 					<c:forEach items="${msgBeans}" var="msgBean" varStatus="cnt"> --%>
<%-- 						<c:set var="mId" value="${msgBean.member.memberId}" /> --%>
						<div class="col-md-8 order-md-last ftco-animate">
							<div class="about-author d-flex p-4 bg-light">
								<div class="bio mr-5">
									<a
										href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}"><img
										height='60'
										src='${pageContext.request.contextPath}/getImage?type=member&id=${msgBean.member.memberId}'></a>
								</div>
								<div>
									<a
										href="${pageContext.request.contextPath}/GetUserPostServlet?memberId=${msgBean.member.memberId}">${msgBean.member.memberName}<span>&emsp;&emsp;</span></a>
									<c:if test="${userId eq mId}">
										<form:form method="GET"
											action="${pageContext.request.contextPath}/ViewPostServlet"
											style='display: inline;' modelAttribute="messageBean">
											<form:input type="hidden" value="${msgBean.msgId}"
												path="msgId" />
											<input type="submit" value="編輯文章內容" class="reply" />
										</form:form>
										<form:form id="deletePostForm" method="post"
											action="${pageContext.request.contextPath}/DeletePostServlet"
											style="display: inline;" modelAttribute="messageBean">
											<form:input type="hidden" value="${msgBean.msgId}"
												path="msgId" />
											<input type="button" value="刪除此篇文章" class="reply"
												id="deletePost">
										</form:form>
									</c:if>
									<p>發文：<fmt:formatDate value="${msgBean.createTime}" pattern="yyyy-MM-dd HH:mm" />
									<c:if test="${msgBean.updateTime ne null}">
									&ensp;更新：<fmt:formatDate value="${msgBean.updateTime}" pattern="yyyy-MM-dd HH:mm" />
									</c:if></p>
									<a href='${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${msgBean.msgId}'>
									<img src="${pageContext.request.contextPath}/eeit10927/images/pencil.png" class="replyBtn">REPLY(${msgBean.replyCount})</a>
									<c:set var="done" value="false" />
									<c:forEach items="${mlBeans}" var="mlBean">
										<c:if test="${mlBean.message.msgId eq msgBean.msgId}">
											<c:set var="done" value="true" />
										</c:if>
									</c:forEach>
									<c:choose>
										<c:when test="${!done}">
											<img
												src="${pageContext.request.contextPath}/eeit10927/images/dislike.png"
												id="likeBtn" class="likeBtn">
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath}/eeit10927/images/like.png"
												id="dislikeBtn" class="likeBtn">
										</c:otherwise>
									</c:choose>
									<input type="hidden" id="msgId" value="${msgBean.msgId}">
									<span id="likeCnt${cnt.count}">LIKE(${msgBean.likeCount})</span>
								</div>
							</div>
							<h2 class="mb-3 mt-5" >
								<a href="${pageContext.request.contextPath}/SearchPostByType?typeId=${msgBean.msgType.typeId}">[${msgBean.msgType.typeName}]</a>
								&ensp;${msgBean.msgTitle}
							</h2>
							<div style="width:50%; float:left;">
							<p>${msgBean.msgTextShort}</p>
							<p>
								<a href="${pageContext.request.contextPath}/GetAllReMsgServlet?msgId=${msgBean.msgId}" class="btn-custom">
								閱讀更多 <span class="icon-long-arrow-right"></span></a>
							</div>
							<div>
							<c:if test="${msgBean.msgPhoto ne null}">
								<img height="200px"
									src='${pageContext.request.contextPath}/getImage?type=message&id=${msgBean.msgId}'>
							</c:if>
							</div>
							<div class="tag-widget post-tag-container mb-5 mt-5">
								<div class="tagcloud">
									<a href="#" class="tag-cloud-link">Life</a> <a href="#"
										class="tag-cloud-link">Sport</a> <a href="#"
										class="tag-cloud-link">Tech</a> <a href="#"
										class="tag-cloud-link">Travel</a>
								</div>
							</div>
						<hr>
						</div>
						
<%-- 					</c:forEach> --%>
				</div>
			</div>
		</div>

	</section>
	<!-- .section -->

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">About Autoroad</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-md-5">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">About</a></li>
							<li><a href="#" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Term and Conditions</a></li>
							<li><a href="#" class="py-2 d-block">Best Price
									Guarantee</a></li>
							<li><a href="#" class="py-2 d-block">Privacy &amp;
									Cookies Policy</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Customer Support</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">FAQ</a></li>
							<li><a href="#" class="py-2 d-block">Payment Option</a></li>
							<li><a href="#" class="py-2 d-block">Booking Tips</a></li>
							<li><a href="#" class="py-2 d-block">How it works</a></li>
							<li><a href="#" class="py-2 d-block">Contact Us</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon icon-map-marker"></span><span
									class="text">203 Fake St. Mountain View, San Francisco,
										California, USA</span></li>
								<li><a href="#"><span class="icon icon-phone"></span><span
										class="text">+2 392 3929 210</span></a></li>
								<li><a href="#"><span class="icon icon-envelope"></span><span
										class="text">info@yourdomain.com</span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart color-danger" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/aos.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

<script>
	$(document).ready(function() {
		let imgs = document.getElementsByClassName("likeBtn");
		for (let i = 0; i < imgs.length; i++) {
			let imgId = 'likeBtn' + i;
			$(imgs[i]).click(function() {
				let msgIdVal = $(this).next().val();
				let spanId = 'likeCnt' + (i + 1);
				console.log('msgIdVal:' + msgIdVal + ', spanId:' + spanId + ', userId:' + ${userId});
				let info = $(this).attr("id");
				console.log(info);
				if (info == 'likeBtn') {
					$.ajax({
						url : "LikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							let txt2 = 'span[id=' + spanId + ']';
							$(txt2).html(txt);
							console.log("data: " + data);
							$(imgs[i]).attr("id","dislikeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/like.png");
						}
					});
				} else {
					$.ajax({
						url : "DislikeMsgServlet",
						type : "GET",
						dataType : "JSON",
						data : {msgId : msgIdVal, userId : ${userId}},
						success : function(data) {
							let txt = 'LIKE(' + data + ')';
							let txt2 = 'span[id=' + spanId + ']';
							$(txt2).html(txt);
							console.log("data: " + data);
							$(imgs[i]).attr("id","likeBtn").attr("src","${pageContext.request.contextPath}/eeit10927/images/dislike.png");
						}
					});
				}
				
			});
		}
		
		let types = document.getElementsByClassName("msgTypeCnt");
		for (let j = 0; j < types.length; j++) {
			let typeIdVal = $(types[j]).prev().val();
			let typeSpanId = 'msgTypeCnt' + (j + 1);
			console.log('typeIdVal:' + typeIdVal + ', typeSpanId:' + typeSpanId);
			$.ajax({
				url : "getMsgTypeCnt",
				type : "GET",
				dataType : "JSON",
				data : {typeId : typeIdVal},
				success : function(data) {
					let txt = '(' + data + ')';
					let txt2 = 'span[id=' + typeSpanId + ']';
					$(txt2).html(txt);
					console.log("data: " + data);
				}
			});
		}
	});
	
</script>
</body>
</html>