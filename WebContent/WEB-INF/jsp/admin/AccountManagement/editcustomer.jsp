<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-customer" data-toggle="tooltip"
				title="Lưu" class="btn btn-primary">
				<i class="fa fa-save"></i>
			</button>
			<a
				href="${pageContext.request.contextPath }/admincp/account/customer"
				data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
				class="fa fa-reply"></i></a>
		</div>
		<h1>Khách hàng</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/account/customer">Khách
					hàng</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-pencil"></i> Sửa thông tin khách hàng
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/account/customer/edit/${objCus.id_customer }"
				method="post" enctype="multipart/form-data" id="form-customer"
				class="form-horizontal">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-general" data-toggle="tab">Tổng
							quan</a></li>
					<li><a href="#tab-history" data-toggle="tab">Địa chỉ</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab-general">
						<div class="row">
							<div class="col-sm-10">
								<div class="tab-content">
									<div class="tab-pane active" id="tab-customer">
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-firstname">Username</label>
											<div class="col-sm-10">
												<input type="text" name="username"
													value="${objCus.username }" placeholder="Username"
													id="input-firstname" class="form-control" />
												<form:errors path="objItem.username"
													cssStyle="color:red; font-style:italic;"></form:errors>
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-firstname">Họ</label>
											<div class="col-sm-10">
												<input type="text" name="ho" value="${objCus.ho }"
													placeholder="Họ" id="input-firstname" class="form-control" />
												<form:errors path="objItem.ho"
													cssStyle="color:red; font-style:italic;"></form:errors>
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-lastname">Tên</label>
											<div class="col-sm-10">
												<input type="text" name="ten" value="${objCus.ten }"
													placeholder="Tên" id="input-lastname" class="form-control" />
												<form:errors path="objItem.ten"
													cssStyle="color:red; font-style:italic;"></form:errors>
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-email">Email</label>
											<div class="col-sm-10">
												<input type="text" name="email" value="${objCus.email }"
													placeholder="Email" id="input-email" class="form-control" />
												<form:errors path="objItem.email"
													cssStyle="color:red; font-style:italic;"></form:errors>
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-telephone">Điện
												thoại</label>
											<div class="col-sm-10">
												<input type="text" name="telephone"
													value="${objCus.telephone }" placeholder="Điện thoại"
													id="input-telephone" class="form-control" />
												<form:errors path="objItem.telephone"
													cssStyle="color:red; font-style:italic;"></form:errors>
													<c:if test="${not empty msgTele }">
													<p style="color: red; font-style: italic;">${msgTele }</p>
												</c:if>
											</div>
										</div>
										<%-- <div class="form-group required">
											<label class="col-sm-2 control-label" for="input-password">Mật
												khẩu</label>
											<div class="col-sm-10">
												<input type="password" name="password" value=""
													placeholder="Mật khẩu" id="input-password"
													class="form-control" autocomplete="off" />
												<form:errors path="objItem.password"
													cssStyle="color:red; font-style:italic;"></form:errors>
												<c:if test="${not empty msgPass }">
													<p style="color: red; font-style: italic;">${msgPass }</p>
												</c:if>
											</div>
										</div>
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-confirm">Xác
												nhận mật khẩu</label>
											<div class="col-sm-10">
												<input type="password" name="re_password" value=""
													placeholder="Xác nhận mật khẩu" autocomplete="off"
													id="input-confirm" class="form-control" />
												<c:if test="${not empty msgRepass }">
													<p style="color: red; font-style: italic;">${msgRepass }</p>
												</c:if>
											</div>
										</div> --%>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-newsletter">Đăng
												ký nhận thư</label>
											<div class="col-sm-10">
												<select name="newsletter" id="input-newsletter"
													class="form-control">
													<c:choose>
														<c:when test="${objCus.newsletter == 'Bật' }">
															<option value="Bật" selected="selected">Bật</option>
															<option value="Tắt">Tắt</option>
														</c:when>
														<c:otherwise>
															<option value="Bật">Bật</option>
															<option value="Tắt" selected="selected">Tắt</option>
														</c:otherwise>
													</c:choose>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-status">Trạng
												thái</label>
											<div class="col-sm-10">
												<select name="active" id="input-status" class="form-control">
													<c:choose>
														<c:when test="${objCus.active == 1 }">
															<option value="1" selected="selected">Bật</option>
															<option value="0">Tắt</option>
														</c:when>
														<c:otherwise>
															<option value="1">Bật</option>
															<option value="0" selected="selected">Tắt</option>
														</c:otherwise>
													</c:choose>
												</select>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-history">
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-address-11">Địa
								chỉ</label>
							<div class="col-sm-10">
								<input type="text" name="andress" value="${objCus.andress }"
									placeholder="Địa chỉ" id="input-address-11"
									class="form-control" />
								<form:errors path="objItem.andress"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-city1">Thành
								phố</label>
							<div class="col-sm-10">
								<input type="text" name="city" value="${objCus.city }"
									placeholder="Thành phố" id="input-city1" class="form-control" />
								<form:errors path="objItem.city"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-postcode1">Mã
								bưu điện</label>
							<div class="col-sm-10">
								<input type="text" name="postcode" value="${objCus.postcode }"
									placeholder="Mã bưu điện" id="input-postcode1"
									class="form-control" />
								<form:errors path="objItem.postcode"
									cssStyle="color:red; font-style:italic;"></form:errors>
									<c:if test="${not empty msgPost }">
													<p style="color: red; font-style: italic;">${msgPost }</p>
												</c:if>
							</div>
						</div>
						<div class="form-group required">
							<label class="col-sm-2 control-label" for="input-country1">Quốc
								gia</label>
							<div class="col-sm-10">
								<input type="text" name="country" value="${objCus.country }"
									placeholder="Quốc gia" id="country" class="form-control" />
								<form:errors path="objItem.country"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
							<div class="col-sm-10"></div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>