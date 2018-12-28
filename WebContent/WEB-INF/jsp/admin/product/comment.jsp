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
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-review').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Bình luận</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/comment">Bình
					luận</a></li>
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
					<div class="col-sm-6">
						<div class="form-group">
							<label class="control-label" for="input-product">Sản
								phẩm:</label> <input type="text" name="filter_product" value=""
								placeholder="Sản phẩm:" id="input-product" class="form-control" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="control-label" for="input-date-added">Ngày
								thêm</label>
							<div class="input-group date">
								<input type="text" name="filter_date_added" value=""
									placeholder="Ngày thêm" data-date-format="YYYY-MM-DD"
									id="input-date-added" class="form-control" /> <span
									class="input-group-btn">
									<button type="button" class="btn btn-default">
										<i class="fa fa-calendar"></i>
									</button>
								</span>
							</div>
						</div>
						<button type="button" id="button-filter"
							class="btn btn-primary pull-right">
							<i class="fa fa-filter"></i> Lọc
						</button>
					</div>
				</div>
			</div> -->
			<form
				action="${pageContext.request.contextPath }/admincp/comment/del"
				method="post" enctype="multipart/form-data" id="form-review">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><a href="#">Sản phẩm</a></td>
								<td class="text-left"><a href="#">Họ tên</a></td>
								<td class="text-right"><a href="">Nội dung</a></td>
								<td class="text-left"><a href="#">Ngày thêm</a></td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listComment }" var="objC">
								<tr>
									<td class="text-center"><input type="checkbox"
										name="selected" value="${objC.id_comment }" /></td>
									<td class="text-left">${objC.pname }</td>
									<td class="text-left">${objC.ho_ten }</td>
									<td class="text-right">${objC.noi_dung }</td>
									<fmt:formatDate value="${objC.date_create}"
										pattern="hh:mm  dd/MM/yyyy" var="fmtDate" />
									<td class="text-left">${fmtDate }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"></div>
				<div class="col-sm-6 text-right">Hiển thị từ 1 đến 4 của 4 (1
					Trang)</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
<!--
	$('#button-filter')
			.on(
					'click',
					function() {
						url = 'index.php?route=catalog/review&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y';

						var filter_product = $('input[name=\'filter_product\']')
								.val();

						if (filter_product) {
							url += '&filter_product='
									+ encodeURIComponent(filter_product);
						}

						var filter_author = $('input[name=\'filter_author\']')
								.val();

						if (filter_author) {
							url += '&filter_author='
									+ encodeURIComponent(filter_author);
						}

						var filter_status = $('select[name=\'filter_status\']')
								.val();

						if (filter_status != '*') {
							url += '&filter_status='
									+ encodeURIComponent(filter_status);
						}

						var filter_date_added = $(
								'input[name=\'filter_date_added\']').val();

						if (filter_date_added) {
							url += '&filter_date_added='
									+ encodeURIComponent(filter_date_added);
						}

						location = url;
					});
//-->
</script>
<script type="text/javascript">
<!--
	$('.date').datetimepicker({
		pickTime : false
	});
//-->
</script>