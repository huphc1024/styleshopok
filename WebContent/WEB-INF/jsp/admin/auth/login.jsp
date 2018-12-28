<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container-fluid">
	<br /> <br />
	<div class="row">
		<div class="col-sm-offset-4 col-sm-4">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h1 class="panel-title">
						<i class="fa fa-lock"></i> Vui lòng điền thông tin đăng nhập.
					</h1>
				</div>
				<div class="panel-body">
					<c:if test="${error == 'loginErr' }">
						<p style="color: red; font-style: italic;">Sai tên đăng nhập
							hoặc mật khẩu</p>
					</c:if>
					<form action="${pageContext.request.contextPath }/admincp/login"
						method="post" >
						<div class="form-group">
							<label for="input-username">Tên đăng nhập:</label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-user"></i></span>
								<input type="text" name="username" value=""
									placeholder="Tên đăng nhập:" id="username"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="input-password">Mật khẩu:</label>
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-lock"></i></span>
								<input type="password" name="password" value=""
									placeholder="Mật khẩu:" id="password"
									class="form-control" />
							</div>
						</div>
						<div class="text-right">
							<button type="submit" class="btn btn-primary">
								<i class="fa fa-key"></i> Đăng nhập
							</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>