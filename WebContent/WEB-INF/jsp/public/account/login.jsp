<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="content" class="col-sm-9">
	<div class="row">
		<div class="col-sm-6">
			<div class="well">
				<h2>Khách hàng mới</h2>
				<p>
					<strong>Đăng ký</strong>
				</p>
				<p>Bằng việc tạo tài khoản bạn có thể mua sắm nhanh hơn, theo
					dõi trạng thái đơn hàng, và theo dõi đơn hàng mà bạn đã đặt.</p>
				<a href="${pageContext.request.contextPath }/dang-ky"
					class="btn btn-primary">Tiếp tục</a>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="well">
				<h2>Khách hàng cũ</h2>
				<c:if test="${ not empty msgFail }">
					<p style="color: red; font-style: italic;">${msgFail }</p>
				</c:if>
				<p>
					<strong>Tôi là khách hàng cũ</strong>
				</p>
				<form action="${pageContext.request.contextPath }/login"
					method="post">
					<div class="form-group">
						<label class="control-label" for="input-email">Username</label> <input
							type="text" name="username" value="${username }" placeholder="Tên đăng nhập"
							id="input-email" class="form-control" />
					</div>
					<div class="form-group">
						<label class="control-label" for="input-password">Mật khẩu</label>
						<input type="password" name="password" value=""
							placeholder="Mật khẩu" id="input-password" class="form-control" />
						<br /> <input type="submit" value="Đăng nhập"
							class="btn btn-primary" />
				
					</div>
			</form>
		</div>
	</div>
</div>
</div>
</div>
