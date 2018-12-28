<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="page-header">
	<div class="container-fluid">
		<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i>${msg }
				<button type="button" class="close" data-dismiss="alert">×</button>
			</div>
		</c:if>
		<div class="pull-right">
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-user').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Quản lý Liên hệ</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/lien-he">Quản
					lý Liên hệ</a></li>
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
				action="${pageContext.request.contextPath }/admincp/account/lien-he/del"
				method="post" enctype="multipart/form-data" id="form-user">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><a>Họ và tên</a></td>
								<td class="text-left"><a>Email</a></td>
								<td class="text-left"><a>Nội dung</a></td>
								<td class="text-left"><a>Ngày tạo</a></td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listLienHe }" var="objLH">
								<tr>
									<td class="text-center"><input type="checkbox"
										name="selected" value="${objLH.id_lien_he }" /></td>
									<td class="text-left">${objLH.name }</td>
									<td class="text-left">${objLH.email }</td>
									<td class="text-left">${objLH.noidung }</td>
									<fmt:formatDate value="${objLH.date_create}"
										pattern="dd/MM/yyyy" var="fmtDate" />
									<td class="text-left">${fmtDate }</td>
									<td class="text-right"><a
										href="${pageContext.request.contextPath }/admincp/lien-he/edit"
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
