<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="content" class="col-sm-9">
	<h1>Thanh toán</h1>
	<form action="${pageContext.request.contextPath }/thanhtoankhach"
		method="post" id="thanhtoan">
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a href="#collapse-payment-address" data-toggle="collapse"
							data-parent="#accordion" class="accordion-toggle"> Chi tiết
							Đơn hàng <i class="fa fa-caret-down"></i>
						</a>
					</h4>
				</div>
				<div class="panel-collapse collapse in"
					id="collapse-payment-address" style="height: auto;">
					<div class="panel-body">
						<div class="row">
							<div class="col-sm-6">
								<fieldset id="account">
									<legend>Thông tin tài khoản</legend>
									<div class="form-group required">
										<label class="control-label" for="input-payment-firstname">Họ
											và tên đệm</label> <input type="text" name="ho"
											value="${objCustomer.ho }" placeholder="Họ và tên đệm"
											id="input-payment-firstname" class="form-control">
										<form:errors path="objItem.ho"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
									<div class="form-group required">
										<label class="control-label" for="input-payment-lastname">Tên</label>
										<input type="text" name="ten" value="${objCustomer.ten }"
											placeholder="Tên" id="input-payment-lastname"
											class="form-control">
										<form:errors path="objItem.ten"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
									<div class="form-group required">
										<label class="control-label" for="input-payment-email">Email</label>
										<input type="text" name="email" value="${objCustomer.email }"
											placeholder="Email" id="input-payment-email"
											class="form-control">
										<form:errors path="objItem.email"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
									<div class="form-group required">
										<label class="control-label" for="input-payment-telephone">Điện
											thoại</label> <input type="text" name="telephone"
											value="${objCustomer.telephone }" placeholder="Điện thoại"
											id="input-payment-telephone" class="form-control">
										<form:errors path="objItem.telephone"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</fieldset>
							</div>
							<div class="col-sm-6">
								<fieldset id="address">
									<legend>Địa chỉ của bạn</legend>
									<div class="form-group required">
										<label class="control-label" for="input-payment-address-1">Địa
											chỉ</label> <input type="text" name="andress"
											value="${objCustomer.andress}" placeholder="Địa chỉ"
											id="input-payment-address-1" class="form-control">
										<form:errors path="objItem.andress"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
									<div class="form-group required">
										<label class="control-label" for="input-payment-postcode">Mã
											bưu điện</label> <input type="text" name="postcode"
											value="${objCustomer.postcode }" placeholder="Mã bưu điện"
											id="input-payment-postcode" class="form-control">
										<form:errors path="objItem.postcode"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
									<div class="form-group required">
										<label class="control-label" for="input-payment-country">Quốc
											gia</label> <input type="text" name="country"
											value="${objCustomer.country }" placeholder="Quốc gia"
											id="input-payment-city" class="form-control">
										<form:errors path="objItem.country"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
									<div class="form-group required">
										<label class="control-label" for="input-payment-zone">Tỉnh
											/ TP</label> <input type="text" name="city"
											value="${objCustomer.city }" placeholder="Tỉnh / TP"
											id="input-payment-city" class="form-control">
										<form:errors path="objItem.city"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>

								</fieldset>
								<div class="pull-right">
									<input type="submit" data-toggle="tooltip" value="Tiếp tục"
										class="btn btn-primary" />

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>