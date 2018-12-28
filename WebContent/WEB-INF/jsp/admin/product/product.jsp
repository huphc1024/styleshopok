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
			<a href="${pageContext.request.contextPath }/admincp/product/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-product').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Sản phẩm</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/product">Sản
					phẩm</a></li>
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
			<!-- <div class="well">
				<div class="row">
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-name">Tên sản
								phẩm:</label> <input type="text" name="filter_name" value=""
								placeholder="Tên sản phẩm:" id="input-name" class="form-control" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-model">Mã Sản
								phẩm:</label> <input type="text" name="filter_model" value=""
								placeholder="Mã Sản phẩm:" id="input-model" class="form-control" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-status">Trạng
								thái:</label> <select name="filter_status" id="input-status"
								class="form-control">
								<option value="*"></option>
								<option value="1">Bật</option>
								<option value="0">Tắt</option>
							</select>
						</div>
						<button type="button" id="button-filter"
							class="btn btn-primary pull-right">
							<i class="fa fa-filter"></i> Lọc
						</button>
					</div>
				</div>
			</div> -->
			<form
				action="${pageContext.request.contextPath }/admincp/product/del"
				method="post" enctype="multipart/form-data" id="form-product">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
								</td>
								<td class="text-center">Hình ảnh</td>
								<td class="text-left"><a href="">Tên sản phẩm</a></td>
								<td class="text-right"><a href="">Giá</a></td>
								<td class="text-center"><a href="">Trạng thái</a></td>
								<td class="text-center">Hành động</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listProduct }" var="objP">
								<tr>
									<td class="text-center"><input type="checkbox"
										name="selected" value="${objP.id_product }" /></td>
									<td class="text-center"><img width="50px" height="50px"
										src="${pageContext.request.contextPath }/files/${objP.picture}"
										alt="${objP.name }" class="img-thumbnail" /></td>
									<td class="text-left">${objP.name }</td>
									<td class="text-right"><c:choose>
											<c:when test="${objP.gia_sale != 0 }">
												<span style="text-decoration: line-through;">${objP.gia }</span>
												<br />
												<div class="text-danger">${objP.gia_sale }</div>
											</c:when>
											<c:otherwise>
												<div class="text-danger">${objP.gia }</div>
											</c:otherwise>
										</c:choose></td>
									<td class="text-center"><span class="text_enabled">
											<c:choose>
												<c:when test="${objP.active == 1 }">
													Bật
												</c:when>
												<c:otherwise>
													Tắt
												</c:otherwise>
											</c:choose>
									</span></td>
									<td class="text-center" style="max-width: 150px;"><a
										href="${pageContext.request.contextPath }/admincp/product/edit/${objP.id_product}"
										data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
											class="fa fa-pencil"></i> <span class="hidden-xs">Sửa</span></a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left">
					<c:choose>
						<c:when test="${sumPage == 1 || sumPage == 0}">

						</c:when>
						<c:otherwise>
							<c:set var="back" value="0"></c:set>
							<c:set var="next" value="0"></c:set>
							<c:set var="loop" value="8"></c:set>
							<c:set var="num" value="1"></c:set>
							<c:set var="total" value="${sumPage }"></c:set>
							<c:set var="pages" value="${current_page }"></c:set>
							<c:choose>
								<c:when test="${1 == total }">
									<small>Trang 1 / 1</small>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${pages == 1 }">
											<c:set var="back" value="1"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="back" value="${pages - 1 }"></c:set>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${pages == total }">
											<c:set var="next" value="${total }"></c:set>
										</c:when>
										<c:otherwise>
											<c:set var="next" value="${pages + 1 }"></c:set>
										</c:otherwise>
									</c:choose>
									<c:if test="${total <= 8 }">
										<c:set var="loop" value="${total }"></c:set>
									</c:if>
									<c:if test="${pages > 8 - 0}">
										<c:set var="loop" value="${pages + 4 }"></c:set>
										<c:set var="num" value="${pages - 4 }"></c:set>
										<c:if test="${loop >= total }">
											<c:set var="loop" value="${total }"></c:set>
											<c:set var="num" value="${total - 8 + 1 }"></c:set>
										</c:if>
									</c:if>
									<small style="margin-right: 20px;">Trang ${pages } /
										${total }</small>
									<c:if test="${pages != 1 }">
										<a style="margin-right: 20px;"
											href="${pageContext.request.contextPath }/admincp/product?page=${back}"
											title=""><</a>
									</c:if>
									<c:forEach var="i" begin="${num }" end="${loop }">
										<c:choose>
											<c:when test="${pages == i }">
												<span
													style="margin-right: 20px; text-decoration: underline;">${i }</span>
											</c:when>
											<c:otherwise>
												<a style="margin-right: 20px;"
													href="${pageContext.request.contextPath }/admincp/product?page=${i}">${i }</a>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${pages != total }">
										<a
											href="${pageContext.request.contextPath }/admincp/product?page=${next}"
											title="">></a>
									</c:if>
								</c:otherwise>
							</c:choose>

						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>