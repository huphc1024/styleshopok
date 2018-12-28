<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="content" class="col-sm-9">
	<h1>Thanh toán</h1>
	<div class="panel-group" id="accordion">
<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="#" data-toggle="collapse"
						data-parent="#accordion" class="accordion-toggle collapsed">Bước
						1: Phương thức Thanh toán </i>
					</a>
				</h4>
			</div>
			<div class="panel-collapse collapse in" id="collapse-checkout-option"
				style="height: 0px;">
				<div class="panel-body">
					<div class="row">
						<div class="col-sm-6">
							<h2>Khách hàng mới</h2>
							<p>Phương thức Thanh toán:</p>
							<form action="${pageContext.request.contextPath }/checkCus" method="post">
							<div class="radio">
								<label> <input type="radio" name="account"
									value="register" checked="checked"> Đăng ký Tài khoản
								</label>
							</div>
							<div class="radio">
								<label> <input type="radio" name="account" value="guest">
									Khách Thanh toán
								</label>
							</div>
							<p>Bằng việc tạo tài khoản bạn có thể mua sắm nhanh hơn, theo
								dõi trạng thái đơn hàng, và theo dõi đơn hàng mà bạn đã đặt.</p>
							<input type="submit" value="Tiếp tục" id="button-account"
								data-loading-text="Đang tải..." class="btn btn-primary">
							</form>
						</div>
						<div class="col-sm-6">
							<h2>Returning Customer</h2>
							<p>Tôi là khách hàng cũ</p>
							<c:if test="${ not empty msgFail }">
            					<p style="color: red; font-style: italic;">${msgFail }</p>
            				</c:if>
							<form action="${pageContext.request.contextPath }/checklogin" method="post">
							<div class="form-group">
								<label class="control-label" for="input-email">Username</label> <input
									type="text" name="username" value="${username }" placeholder="Tên đăng nhập"
									id="input-email" class="form-control">
							</div>
							<div class="form-group">
								<label class="control-label" for="input-password">Mật
									khẩu</label> <input type="password" name="password" value=""
									placeholder="Mật khẩu" id="input-password" class="form-control">
							</div>
							<input type="submit" value="Đăng nhập" id="button-login"
								data-loading-text="Đang tải..." class="btn btn-primary">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>