<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<div class="page-header">
	<div class="container-fluid">
	<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i>${msg }
				<button type="button" class="close" data-dismiss="alert">×</button>
			</div>
		</c:if>
		<div class="pull-right">
			<a
				href="${pageContext.request.contextPath }/admincp/account/user/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-user').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Quản lý Tài khoản</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
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
				<i class="fa fa-list"></i> Danh sách
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/account/user/del"
				method="post" enctype="multipart/form-data" id="form-user">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><a>Tên đăng nhập</a></td>
								<td class="text-left"><a>Fullname</a></td>
								<td class="text-left"><a>Phân quyền</a></td>
								<td class="text-left"><a>Trạng thái</a></td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listUser }" var="objUser">
							<tr>
								<td class="text-center"><c:if test="${objUser.username != 'admin' }"><input type="checkbox"
									name="selected" value="${objUser.id_user }" /></c:if></td>
								<td class="text-left">${objUser.username }</td>
								<td class="text-left">${objUser.fullname }</td>
								<td class="text-left">${objUser.role }</td>
								<td class="text-left"><c:if test="${objUser.active == 1 }"><a href="#">Bật</a></c:if>
								<c:if test="${objUser.active == 0 }"><a href="#">Tắt</a></c:if></td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/account/user/edit/${objUser.id_user}"
									data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
										class="fa fa-pencil"></i></a></td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"></div>
				<div class="col-sm-6 text-right">Hiển thị từ 1 đến 2 của 2 (1
					Trang)</div>
			</div>
		</div>
	</div>
</div>
