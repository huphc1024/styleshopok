<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html dir="ltr" lang="vi">
<head>
<meta charset="UTF-8" />
<c:choose>
	<c:when test="${not empty login }">
		<title>Login</title>
	</c:when>
	<c:otherwise>
		<title>Bảng Điều khiển</title>
	</c:otherwise>
</c:choose>

<base href="" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<link rel="icon" href="${define.URL_ADMIN }/image/brand.png" type="image/png" />

<script type="text/javascript"
	src="${define.URL_ADMIN }/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${define.URL_ADMIN }/javascript/bootstrap/js/bootstrap.min.js"></script>
<link href="${define.URL_ADMIN }/stylesheet/bootstrap.css" type="text/css"
	rel="stylesheet" />
<link href="${define.URL_ADMIN }/javascript/font-awesome/css/font-awesome.min.css"
	type="text/css" rel="stylesheet" />
<script src="${define.URL_ADMIN }/javascript/jquery/datetimepicker/moment.js"
	type="text/javascript"></script>
<script
	src="${define.URL_ADMIN }/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<script
	src="${define.URL_ADMIN }/ckeditor/ckeditor.js"
	type="text/javascript"></script>
<link
	href="${define.URL_ADMIN }/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" media="screen" />
<link type="text/css" href="${define.URL_ADMIN }/stylesheet/stylesheet.css"
	rel="stylesheet" media="screen" />
	<link type="text/css" href="${define.URL_ADMIN }/stylesheet/sliderlayer/typo.css" rel="stylesheet"
          media="screen"/>
          <link type="text/css" href="${define.URL_ADMIN }/stylesheet/sliderlayer/style.css" rel="stylesheet"
          media="screen"/>
          
	
<script src="${define.URL_ADMIN }/javascript/common.js" type="text/javascript"></script>
<script type="text/javascript" src="${define.URL_ADMIN }/javascript/jquery/ui/jquery-ui.min.js"></script>
        <script type="text/javascript" src="${define.URL_ADMIN }/stylesheet/sliderlayer/script.js"></script>

</head>
<body>
	<div id="container">
		<header id="header" class="navbar navbar-static-top">
			<div class="navbar-header">
			<c:if test="${login != 'login' }">	<a type="button" id="button-menu" class="pull-left"><i
					class="fa fa-indent fa-lg"></i></a></c:if> <a
					href="${pageContext.request.contextPath }/"
					class="navbar-brand"> <img width="69px" height="23px" src="${define.URL_ADMIN }/image/logo.png"
					alt="Quản trị Cửa hàng" title="Quản trị Cửa hàng" /></a>
			</div>
			<ul class="nav pull-right">
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" title="Cửa hàng"><i
						class="fa fa-home fa-lg"></i></a>
					<ul class="dropdown-menu dropdown-menu-right">
						<li class="dropdown-header">Cửa hàng</li>
						<li><a href="${pageContext.request.contextPath }/" target="_blank">Styleshop</a></li>
					</ul></li>
				<li>
				<c:if test="${login != 'login' }">
				<a
					href="${pageContext.request.contextPath }/admincp/logout"><span
						class="hidden-xs hidden-sm hidden-md">Thoát</span> <i
						class="fa fa-sign-out fa-lg"></i></a></c:if></li>
			</ul>
		</header>