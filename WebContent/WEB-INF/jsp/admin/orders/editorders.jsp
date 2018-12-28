
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<a
				href="${pageContext.request.contextPath }/admincp/orders"
				class="btn btn-default"><i class="fa fa-reply"></i> Hủy</a>
		</div>
		<h1>Quản lý Đơn hàng</h1>
		<ul class="breadcrumb">
			<li><a
				href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/orders">Quản
					lý Đơn hàng</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-pencil"></i> Thêm Đơn hàng
			</h3>
		</div>
		<div class="panel-body">
			<form class="form-horizontal">
				<ul id="order" class="nav nav-tabs nav-justified">
					<li class=" active"><a href="#tab-customer" data-toggle="tab">1.
							Chi tiết Khách hàng</a></li>
					<li class=""><a href="#tab-cart" data-toggle="tab">2. Sản
							phẩm</a></li>
					<li class=""><a href="#tab-shipping" data-toggle="tab">3.
							Địa chỉ giao hàng</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab-customer">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-customer">Khách
								hàng:</label>
							<div class="col-sm-10">
								<input type="text" name="customer" value=""
									placeholder="Khách hàng:" id="input-customer"
									class="form-control" /> <input type="hidden"
									name="customer_id" value="" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-firstname">Họ:</label>
							<div class="col-sm-10">
								<input type="text" name="ho" value=""
									id="input-firstname" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-firstname">Tên:</label>
							<div class="col-sm-10">
								<input type="text" name="ten" value=""
									id="input-firstname" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-email">Email:</label>
							<div class="col-sm-10">
								<input type="text" name="email" value="" id="input-email"
									class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-telephone">Điện
								thoại:</label>
							<div class="col-sm-10">
								<input type="text" name="telephone" value=""
									id="input-telephone" class="form-control" />
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-cart">
						<div class="table-responsive">
							<table class="table table-bordered">
								<thead>
									<tr>
										<td class="text-left">Sản phẩm</td>
										<td class="text-left">Mã Sản phẩm</td>
										<td class="text-right">Số lượng</td>
										<td class="text-right">Đơn giá</td>
										<td class="text-right">Tổng</td>
										<td>Thao tác</td>
									</tr>
								</thead>
								<tbody id="cart">
									<tr>
										<td class="text-left">Áo khoác 2 mặt Alpha Industries<br />
											<input type="hidden" name="product[0][product_id]" value="54" />
										</td>
										<td class="text-left">alpha</td>
										<td class="text-right">1 <input type="hidden"
											name="product[0][quantity]" value="1" /></td>
										<td class="text-right"></td>
										<td class="text-right"></td>
										<td class="text-center"><button type="button" value="92"
												data-toggle="tooltip" title=""
												data-loading-text="Đang xử lý..." class="btn btn-danger"
												data-original-title="Xóa">
												<i class="fa fa-minus-circle"></i>
											</button></td>
									</tr>
									<tr>
										<td class="text-left">Áo khoác The North Face<br /> <input
											type="hidden" name="product[1][product_id]" value="42" />
										</td>
										<td class="text-left">TNF</td>
										<td class="text-right">1 <input type="hidden"
											name="product[1][quantity]" value="1" /></td>
										<td class="text-right"></td>
										<td class="text-right"></td>
										<td class="text-center"><button type="button" value="92"
												data-toggle="tooltip" title=""
												data-loading-text="Đang xử lý..." class="btn btn-danger"
												data-original-title="Xóa">
												<i class="fa fa-minus-circle"></i>
											</button></td>
									</tr>
									<tr>
										<td class="text-left">Bột Trà Xanh Nguyên Chất<br /> <input
											type="hidden" name="product[2][product_id]" value="30" />
										</td>
										<td class="text-left">face</td>
										<td class="text-right">1 <input type="hidden"
											name="product[2][quantity]" value="1" /></td>
										<td class="text-right"></td>
										<td class="text-right"></td>
										<td class="text-center"><button type="button" value="92"
												data-toggle="tooltip" title=""
												data-loading-text="Đang xử lý..." class="btn btn-danger"
												data-original-title="Xóa">
												<i class="fa fa-minus-circle"></i>
											</button></td>
									</tr>
									<tr>
										<td class="text-left">Vitamin C Serum<br /> <input
											type="hidden" name="product[3][product_id]" value="55" />
										</td>
										<td class="text-left">vitamin c</td>
										<td class="text-right">1 <input type="hidden"
											name="product[3][quantity]" value="1" /></td>
										<td class="text-right"></td>
										<td class="text-right"></td>
										<td class="text-center"><button type="button" value="92"
												data-toggle="tooltip" title=""
												data-loading-text="Đang xử lý..." class="btn btn-danger"
												data-original-title="Xóa">
												<i class="fa fa-minus-circle"></i>
											</button></td>
									</tr>
							</table>

							<tr>
								<td class="text-center" colspan="6">Chưa có Thông tin!</td>
							</tr>
							</tbody>
							</table>
						</div>
						<br />
					</div>
					<div class="tab-pane" id="tab-shipping">
						<div class="form-group">
							<label class="col-sm-2 control-label"
								for="input-shipping-address">Địa chỉ:</label>
							<div class="col-sm-10">
								<input type="text" name="diachi" value=""
									id="input-shipping-city" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label"
								for="input-shipping-firstname">Họ và Tên:</label>
							<div class="col-sm-10">
								<input type="text" name="firstname" value=""
									id="input-shipping-firstname" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label"
								for="input-shipping-address-1">Địa chỉ dòng 1:</label>
							<div class="col-sm-10">
								<input type="text" name="address_1" value=""
									id="input-shipping-address-1" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-shipping-city">Thành
								phố:</label>
							<div class="col-sm-10">
								<input type="text" name="city" value="" id="input-shipping-city"
									class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label"
								for="input-shipping-postcode">Mã bưu điện:</label>
							<div class="col-sm-10">
								<input type="text" name="postcode" value=""
									id="input-shipping-postcode" class="form-control" />
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label"
								for="input-shipping-country">Quốc gia:</label>
							<div class="col-sm-10">
								<input type="text" name="country" value=""
									id="input-shipping-city" class="form-control" />
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 text-right">
								<button type="button" id="button-refresh" data-toggle="tooltip"
									title="Làm mới" data-loading-text="Đang xử lý..."
									class="btn btn-warning">
									<i class="fa fa-refresh"></i>
								</button>
								<button type="button" id="button-save" class="btn btn-primary">
									<i class="fa fa-check-circle"></i> Lưu
								</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		// Sort the custom fields
		$('#tab-customer .form-group[data-sort]')
				.detach()
				.each(
						function() {
							if ($(this).attr('data-sort') >= 0
									&& $(this).attr('data-sort') <= $('#tab-customer .form-group').length) {
								$('#tab-customer .form-group').eq(
										$(this).attr('data-sort')).before(this);
							}

							if ($(this).attr('data-sort') > $('#tab-customer .form-group').length) {
								$('#tab-customer .form-group:last').after(this);
							}

							if ($(this).attr('data-sort') < -$('#tab-customer .form-group').length) {
								$('#tab-customer .form-group:first').before(
										this);
							}
						});

		// Sort the custom fields
		$('#tab-payment .form-group[data-sort]')
				.detach()
				.each(
						function() {
							if ($(this).attr('data-sort') >= 0
									&& $(this).attr('data-sort') <= $('#tab-payment .form-group').length) {
								$('#tab-payment .form-group').eq(
										$(this).attr('data-sort')).before(this);
							}

							if ($(this).attr('data-sort') > $('#tab-payment .form-group').length) {
								$('#tab-payment .form-group:last').after(this);
							}

							if ($(this).attr('data-sort') < -$('#tab-payment .form-group').length) {
								$('#tab-payment .form-group:first')
										.before(this);
							}
						});

		$('#tab-shipping .form-group[data-sort]')
				.detach()
				.each(
						function() {
							if ($(this).attr('data-sort') >= 0
									&& $(this).attr('data-sort') <= $('#tab-shipping .form-group').length) {
								$('#tab-shipping .form-group').eq(
										$(this).attr('data-sort')).before(this);
							}

							if ($(this).attr('data-sort') > $('#tab-shipping .form-group').length) {
								$('#tab-shipping .form-group:last').after(this);
							}

							if ($(this).attr('data-sort') < -$('#tab-shipping .form-group').length) {
								$('#tab-shipping .form-group:first').before(
										this);
							}
						});
	</script>