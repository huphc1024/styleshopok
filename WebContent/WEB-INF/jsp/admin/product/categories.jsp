<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="page-header">
	<div class="container-fluid">
	<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i>${msg }
				<button type="button" class="close" data-dismiss="alert">×</button>
			</div>
		</c:if>
		<div class="pull-right">
			<a href="${pageContext.request.contextPath }/admincp/categories/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a> 
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-category').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Danh mục</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/categories">Danh
					mục</a></li>
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
				action="${pageContext.request.contextPath }/admincp/categories/del"
				method="post" enctype="multipart/form-data" id="form-category">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left">Ảnh</td>
								<td class="text-left"><a
									href=""
									>Tên danh mục</a></td>
								<td class="text-right">Trạng thái</td>
								<td class="text-right">Thứ tự</td>
								<td class="text-right">Hành động</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listCat }" var="objCat">
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected" value="${objCat.id_cat }" /></td>
								<td>
									<c:choose>
										<c:when test="${not empty objCat.picture }">
											<img width="50px" height="50px" src="${pageContext.request.contextPath }/files/${objCat.picture}"
												class="img-responsve img-thumbnail" />
										</c:when>
										<c:otherwise>
											<img width="50px" height="50px" src="${define.URL_ADMIN }/image/no-images.jpg"
												class="img-responsve img-thumbnail" />
										</c:otherwise>
									</c:choose>
								</td>
								<td class="text-left">${objCat.name }</td>
								<td class="text-right"><span class="text_enabled">
									<c:choose>
										<c:when test="${objCat.active == 1 }">Bật</c:when>
										<c:otherwise>Tắt</c:otherwise>
									</c:choose>
								</span>
								</td>
								<td class="text-right">${objCat.thu_tu }</td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/categories/edit/${objCat.id_cat}"
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
				<div class="col-sm-6 text-right">Hiển thị từ 1 đến 8 của 8 (1
					Trang)</div>
			</div>
		</div>
