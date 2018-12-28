<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="page-header">
	<div class="container-fluid">
	<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i>${msg }
				<button type="button" class="close" data-dismiss="alert">×</button>
			</div>
		</c:if>
		<div class="pull-right">
			<button type="button" id="button-delete" form="form-order"
				formaction="${pageContext.request.contextPath }/admincp/orders/del"
				data-toggle="tooltip" title="Xóa" class="btn btn-danger">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Quản lý Đơn hàng</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp/">Trang
					chủ</a></li>
			<li><a href="${pageContext.request.contextPath }/admincp/orders">Quản
					lý Đơn hàng</a></li>
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
							<label class="control-label" for="input-order-id">Mã Đơn
								hàng cần tìm</label> <input type="text" name="filter_order_id" value=""
								placeholder="Mã Đơn hàng cần tìm" id="input-order-id"
								class="form-control" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-customer">Khách
								hàng:</label> <input type="text" name="filter_customer" value=""
								placeholder="Khách hàng:" id="input-customer"
								class="form-control" />
						</div>
					</div>
					<div class="col-sm-4">
						<div class="form-group">
							<label class="control-label" for="input-date-added">Ngày
								Đặt hàng</label>
							<div class="input-group date">
								<input type="text" name="filter_date_added" value=""
									placeholder="Ngày Đặt hàng" data-date-format="YYYY-MM-DD"
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
			<form method="post" action="" enctype="multipart/form-data"
				id="form-order">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-right"><a href="">Mã Đơn hàng</a></td>
								<td class="text-left"><a href="">Khách hàng</a></td>
								<td class="text-left"><a href="">Ngày Đặt hàng</a></td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listOrders}" var="objOrder">
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected" value="${objOrder.id_orders }" /> </td>
								<td class="text-right">${objOrder.id_orders }</td>
								<td class="text-left">${objOrder.ho } ${objOrder.ten }</td>
								<fmt:formatDate value="${objOrder.date_create }" pattern="dd/MM/yyyy" var="fmtDate"/>
								<td class="text-left">${fmtDate }</td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/orders/info/${objOrder.id_orders}"
									data-toggle="tooltip" title="Xem" class="btn btn-info"><i
										class="fa fa-eye"></i></a> </td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"></div>
			</div>
		</div>
	</div>
<script type="text/javascript">
<!--
	$('#button-filter')
			.on(
					'click',
					function() {
						url = 'index.php?route=sale/order&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y';

						var filter_order_id = $(
								'input[name=\'filter_order_id\']').val();

						if (filter_order_id) {
							url += '&filter_order_id='
									+ encodeURIComponent(filter_order_id);
						}

						var filter_customer = $(
								'input[name=\'filter_customer\']').val();

						if (filter_customer) {
							url += '&filter_customer='
									+ encodeURIComponent(filter_customer);
						}

						var filter_order_status = $(
								'select[name=\'filter_order_status\']').val();

						if (filter_order_status != '*') {
							url += '&filter_order_status='
									+ encodeURIComponent(filter_order_status);
						}

						var filter_total = $('input[name=\'filter_total\']')
								.val();

						if (filter_total) {
							url += '&filter_total='
									+ encodeURIComponent(filter_total);
						}

						var filter_date_added = $(
								'input[name=\'filter_date_added\']').val();

						if (filter_date_added) {
							url += '&filter_date_added='
									+ encodeURIComponent(filter_date_added);
						}

						var filter_date_modified = $(
								'input[name=\'filter_date_modified\']').val();

						if (filter_date_modified) {
							url += '&filter_date_modified='
									+ encodeURIComponent(filter_date_modified);
						}

						location = url;
					});
//-->
</script>
<script type="text/javascript">
<!--
	$('input[name=\'filter_customer\']')
			.autocomplete(
					{
						'source' : function(request, response) {
							$
									.ajax({
										url : 'index.php?route=customer/customer/autocomplete&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&filter_name='
												+ encodeURIComponent(request),
										dataType : 'json',
										success : function(json) {
											response($
													.map(
															json,
															function(item) {
																return {
																	label : item['name'],
																	value : item['customer_id']
																}
															}));
										}
									});
						},
						'select' : function(item) {
							$('input[name=\'filter_customer\']').val(
									item['label']);
						}
					});
//-->
</script>
<script type="text/javascript">
<!--
	$('input[name^=\'selected\']').on(
			'change',
			function() {
				$('#button-shipping, #button-invoice').prop('disabled', true);

				var selected = $('input[name^=\'selected\']:checked');

				if (selected.length) {
					$('#button-invoice').prop('disabled', false);
				}

				for (i = 0; i < selected.length; i++) {
					if ($(selected[i]).parent().find(
							'input[name^=\'shipping_code\']').val()) {
						$('#button-shipping').prop('disabled', false);

						break;
					}
				}
			});

	$('#button-shipping, #button-invoice').prop('disabled', true);

	$('input[name^=\'selected\']:first').trigger('change');

	// IE and Edge fix!
	$('#button-shipping, #button-invoice').on('click', function(e) {
		$('#form-order').attr('action', this.getAttribute('formAction'));
	});

	$('#button-delete').on('click', function(e) {
		$('#form-order').attr('action', this.getAttribute('formAction'));

		if (confirm('Bạn có Chắc chắn?')) {
			$('#form-order').submit();
		} else {
			return false;
		}
	});
//-->
</script>
<script
	src="${define.URL_ADMIN }/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
<link
	href="${define.URL_ADMIN }/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css"
	type="text/css" rel="stylesheet" media="screen" />
<script type="text/javascript">
<!--
	$('.date').datetimepicker({
		pickTime : false
	});
//-->
</script>