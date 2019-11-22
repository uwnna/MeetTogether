<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<title>MeetTogether - 討論區</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/aos.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.timepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/flaticon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/icomoon.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style2.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style type="text/css">
.likeBtn, .dislikeBtn, .replyBtn {
	height: 20px;
	cursor: pointer;
}
p {
	margin-bottom: 0;
}
.input_tag {
	height: 52px !important;
	font-size: 18px;
	border-radius: 5px;
	width: 50%;
	padding: 0.375rem 0.75rem;
	font-weight: 400;
	line-height: 1.5;
	border: 1px solid #ced4da;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
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
		
		
	});
</script>

</head>
<body>
<!-- vip購買 -->
<jsp:include page="/WEB-INF/views/vip_div.jsp"/>

	<!-- nav -->
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/">Meet<span>Together</span></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a href="${pageContext.request.contextPath}/" class="nav-link">首頁</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/pairs/" class="nav-link">交友</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/eeit10908/" class="nav-link">活動</a></li>
					<li class="nav-item active"><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="nav-link">討論區</a></li>
					<li class="nav-item"><a href="${pageContext.request.contextPath}/getmember" class="nav-link">會員資料</a></li>
					<li class="nav-item"><a class="nav-link"><c:if test="${!empty userId}">${userName}
						</c:if></a></li>
					<li class="nav-item"><c:if test="${!empty userId}">
						<img style="height: 40px; border-radius: 50%;" src='${pageContext.request.contextPath}/getImage?type=member&id=${userId}'>
						</c:if></li>
					<li class="nav-item"><c:if test="${!empty userId}">
						<a href="<c:url value='/LogoutServlet'  />" class="nav-link">登出</a>
						</c:if></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<section class="hero-wrap hero-wrap-2 js-fullheight"
		style="background-image: url('${pageContext.request.contextPath}/eeit10901/images/mt14.webp');"
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
		<h2 align="center">興趣</h2>
		
	<div style="width:200px">
	<p>
<a href="${pageContext.request.contextPath}/personal" class="nav-link">輸入個人喜好</a>
		<a href="${pageContext.request.contextPath}/addHope"class="nav-link">輸入個人希望條件</a>
	<a href="${pageContext.request.contextPath}/personalInterest" class="nav-link">輸入個人興趣</a>
	<a href="${pageContext.request.contextPath}/memberInterest" class="nav-link">個人興趣</a>
		<a href="${pageContext.request.contextPath}/addAlbum" class="nav-link">相簿</a>
	</p>
	</div>

	<div class="form-group">
<form:form modelAttribute="interest" method="get" >
<table width="400px" border="1" align="center">
<c:forEach var="interest" items="${interests }">
	<tr bgcolor="#FFDDAA">
		<td>${interest}</td>
	</tr>
</c:forEach>
</table>
</form:form>
</div>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
  <div class="container">
    <div class="row mb-5">
      <div class="col-md">
        <div class="ftco-footer-widget mb-4">
          <h2 class="ftco-heading-2">About MeetTogether</h2>
          <p>MeetTogether創造認識新朋友的機會，讓更多人有機會看見彼此，從線上好友的聊天互動、參與活動實際面對面、抒發心情與瀏覽文章建立一段段友誼</p>
          <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
            <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
            <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
            <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
          </ul>
        </div>
      </div>
      <div class="col-md">
        <div class="ftco-footer-widget mb-4 ml-md-5">
          <h2 class="ftco-heading-2">Information</h2>
          <ul class="list-unstyled">
            <li><a href="${pageContext.request.contextPath}/" class="py-2 d-block">首頁</a></li>
            <li><a href="${pageContext.request.contextPath}/pairs/" class="py-2 d-block">交友</a></li>
            <li><a href="${pageContext.request.contextPath}/eeit10908/" class="py-2 d-block">活動</a></li>
            <li><a href="${pageContext.request.contextPath}/GetAllPostServlet" class="py-2 d-block">討論區</a></li>
            <li><a href="${pageContext.request.contextPath}/getmember" class="py-2 d-block">會員資料</a></li>
          </ul>
        </div>
      </div>
      
      <div class="col-md">
        <div class="ftco-footer-widget mb-4">
        	<h2 class="ftco-heading-2">Have a Questions?</h2>
        	<div class="block-23 mb-3">
           <ul>
             <li><span class="icon icon-map-marker"></span><span class="text">106台北市大安區復興南路一段390號 2,3號15樓</span></li>
             <li><a href="#"><span class="icon icon-phone"></span><span class="text">02 6631 6666</span></a></li>
             <li><a href="#"><span class="icon icon-envelope"></span><span class="text">109meettogether@gmail.com</span></a></li>
           </ul>
         </div>
        </div>
      </div>
    </div>
  </div>
</footer>
</body>
</html>