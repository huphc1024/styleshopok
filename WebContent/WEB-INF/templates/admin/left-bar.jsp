<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${login != 'login' }">
<nav id="column-left">
	<div id="profile">
		<div>
			<a style="font-size: 30px;">S</a>
			<%-- <img width="33px" height="40px" src="${define.URL_ADMIN }/image/brand.png" alt="brand" /> --%>
		</div>
		<div>
			<h4>Style Shop</h4>
			<small>${name }</small>
		</div>
	</div>
	<ul id="menu">
		<li id="menu-dashboard"><a
			href="${pageContext.request.contextPath }/admincp"><i
				class="fa fa-dashboard fw"></i> <span>Bảng Điều Khiển</span></a></li>
		<li id="menu-catalog"><a class="parent"><i
				class="fa fa-tags fw"></i> <span>Sản phẩm</span></a>
			<ul>
				<li><a
					href="${pageContext.request.contextPath }/admincp/categories">Danh
						mục</a></li>
				<li><a
					href="${pageContext.request.contextPath }/admincp/product">Sản
						phẩm</a></li>
				<li><a
					href="${pageContext.request.contextPath }/admincp/comment">Bình
						luận</a></li>
				<li><a href="${pageContext.request.contextPath }/admincp/info">Thông
						tin</a></li>
			</ul></li>
		<li id="menu-sale"><a href="${pageContext.request.contextPath }/admincp/orders" ><i
				class="fa fa-shopping-cart fw"></i> <span>Đơn hàng</span></a></li>
		<li id="menu-customer"><a class="parent"><i
				class="fa fa-user fw"></i> <span>Quản lý Tài khoản</span></a>
			<ul>
				<li><a
					href="${pageContext.request.contextPath }/admincp/account/customer">Khách
						hàng</a></li>
				<li><a
					href="${pageContext.request.contextPath }/admincp/account/user">Quản
						lý Tài khoản</a></li>
				<li><a
					href="${pageContext.request.contextPath }/admincp/account/lien-he">Quản
						lý Liên hệ</a></li>
			</ul></li>
		<li id="menu-design"><a class="parent"><i
				class="fa fa-television fw"></i> <span>Giao diện</span></a>
			<ul>
				<li><a
					href="${pageContext.request.contextPath }/admincp/display/slider">Slider</a>
				</li>
				<li><a
					href="${pageContext.request.contextPath }/admincp//display/banner">Quản
						lý Banner</a></li>
			</ul></li>
</nav></c:if>