<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				href="${pageContext.request.contextPath }/admincp/display/banner/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-banner').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Quản lý Banner</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/display/banner">Quản
					lý Banner</a></li>
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
				action="${pageContext.request.contextPath }/admincp/display/banner/del"
				method="post" enctype="multipart/form-data" id="form-banner">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><a>Tên Banner</a></td>
								<td class="text-left"><a>Picture</a></td>
								<td class="text-left"><a>Thứ tự</a></td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listBanner }" var="objBanner">
								<tr>
									<td class="text-center"><input type="checkbox"
										name="selected" value="${objBanner.id_banner }" /></td>
									<td class="text-left">${objBanner.name }</td>
									<td class="text-left"><img width="100%" height="150px" alt="${objBanner.name }"
										src="${pageContext.request.contextPath }/files/${objBanner.picture}"></td>
										<td class="text-left">${objBanner.thu_tu }</td>
									<td class="text-right"><a
										href="${pageContext.request.contextPath }/admincp/display/banner/edit/${objBanner.id_banner}"
										data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
											class="fa fa-pencil"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
			</form>
		</div>
	</div>