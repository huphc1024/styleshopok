<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]>
<html dir="ltr" lang="vi" class="ie8"><![endif]-->
<!--[if IE 9 ]>
<html dir="ltr" lang="vi" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="ltr" lang="vi">
<!--<![endif]-->

<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>${title }</title>
<base />
<meta property="og:url" content="index.html" />
<meta property="og:type" content="website" />
<meta property="og:description" />
<meta property="og:image"
	content="${define.URL_PUBLIC }/image/catalog/logo/logo_styleshop.png" />
<meta name="twitter:card" content="summary" />
<meta name="twitter:description" />
<meta name="twitter:image"
	content="${define.URL_PUBLIC }/image/catalog/logo/logo_styleshop.png" />
<link href="${define.URL_PUBLIC }/stylesheet/bootstrap.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/stylesheet.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/font.css" rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/paneltool.css"
	rel="stylesheet" />
<link
	href="${define.URL_PUBLIC }/javascript/jquery/colorpicker/css/colorpicker.css"
	rel="stylesheet" />
<link
	href="${define.URL_PUBLIC }/javascript/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<link
	href="${define.URL_PUBLIC }/javascript/jquery/magnific/magnific-popup.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/homebuilder.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/pavverticalmenu/style.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/sliderlayer/css/typo.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/pavblog.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/pavproductcarousel.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/pavproducts.css"
	rel="stylesheet" />
<link
	href="${define.URL_PUBLIC }/javascript/jquery/owl-carousel/owl.carousel.css"
	rel="stylesheet" />
<link
	href="${define.URL_PUBLIC }/javascript/jquery/owl-carousel/owl.transitions.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/pavcarousel.css"
	rel="stylesheet" />
<link href="${define.URL_PUBLIC }/stylesheet/pavnewsletter.css"
	rel="stylesheet" />
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/jquery/magnific/jquery.magnific-popup.min.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/common_base.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/common.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/jquery/colorpicker/js/colorpicker.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/layerslider/jquery.themepunch.plugins.min.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/layerslider/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/jquery/owl-carousel/owl.carousel.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${define.URL_PUBLIC }/javascript/layerslider/jquery.slider.css" />
<link rel="stylesheet" type="text/css"
	href="${define.URL_PUBLIC }/javascript/layerslider/jquery.lightbox.css" />
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/layerslider/jquery.lightbox.js"></script>
<script type="text/javascript"
	src="${define.URL_PUBLIC }/javascript/layerslider/jquery.slider.min.js"></script>
<link
	href='https://fonts.googleapis.com/css?family=Source+Sans+Pro:400,300,200,400italic,700,600,300italic,600italic,700italic,900,900italic'
	rel='stylesheet' type='text/css'>

<link
	href="${define.URL_PUBLIC }/javascript/jquery/magnific/magnific-popup.css"
	type="text/css" rel="stylesheet" media="screen" />
<link
	href="${define.URL_PUBLIC }/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" media="screen" />
<link href="ao-jacket-penguin.html" rel="canonical" />
<link href="${define.URL_PUBLIC }/image/catalog/cart.png" rel="icon" />
<script
	src="${define.URL_PUBLIC }/javascript/jquery/magnific/jquery.magnific-popup.min.js"
	type="text/javascript"></script>
<script
	src="${define.URL_PUBLIC }/javascript/jquery/datetimepicker/moment.js"
	type="text/javascript"></script>
<script
	src="${define.URL_PUBLIC }/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
</head>
<body
	class="product-product-53 common-home page-common-home layout-fullwidth">

	<header id="header">
		<div id="topbar">
			<div class="container" style="position: relative;">
				<div class="show-desktop">
					<div class="quick-top-link">
						<div class="currency btn-top pull-left">
							<div class="currency-wrapper pull-left">
								<form
									action="${pageContext.request.contextPath }/index.php?route=common/currency/currency"
									method="post" enctype="multipart/form-data" id="form-currency">
									<input type="hidden" name="code" value=""> <input
										type="hidden" name="redirect"
										value="ao-jacket-penguin23e8.html?sort=rating&amp;order=ASC">
								</form>
							</div>
						</div>
						<div class="welcome pull-right">

							<c:if test="${objCus.username == null}">
								<a href="${pageContext.request.contextPath }/dang-ky">Đăng
									ký</a>
								hoặc <a href="${pageContext.request.contextPath }/dang-nhap">Đăng
									nhập</a>
							</c:if>
							<div class="quick-access btn-group btn-top">
								<button type="button" class="form-control"
									data-toggle="dropdown">
									<span class="quick-icon"> Tài khoản <span
										class="fa fa-caret-down"></span>
									</span>
								</button>
								<div class="dropdown-menu">
									<ul class="links">
										<li><a
											href="${pageContext.request.contextPath }/tai-khoan">Tài
												khoản</a></li>
										<li><a
											href="${pageContext.request.contextPath }/tai-khoan/danh-sach-thich">Yêu
												thích (0)</a></li>
										<li><a
											href="${pageContext.request.contextPath }/gio-hang">Giỏ
												hàng</a></li>
										<li><a
											href="${pageContext.request.contextPath }/thanh-toan">Thanh
												toán</a></li>
										<li><a
											href="${pageContext.request.contextPath }/tai-khoan/lich-su-dat-hang">Lịch
												sử đơn hàng</a></li>
										<c:if test="${objCus.username != null}">
											<li><a
												href="${pageContext.request.contextPath }/dang-xuat">Đăng
													xuất</a></li>
										</c:if>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="search">
						<div class="input-group">
							<input type="text" name="search" placeholder="Tìm kiếm" value=""
								class="input-search form-control" /> <span
								class="input-group-btn">
								<button class="button-search" type="button">
									<em class="fa fa-search"></em>
								</button>
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="header-main">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 logo">
						<div id="logo-theme">
							<a href="${pageContext.request.contextPath }"><img
								src="${define.URL_PUBLIC }/image/catalog/logo/logo_styleshop.png"
								title="Styleshop" alt="Styleshop" class="img-responsive" /></a>
						</div>
					</div>
					<div class="col-sm-7 col-xs-12">
						<div class="hidden-xs hidden-sm inner pull-left">
							<div class="support">
								<div class="box-services">
									<span class="pull-left"><i class="fa fa-truck">&nbsp;</i></span>
									<div class="media-body">
										<h3>
											<a href="#" target="_blank">MIỄN PHÍ GIAO HÀNG</a>
										</h3>
										<small>Các đơn hàng từ 150.000đ </small>
									</div>
								</div>
								<div class="box-services">
									<span class="pull-left"><i class="fa fa-refresh">&nbsp;</i></span>
									<div class="media-body">
										<h3>
											<a href="#" target="_blank">TRAO ĐỔI &amp; GIAO DỊCH</a>
										</h3>
										<small>Trong 3 ngày làm việc</small>
									</div>
								</div>
								<div class="box-services">
									<span class="pull-left"><i class="fa fa-phone">&nbsp;</i></span>
									<div class="media-body">
										<h3>
											<a href="#" target="_blank">HỖ TRỢ KHÁCH HÀNG 24/7</a>
										</h3>
										<small>Đảm bảo luôn có nhân viên trực</small>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-sm-2 col-xs-12">

						<div id="cart" class="cart pull-right">
							<div data-toggle="dropdown" data-loading-text="Đang tải"
								class="heading media dropdown-toggle">
								<div class="cart-inner media-body">
									<span class="icon-cart"></span>
									<h4>Giỏ hàng</h4>
									<c:set value="0" var="tong"></c:set>
									<c:set value="0" var="i"></c:set>
									<c:forEach items="${listCart }" var="cart">
										<c:if test="${cart.gia_sale == 0 }">
											<c:set value="${tong + (cart.num * cart.gia)}" var="tong"></c:set>
										</c:if>
										<c:if test="${cart.gia_sale != 0 }">
											<c:set value="${tong + (cart.num * cart.gia_sale)}"
												var="tong"></c:set>
										</c:if>
										<c:set value="${i+1}" var="i"></c:set>
									</c:forEach>
									<a><span id="cart-total">${i } sản phẩm - ${tong } đ</span></a>
								</div>
							</div>
							<c:choose>
								<c:when test="${listCart == null }">
									<ul class="dropdown-menu pull-right">
										<li>
											<p class="text-center">Giỏ hàng của bạn trống!</p>
										</li>
									</ul>
								</c:when>
								<c:otherwise>
									<ul class="dropdown-menu pull-right">
										<c:forEach items="${listCart }" var="cart">
											<li>
												<table style='width: 500px;' class="table table-striped">
													<tbody>
														<tr>
															<td style='width: 230px; height: 47px;'
																class="text-center"><a
																href="${pageContext.request.contextPath }/${slugUtils.toSlug(cart.name)}-${cart.id_product}.html"><img
																	width='47px' height='47px'
																	src="${pageContext.request.contextPath }/${cart.picture}"
																	alt="Áo khoác The North Face"
																	title="Áo khoác The North Face"></a></td>

															<td class="text-left"><a
																href="${pageContext.request.contextPath }/${slugUtils.toSlug(cart.name)}-${cart.id_product}.html">${cart.name }</a></td>

															<td class="text-right cart-number">x ${cart.num }</td>
															<c:choose>
																<c:when test="${cart.gia_sale  == 0}">
																	<td class="text-right">${cart.gia }</td>
																</c:when>
																<c:otherwise>
																	<td class="text-right">${cart.gia_sale }</td>
																</c:otherwise>
															</c:choose>
															<td class="text-center"><button type="button"
																	onclick="return cartremove${cart.id_product}();"
																	title="Gỡ bở" class="btn btn-primary btn-xs">
																	<i class="fa fa-times"></i>
																</button></td>
														</tr>
													</tbody>
												</table>
											</li>
										</c:forEach>
										<li>
											<div>
												<table class="table table-bordered">
													<tbody>
														<tr>
															<td class="text-right"><strong>Thành tiền</strong></td>
															<td class="text-right">${tong }đ</td>
														</tr>
													</tbody>
												</table>
												<p class="text-right">
													<a href="${pageContext.request.contextPath }/gio-hang"
														class="button btn btn-theme-default"><i
														class="fa fa-shopping-cart"></i>Xem giỏ hàng</a> <a
														href="${pageContext.request.contextPath }/thanh-toan"
														class="button btn btn-theme-default"><i
														class="fa fa-share"></i>Thanh toán</a>
												</p>
											</div>
										</li>
									</ul>
								</c:otherwise>
							</c:choose>


						</div>
						<!-- end cart -->
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="sidebar-offcanvas visible-xs visible-sm">
		<div class="offcanvas-inner panel-offcanvas">
			<div class="offcanvas-heading panel-heading">
				<button data-toggle="offcanvas"
					class="btn btn-primary offcanvas-exit" type="button">
					<i class="fa fa-times-circle" aria-hidden="true"></i>
				</button>
			</div>
			<div class="offcanvas-body panel-body">
				<div id="offcanvasmenu"></div>
			</div>
		</div>
	</div>
	<style>
.sidebar-offcanvas {
	width: 100%;
	background: #FFFFFF;
	left: -100%;
	transition: left 0.2s;
	z-index: 9999;
}
</style>
	<script type="text/javascript">
		$("#offcanvasmenu").html($("#bs-megamenu").html());

		$(".offcanvas").click(function() {
			$(".sidebar-offcanvas").css('left', '0');
		});

		$(".offcanvas-exit").click(function() {
			$(".sidebar-offcanvas").css('left', '-100%');
		});
	</script>
	<!-- sys-notification -->
	<div id="sys-notification">
		<div class="container">
			<div id="notification"></div>
		</div>
	</div>
	<!-- /sys-notification -->
	<link href="${define.URL_PUBLIC }/javascript/fotorama/fotorama.css"
		type="text/css" rel="stylesheet" />
	<script src="${define.URL_PUBLIC }/javascript/fotorama/fotorama.js"
		type="text/javascript"></script>
	<style type="text/css">
.fotorama__thumb-border {
	border-color: #ff6346;
}
</style>

	<div id="pav-mainnav">
		<div class="container">
			<div class="pav-megamenu">
				<div class="navbar navbar-default" role="navigation">
					<div id="mainmenutop" class="megamenu" role="navigation">
						<div class="navbar-header">
							<button type="button"
								class="navbar-toggle hidden-lg hidden-md collapsed offcanvas"
								data-toggle="offcanvas" data-target="#bs-megamenu">
								<span class="fa fa-bars"></span>
							</button>
							<div id="bs-megamenu"
								class="collapse navbar-collapse navbar-ex1-collapse hidden-sm hidden-xs">
								<ul class="nav navbar-nav megamenu">
									<li class=""><a
										href="${pageContext.request.contextPath }/" target="_self"><span
											class="menu-title">Trang chủ</span></a></li>
									<li class=""><a
										href="${pageContext.request.contextPath }/about"
										target="_self"><span class="menu-title">Giới thiệu</span></a></li>
									<li class=""><a
										href="${pageContext.request.contextPath }/product"
										target="_self"><span class="menu-title">Sản phẩm</span></a></li>
									<li class=""><a
										href="${pageContext.request.contextPath }/lien-he"
										target="_self"><span class="menu-title">Liên hệ</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="sidebar-offcanvas sidebar visible-xs visible-sm">
		<div class="offcanvas-inner panel panel-offcanvas">
			<div class="offcanvas-heading panel-heading">
				<button data-toggle="offcanvas"
					class="btn btn-default offcanvas-exit" type="button">
					<span class="fa fa-times"></span>
				</button>
			</div>
			<div class="offcanvas-body panel-body">
				<div id="offcanvasmenu">
					<ul class="nav navbar-nav megamenu">
						<li class=""><a href="${pageContext.request.contextPath }/"
							target="_self"><span class="menu-title">Trang chủ</span></a></li>
						<li class=""><a
							href="${pageContext.request.contextPath }/about" target="_self"><span
								class="menu-title">Giới thiệu</span></a></li>
						<li class=""><a
							href="${pageContext.request.contextPath }/product" target="_self"><span
								class="menu-title">Sản phẩm</span></a></li>
						<li class=""><a
							href="${pageContext.request.contextPath }/lien-he" target="_self"><span
								class="menu-title">Liên hệ</span></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$("#offcanvasmenu").html($("#bs-megamenu").html());

		$(".offcanvas").click(function() {
			$(".sidebar-offcanvas").css('left', '0');
		});

		$(".offcanvas-exit").click(function() {
			$(".sidebar-offcanvas").css('left', '-100%');
		});
	</script>
	
	<div class="container"></div>