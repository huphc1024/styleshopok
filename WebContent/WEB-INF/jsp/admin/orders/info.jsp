<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="page-header">
	<div class="container-fluid">
		<h1>Quản lý Đơn hàng</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a href="${pageContext.request.contextPath }/admincp/orders">Quản
					lý Đơn hàng</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-shopping-cart"></i> Thông tin Đơn hàng
					</h3>
				</div>
				<table class="table">
					<tbody>
						<tr>
							<td style="width: 1%;">
								<button data-toggle="tooltip" title="Store"
									class="btn btn-info btn-xs">
									<i class="fa fa-shopping-cart fa-fw"></i>
								</button>
							</td>
							<td><a href="${pageContext.request.contextPath }/"
								target="_blank">Styleshop</a></td>
						</tr>
						<tr>
							<td>
								<button data-toggle="tooltip" title="Ngày Đặt hàng:"
									class="btn btn-info btn-xs">
									<i class="fa fa-calendar fa-fw"></i>
								</button>
							</td>
							<fmt:formatDate value="${objOrder.get(0).date_create }"
								pattern="dd/MM/yyyy" var="fmtDate" />
							<td>${fmtDate }</td>
						</tr>
						<tr>
							<td>
								<button data-toggle="tooltip" title="Phương thức thanh toán:"
									class="btn btn-info btn-xs">
									<i class="fa fa-credit-card fa-fw"></i>
								</button>
							</td>
							<td>${objOrder.get(0).giaohang }</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-user"></i> Chi tiết Khách hàng
					</h3>
				</div>
				<table class="table">
					<tr>
						<td style="width: 1%;">
							<button data-toggle="tooltip" title="Khách hàng:"
								class="btn btn-info btn-xs">
								<i class="fa fa-user fa-fw"></i>
							</button>
						</td>
						<td>${objOrder.get(0).ho }${objOrder.get(0).ten }</td>
					</tr>
					<tr>
						<td>
							<button data-toggle="tooltip" title="Email:"
								class="btn btn-info btn-xs">
								<i class="fa fa-envelope-o fa-fw"></i>
							</button>
						</td>
						<td><a href="mailto:lehoaidang1024@gmail.com">${objOrder.get(0).email }</a></td>
					</tr>
					<tr>
						<td>
							<button data-toggle="tooltip" title="Điện thoại:"
								class="btn btn-info btn-xs">
								<i class="fa fa-phone fa-fw"></i>
							</button>
						</td>
						<td>${objOrder.get(0).telephone }</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-info-circle"></i> Chi tiết đặt hàng
			</h3>
		</div>
		<div class="panel-body">
			<table class="table table-bordered">
				<thead>
					<tr>
						<td style="width: 50%;" class="text-left">Địa chỉ</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="text-left">${objOrder.get(0).ho }
							${objOrder.get(0).ten }<br /> ${objOrder.get(0).andress }<br />
							${objOrder.get(0).city } ${objOrder.get(0).postcode }<br />
							${objOrder.get(0).country }
						</td>
					</tr>
				</tbody>
			</table>
			<table class="table table-bordered">
				<thead>
					<tr>
						<td class="text-left">Sản phẩm</td>
						<td class="text-right">Số lượng</td>
						<td class="text-right">Đơn giá</td>
						<td class="text-right">Tổng</td>
					</tr>
				</thead>
				<tbody>
					<c:set value="0" var="tong"></c:set>
					<c:forEach items="${objOrder }" var="obj">
					<c:set value="${slugUtils.toSlug(obj.name) }" var="slugName"></c:set>
						<tr>
							<td class="text-left"><a
								href="${pageContext.request.contextPath }/${slugName}-${obj.id_product}.html">${obj.name }</a></td>
							<td class="text-right">${obj.soluong }</td>
							<td class="text-right"><fmt:formatNumber type="number"
									pattern="###,###" value="${obj.gia}" /> đ</td>
							<td class="text-right"><fmt:formatNumber type="number"
									pattern="###,###" value="${obj.gia * obj.soluong }" /> đ</td>
						</tr>
						<c:set value="${tong + obj.gia * obj.soluong }" var="tong"></c:set>
					</c:forEach>
					<tr>
						<td colspan="3" class="text-right">Thành tiền</td>
						<td class="text-right"><fmt:formatNumber type="number"
									pattern="###,###" value="${tong }" /> đ</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>

	<script type="text/javascript">
	<!--
		$('#button_send_shipping')
				.click(
						function() {
							// demo, chua add multi language
							var city = document.getElementById("city");
							var city_id = city.options[city.selectedIndex].value;
							if (city_id == 0) {
								alert('Bạn cần chọn thành phố người nhận!');
								return false;
							}

							var customer = document.getElementById("customer").value;
							if (customer == '') {
								alert('Bạn cần điền tên người nhận');
								return false;
							}

							var province = document.getElementById("province");
							var province_id = province.options[province.selectedIndex].value;
							if (province_id == 0) {
								alert('Bạn cần chọn quận huyện người nhận!');
								return false;
							}

							var ward = document.getElementById("ward");
							var ward_id = ward.options[ward.selectedIndex].value;
							if (ward_id == 0) {
								alert('Bạn cần chọn xã phường người nhận!');
								return false;
							}

							var address = document.getElementById("address").value;
							if (address == '') {
								alert('Bạn cần điền địa chỉ người nhận!');
								return false;
							}

							var phone = document.getElementById("phone").value;
							if (phone == '') {
								alert('Bạn cần điền số điện thoại người nhận');
								return false;
							}

							var email = document.getElementById("email").value;

							var e = document.getElementById("method");
							var method_code = e.options[e.selectedIndex].value;

							if (method_code == 'shipchung') {
								var shipchung_service = document
										.getElementById("shipchung_service").value;
								var shipchung_payment = document
										.getElementById("shipchung_payment").value;
								var shipchung_cod = document
										.getElementById("shipchung_cod").value;
								var shipchung_protected = document
										.getElementById("shipchung_protected").value;
								var shipchung_checking = document
										.getElementById("shipchung_checking").value;
								var shipchung_fragile = document
										.getElementById("shipchung_fragile").value;

								$
										.ajax({
											url : 'index.php?route=extension/shipping/'
													+ method_code
													+ '/ajaxSendOrder&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y',
											method : "POST",
											dataType : 'json',
											data : {
												to_city_id : city_id,
												to_province_id : province_id,
												to_ward_id : ward_id,
												address : address,
												phone : phone,
												customer : customer,
												email : email,
												shipchung_service : shipchung_service,
												shipchung_payment : shipchung_payment,
												shipchung_cod : shipchung_cod,
												shipchung_protected : shipchung_protected,
												shipchung_checking : shipchung_checking,
												shipchung_fragile : shipchung_fragile,
												order_id : 54,
												store_id : 0
											},

											beforeSend : function() {
												$('body')
														.append(
																'<div class="sk-spinner-container"><div class="sk-spinner-pulse"></div></div>');
											},
											complete : function() {
												$('.sk-spinner-container')
														.remove();
											},
											success : function(json) {
												if (json == false) {
													alert('Gửi đơn hàng thành công!');
													$('#btn-close-form-ship')
															.trigger('click');
												} else {
													alert('Gửi đơn hàng không thành công!');
												}
											},
											error : function(xhr, ajaxOptions,
													thrownError) {
												alert(thrownError + "\r\n"
														+ xhr.statusText
														+ "\r\n"
														+ xhr.responseText);
											}
										});
							}

							if (method_code == 'proship') {
								var proship_shipping_method = document
										.getElementById("proship_shipping_method").value;
								var proship_payby = document
										.getElementById("proship_payby").value;
								var proship_product_name = document
										.getElementById("proship_product_name").value;
								var proship_weight = document
										.getElementById("proship_weight").value;
								var proship_codcost = document
										.getElementById("proship_codcost").value;
								var proship_description = document
										.getElementById("proship_description").value;

								$
										.ajax({
											url : 'index.php?route=extension/shipping/'
													+ method_code
													+ '/ajaxSendOrder&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y',
											method : "POST",
											dataType : 'json',
											data : {
												receiverName : customer,
												receiverCity : city_id,
												receiverDistrict : province_id,
												receiverWard : ward_id,
												receiverAddress : address,
												receiverPhone : phone,
												shippingMethod : proship_shipping_method,
												payBy : proship_payby,
												weight : proship_weight,
												codCost : proship_codcost,
												description : proship_description,
												productName : proship_product_name,
												orderCode : 54,
												store_id : 0
											},

											beforeSend : function() {
												$('body')
														.append(
																'<div class="sk-spinner-container"><div class="sk-spinner-pulse"></div></div>');
											},
											complete : function() {
												$('.sk-spinner-container')
														.remove();
											},
											success : function(json) {
												if (json == false) {
													alert('Gửi đơn hàng thành công!');
													$('#btn-close-form-ship')
															.trigger('click');
												} else {
													alert('Gửi đơn hàng không thành công!');
												}
											},
											error : function(xhr, ajaxOptions,
													thrownError) {
												alert(thrownError + "\r\n"
														+ xhr.statusText
														+ "\r\n"
														+ xhr.responseText);
											}
										});
							}
						});
	//-->
	</script>

	<script type="text/javascript">
	<!--
		// get city
		$('select[name=\'method\']')
				.bind(
						'change',
						function() {
							var e = document.getElementById("method");
							var method_code = e.options[e.selectedIndex].value;

							if (method_code == 'shipchung') {
								$
										.ajax({
											url : 'index.php?route=extension/shipping/'
													+ method_code
													+ '/ajaxGetCity&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y',
											dataType : 'json',
											beforeSend : function() {
												$('#label-city')
														.append(
																'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
											},
											complete : function() {
												$(
														'#label-city .container-spin-loading')
														.remove();
											},
											success : function(json) {
												html = '<select name="city" id="city" class="form-control" onchange="getListProvince(this.value)">';
												html += '<option value="0"> -- Select City -- </option>';

												if (json['data'] != '') {
													for (i = 0; i < json['data'].length; i++) {
														html += '<option value="' + json['data'][i]['CityId'] + '"';
                                html += '>'
																+ json['data'][i]['CityName']
																+ '</option>';
													}
												}

												html += '</select>';
												$('#load-ajax-city').html(html);

												//getListProvince(city_id);
											},
											error : function(xhr, ajaxOptions,
													thrownError) {
												alert(thrownError + "\r\n"
														+ xhr.statusText
														+ "\r\n"
														+ xhr.responseText);
											}
										});
							}

							if (method_code == 'proship') {
								$
										.ajax({
											url : 'index.php?route=extension/shipping/'
													+ method_code
													+ '/ajaxGetCity&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y',
											dataType : 'json',
											beforeSend : function() {
												$('#label-city')
														.append(
																'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
											},
											complete : function() {
												$(
														'#label-city .container-spin-loading')
														.remove();
											},
											success : function(json) {
												html = '<select name="city" id="city" class="form-control" onchange="getListProvince(this.value)">';
												html += '<option value="0"> -- Select City -- </option>';

												if (json['data'] != '') {
													for (i = 0; i < json['data'].length; i++) {
														html += '<option value="' + json['data'][i]['cityId'] + '"';
                                html += '>'
																+ json['data'][i]['cityName']
																+ '</option>';
													}
												}

												html += '</select>';
												$('#load-ajax-city').html(html);

												//getListProvince(city_id);
											},
											error : function(xhr, ajaxOptions,
													thrownError) {
												alert(thrownError + "\r\n"
														+ xhr.statusText
														+ "\r\n"
														+ xhr.responseText);
											}
										});
							}
						});

		// get province
		function getListProvince(city_id) {
			var e = document.getElementById("method");
			var method_code = e.options[e.selectedIndex].value; // = shipchung

			if (method_code == 'shipchung') {
				$
						.ajax({
							url : 'index.php?route=extension/shipping/'
									+ method_code
									+ '/ajaxGetProvince&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&city_id='
									+ city_id,
							dataType : 'json',
							beforeSend : function() {
								$('#label-province')
										.append(
												'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
							},
							complete : function() {
								$('#label-province .container-spin-loading')
										.remove();
							},
							success : function(json) {
								html = '<select name="province" id="province" class="form-control" onchange="getListWard(this.value)">';
								html += '<option value="0"> -- Select Province -- </option>';

								if (json['data'] != '') {
									for (i = 0; i < json['data'].length; i++) {
										html += '<option value="' + json['data'][i]['ProvinceId'] + '"';
                                html += '>'
												+ json['data'][i]['ProvinceName']
												+ '</option>';
									}
								}

								html += '</select>';

								$('#load-ajax-province').html(html);
							},
							error : function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText
										+ "\r\n" + xhr.responseText);
							}
						});
			}

			if (method_code == 'proship') {
				$
						.ajax({
							url : 'index.php?route=extension/shipping/'
									+ method_code
									+ '/ajaxGetProvince&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&city_id='
									+ city_id,
							dataType : 'json',
							beforeSend : function() {
								$('#label-province')
										.append(
												'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
							},
							complete : function() {
								$('#label-province .container-spin-loading')
										.remove();
							},
							success : function(json) {
								html = '<select name="province" id="province" class="form-control" onchange="getListWard(this.value)">';
								html += '<option value="0"> -- Select Province -- </option>';

								if (json['data'] != '') {
									for (i = 0; i < json['data'].length; i++) {
										html += '<option value="' + json['data'][i]['ProvinceId'] + '"';
                                html += '>'
												+ json['data'][i]['ProvinceName']
												+ '</option>';
									}
								}

								html += '</select>';

								$('#load-ajax-province').html(html);
							},
							error : function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText
										+ "\r\n" + xhr.responseText);
							}
						});
			}
		}

		// get ward
		function getListWard(province_id) {
			var e = document.getElementById("method");
			var method_code = e.options[e.selectedIndex].value; // = shipchung

			$
					.ajax({
						url : 'index.php?route=extension/shipping/'
								+ method_code
								+ '/ajaxGetWard&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&province_id='
								+ province_id,
						dataType : 'json',
						beforeSend : function() {
							$('#label-ward')
									.append(
											'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
						},
						complete : function() {
							$('#label-ward .container-spin-loading').remove();
						},
						success : function(json) {
							html = '<select name="ward" id="ward" class="form-control">';
							html += '<option value="0"> -- Select Ward -- </option>';

							if (json['data'] != '') {
								for (i = 0; i < json['data'].length; i++) {
									html += '<option value="' + json['data'][i]['WardId'] + '"';
                            html += '>'
											+ json['data'][i]['WardName']
											+ '</option>';
								}
							}

							html += '</select>';
							$('#load-ajax-ward').html(html);
						},
						error : function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText
									+ "\r\n" + xhr.responseText);
						}
					});
		}

		// get option
		$('select[name=\'method\']')
				.bind(
						'change',
						function() {
							$('#load-ajax-option').empty();
							var e = document.getElementById("method");
							var method_code = e.options[e.selectedIndex].value;
							if (method_code == 'shipchung') {
								$
										.ajax({
											url : 'index.php?route=extension/shipping/'
													+ method_code
													+ '/ajaxGetOption&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y',
											dataType : 'json',
											beforeSend : function() {
												$('#option-title')
														.append(
																'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
											},
											complete : function() {
												$(
														'#option-title .container-spin-loading')
														.remove();
											},
											success : function(json) {
												$('#load-ajax-option').html(
														json);
											},
											error : function(xhr, ajaxOptions,
													thrownError) {
												alert(thrownError + "\r\n"
														+ xhr.statusText
														+ "\r\n"
														+ xhr.responseText);
											}
										});
							}

							if (method_code == 'proship') {
								$
										.ajax({
											url : 'index.php?route=extension/shipping/'
													+ method_code
													+ '/ajaxGetOption&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y',
											dataType : 'json',
											beforeSend : function() {
												$('#option-title')
														.append(
																'<span class="container-spin-loading"><i class="fa fa-refresh fa-spin fa-fw"></i></span>');
											},
											complete : function() {
												$(
														'#option-title .container-spin-loading')
														.remove();
											},
											success : function(json) {
												$('#load-ajax-option').html(
														json);
											},
											error : function(xhr, ajaxOptions,
													thrownError) {
												alert(thrownError + "\r\n"
														+ xhr.statusText
														+ "\r\n"
														+ xhr.responseText);
											}
										});
							}
						});
	//-->
	</script>

	<script type="text/javascript">
	<!--
		$(document)
				.delegate(
						'#button-ip-add',
						'click',
						function() {
							$
									.ajax({
										url : 'index.php?route=user/api/addip&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&api_id=3',
										type : 'post',
										data : 'ip=42.116.175.227',
										dataType : 'json',
										beforeSend : function() {
											$('#button-ip-add').button(
													'loading');
										},
										complete : function() {
											$('#button-ip-add').button('reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
											}

											if (json['success']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
																		+ json['success']
																		+ ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		$(document)
				.delegate(
						'#button-invoice',
						'click',
						function() {
							$
									.ajax({
										url : 'index.php?route=sale/order/createinvoiceno&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54',
										dataType : 'json',
										beforeSend : function() {
											$('#button-invoice').button(
													'loading');
										},
										complete : function() {
											$('#button-invoice')
													.button('reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ '</div>');
											}

											if (json['invoice_no']) {
												$('#invoice').html(
														json['invoice_no']);

												$('#button-invoice')
														.replaceWith(
																'<button disabled="disabled" class="btn btn-success btn-xs"><i class="fa fa-cog"></i></button>');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		$(document)
				.delegate(
						'#button-reward-add',
						'click',
						function() {
							$
									.ajax({
										url : 'index.php?route=sale/order/addreward&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54',
										type : 'post',
										dataType : 'json',
										beforeSend : function() {
											$('#button-reward-add').button(
													'loading');
										},
										complete : function() {
											$('#button-reward-add').button(
													'reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ '</div>');
											}

											if (json['success']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
																		+ json['success']
																		+ '</div>');

												$('#button-reward-add')
														.replaceWith(
																'<button id="button-reward-remove" data-toggle="tooltip" title="button_reward_remove" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		$(document)
				.delegate(
						'#button-reward-remove',
						'click',
						function() {
							$
									.ajax({
										url : 'index.php?route=sale/order/removereward&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54',
										type : 'post',
										dataType : 'json',
										beforeSend : function() {
											$('#button-reward-remove').button(
													'loading');
										},
										complete : function() {
											$('#button-reward-remove').button(
													'reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ '</div>');
											}

											if (json['success']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
																		+ json['success']
																		+ '</div>');

												$('#button-reward-remove')
														.replaceWith(
																'<button id="button-reward-add" data-toggle="tooltip" title="button_reward_add" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		$(document)
				.delegate(
						'#button-commission-add',
						'click',
						function() {
							$
									.ajax({
										url : 'index.php?route=sale/order/addcommission&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54',
										type : 'post',
										dataType : 'json',
										beforeSend : function() {
											$('#button-commission-add').button(
													'loading');
										},
										complete : function() {
											$('#button-commission-add').button(
													'reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ '</div>');
											}

											if (json['success']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
																		+ json['success']
																		+ '</div>');

												$('#button-commission-add')
														.replaceWith(
																'<button id="button-commission-remove" data-toggle="tooltip" title="button_commission_remove" class="btn btn-danger btn-xs"><i class="fa fa-minus-circle"></i></button>');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		$(document)
				.delegate(
						'#button-commission-remove',
						'click',
						function() {
							$
									.ajax({
										url : 'index.php?route=sale/order/removecommission&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54',
										type : 'post',
										dataType : 'json',
										beforeSend : function() {
											$('#button-commission-remove')
													.button('loading');
										},
										complete : function() {
											$('#button-commission-remove')
													.button('reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ '</div>');
											}

											if (json['success']) {
												$('#content > .container-fluid')
														.prepend(
																'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
																		+ json['success']
																		+ '</div>');

												$('#button-commission-remove')
														.replaceWith(
																'<button id="button-commission-add" data-toggle="tooltip" title="button_commission_add" class="btn btn-success btn-xs"><i class="fa fa-plus-circle"></i></button>');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		var token = '';

		// Login to the API
		$
				.ajax({
					url : 'http://vinaenter.myzozo.net/index.php?route=api/login',
					type : 'post',
					dataType : 'json',
					data : 'key=2X2mbDSAhfUWteJoWereJPxgjht0JXUn1xncvz5SbZwgMf470hs5PyxUKcrxCClYYkuMA0xEXZjlSWMIjEmxBp1ZKiOm1QU5sXjsDEBMg3z1OEYkSyY6geWyAkN5D0VGbpwReqwE6OGum3e2KsjVpV5RCfKImBFP2ltO3Mp2GZxQNSb4jihqp32rd2LQ35NfUQqx1qw4GyAOtIO9XAG2foyC9zt6uX9L4UEqrbFJ9Y0ajWo0Iw071A43yzNkVGio',
					crossDomain : true,
					success : function(json) {
						$('.alert').remove();

						if (json['error']) {
							if (json['error']['key']) {
								$('#content > .container-fluid')
										.prepend(
												'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
														+ json['error']['key']
														+ ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
							}

							if (json['error']['ip']) {
								$('#content > .container-fluid')
										.prepend(
												'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
														+ json['error']['ip']
														+ ' <button type="button" id="button-ip-add" data-loading-text="Đang xử lý..." class="btn btn-danger btn-xs pull-right"><i class="fa fa-plus"></i> Thêm IP</button></div>');
							}
						}

						if (json['token']) {
							token = json['token'];
						}
					},
					error : function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n"
								+ xhr.responseText);
					}
				});

		$('#history').delegate('.pagination a', 'click', function(e) {
			e.preventDefault();

			$('#history').load(this.href);
		});

		$('#history')
				.load(
						'index.php?route=sale/order/history&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54');

		$('#button-history')
				.on(
						'click',
						function() {
							/*
							 if (typeof verifyStatusChange == 'function'){
							 if (verifyStatusChange() == false){
							 return false;
							 } else{
							 addOrderInfo();
							 }
							 } else{
							 addOrderInfo();
							 }*/

							$
									.ajax({
										url : 'http://vinaenter.myzozo.net/index.php?route=api/order/history&token='
												+ token
												+ '&store_id=0&order_id=54',
										type : 'post',
										dataType : 'json',
										data : 'order_status_id='
												+ encodeURIComponent($(
														'select[name=\'order_status_id\']')
														.val())
												+ '&notify='
												+ ($('input[name=\'notify\']')
														.prop('checked') ? 1
														: 0)
												+ '&override='
												+ ($('input[name=\'override\']')
														.prop('checked') ? 1
														: 0)
												+ '&append='
												+ ($('input[name=\'append\']')
														.prop('checked') ? 1
														: 0)
												+ '&comment='
												+ encodeURIComponent($(
														'textarea[name=\'comment\']')
														.val()),
										beforeSend : function() {
											$('#button-history').button(
													'loading');
										},
										complete : function() {
											$('#button-history')
													.button('reset');
										},
										success : function(json) {
											$('.alert').remove();

											if (json['error']) {
												$('#history')
														.before(
																'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
																		+ json['error']
																		+ ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
											}

											if (json['success']) {
												$('#history')
														.load(
																'index.php?route=sale/order/history&token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y&order_id=54');

												$('#history')
														.before(
																'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
																		+ json['success']
																		+ ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

												$('textarea[name=\'comment\']')
														.val('');
											}
										},
										error : function(xhr, ajaxOptions,
												thrownError) {
											alert(thrownError + "\r\n"
													+ xhr.statusText + "\r\n"
													+ xhr.responseText);
										}
									});
						});

		function changeStatus() {
			var status_id = $('select[name="order_status_id"]').val();
			// Off Openpay
		}

		function addOrderInfo() {
			var status_id = $('select[name="order_status_id"]').val();
			// Off Openpay
		}

		$(document).ready(function() {
			changeStatus();
		});

		$('select[name="order_status_id"]').change(function() {
			changeStatus();
		});
	//-->
	</script>