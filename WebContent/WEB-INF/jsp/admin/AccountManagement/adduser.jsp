<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-user" data-toggle="tooltip"
					title="Lưu" class="btn btn-primary">
					<i class="fa fa-save"></i>
				</button>
				<a
					href="${pageContext.request.contextPath }/admincp/account/user"
					data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
					class="fa fa-reply"></i></a>
			</div>
			<h1>Quản lý Tài khoản</h1>
			<ul class="breadcrumb">
				<li><a
					href="${pageContext.request.contextPath }/admincp">Trang
						chủ</a></li>
				<li><a
					href="${pageContext.request.contextPath }/admincp/account/user">Quản
						lý Tài khoản</a></li>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-pencil"></i> Thêm Tài khoản
				</h3>
				<c:if test="${not empty msgt}"><p style="color: red; font-weight: bold;">${msgt }</p></c:if>
			</div>
			<div class="panel-body">
				<form action="${pageContext.request.contextPath }/admincp/account/user/add" method="post" enctype="multipart/form-data"
					id="form-user" class="form-horizontal">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-username">Tên
							đăng nhập</label>
						<div class="col-sm-10">
							<input type="text" name="username" value="${objUser.username }"
								placeholder="Tên đăng nhập" id="input-username"
								class="form-control" />
							<form:errors path="objUser.username"
								cssStyle="color:red; font-style:italic;"></form:errors>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-user-group">Phân
							quyền</label>
						<div class="col-sm-10">
							<select name="role" id="input-user-group" class="form-control">
								<c:choose>
									<c:when test="${not empty objUser.role }">
										<c:if test="${'ADMIN' == objUser.role }">
											<c:set value="selected='selected'" var="roleadmin"></c:set>
										</c:if>
										<c:if test="${'MOD' == objUser.role }">
											<c:set value="selected='selected'" var="rolemodd"></c:set>
										</c:if>
										<c:if test="${'MEMBER' == objUser.role }">
											<c:set value="selected='selected'" var="rolemember"></c:set>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:set value="selected='selected'" var="rolenull"></c:set>
									</c:otherwise>
								</c:choose>
								<option ${roleadmin } value="ADMIN">ADMIN</option>
								<option ${rolemodd } value="MOD">MOD</option>
								<option ${rolemember } ${rolenull } value="MEMBER">MEMBER</option>
							</select>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-firstname">Fullname</label>
						<div class="col-sm-10">
							<input type="text" name="fullname" value="${objUser.fullname }"
								placeholder="Fullname" id="input-firstname" class="form-control" />
							<form:errors path="objUser.fullname"
								cssStyle="color:red; font-style:italic;"></form:errors>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-password">Mật
							khẩu</label>
						<div class="col-sm-10">
							<input type="password" name="password" value=""
								placeholder="Mật khẩu" id="input-password" class="form-control"
								autocomplete="off" />
								<c:if test="${not empty msgPass }"><p style="color: red; font-style: italic;">${msgPass }</p></c:if>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-confirm">Xác
							nhận Mật khẩu</label>
						<div class="col-sm-10">
							<input type="password" name="re_password" value=""
								placeholder="Xác nhận Mật khẩu" id="input-confirm"
								class="form-control" />
								<c:if test="${not empty msgRepass }"><p style="color: red; font-style: italic;">${msgRepass }</p></c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status">Trạng
							thái</label>
						<div class="col-sm-10">
							<select name="active" id="input-status" class="form-control">
								<option value="0">Tắt</option>
								<option value="1" selected="selected">Bật</option>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>