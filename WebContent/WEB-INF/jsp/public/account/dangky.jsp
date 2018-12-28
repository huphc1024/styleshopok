<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="content" class="col-sm-9">
	<h1>Đăng ký tài khoản</h1>
	<p>
		Nếu bạn đã đăng ký tài khoản với chúng tôi, vui lòng <a
			href="${pageContext.request.contextPath}/dang-nhap">đăng nhập</a>.
	</p>
	<c:if test="${not empty msgt}"><p style="color: red; font-weight: bold;">${msgt }</p></c:if>
	<form action="${pageContext.request.contextPath}/dang-ky" method="post"
		class="form-horizontal">
		<fieldset id="account">
			<legend>Chi tiết tài khoản</legend>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-firstname">Username
				</label>
				<div class="col-sm-10">
					<input type="text" name="username" value="${objCus.username }"
						placeholder="Tên đăng nhập" id="input-firstname"
						class="form-control" />
					<form:errors path="objItem.username"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-firstname">Họ
					& Tên đệm</label>
				<div class="col-sm-10">
					<input type="text" name="ho" value="${objCus.ho }"
						placeholder="Họ & Tên đệm" id="input-firstname"
						class="form-control" />
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
					<input type="email" name="email" value="${objCus.email }"
						placeholder="Email" id="input-email" class="form-control" />
					<form:errors path="objItem.email"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-telephone">Điện
					thoại</label>
				<div class="col-sm-10">
					<input type="tel" name="telephone" value="${objCus.telephone }"
						placeholder="Điện thoại" id="input-telephone" class="form-control" />
					<form:errors path="objItem.telephone"
						cssStyle="color:red; font-style:italic;"></form:errors>
					<c:if test="${not empty msgTele }">
						<p style="color: red; font-style: italic;">${msgTele }</p>
					</c:if>
				</div>
			</div>
		</fieldset>
		<fieldset id="address">
			<legend>Địa chỉ</legend>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-address-1">Địa
					chỉ</label>
				<div class="col-sm-10">
					<input type="text" name="andress" value="${objCus.andress }"
						placeholder="Địa chỉ" id="input-address-1" class="form-control" />
					<form:errors path="objItem.andress"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-postcode">Mã
					bưu điện</label>
				<div class="col-sm-10">
					<input type="text" name="postcode" value="${objCus.postcode }"
						placeholder="Mã bưu điện" id="input-postcode" class="form-control" />
					<form:errors path="objItem.postcode"
						cssStyle="color:red; font-style:italic;"></form:errors>
					<c:if test="${not empty msgPost }">
						<p style="color: red; font-style: italic;">${msgPost }</p>
					</c:if>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-country">Quốc
					gia</label>
				<div class="col-sm-10">
					<input type="text" name="country" value="${objCus.country }"
						placeholder="Quốc gia" id="input-country" class="form-control" />
					<form:errors path="objItem.country"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-zone">Tỉnh
					/ TP</label>
				<div class="col-sm-10">
					<input type="text" name="city" value="${objCus.city }"
						placeholder="Tỉnh / TP" id="input-country" class="form-control" />
					<form:errors path="objItem.city"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>
			</div>
		</fieldset>
		<fieldset>
			<legend>Mật khẩu</legend>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-password">Mật
					khẩu</label>
				<div class="col-sm-10">
					<input type="password" name="password" value=""
						placeholder="Mật khẩu" id="input-password" class="form-control" />
					<form:errors path="objItem.password"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>
			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-confirm">Mật
					khẩu xác nhận</label>
				<div class="col-sm-10">
					<input type="password" name="re_password" value=""
						placeholder="Mật khẩu xác nhận" id="input-confirm"
						class="form-control" />
					<c:if test="${not empty msgRepass }">
						<p style="color: red; font-style: italic;">${msgRepass }</p>
					</c:if>
				</div>
			</div>
		</fieldset>
		 <fieldset>
			<legend>Đăng ký nhận tin</legend>
			<div class="form-group">
				<label class="col-sm-2 control-label">Đăng ký nhận tin</label>
				<div class="col-sm-10">
					<label class="radio-inline"> <input type="radio"
						name="newsletter" value="Bật" /> Có
					</label> <label class="radio-inline"> <input type="radio"
						name="newsletter" value="Tắt" checked="checked" /> Không
					</label>
				</div>
			</div>
		</fieldset> 
		<div class="buttons">
			<div class="pull-right">
				Tôi đã đọc và đồng ý với <a
					href="${pageContext.request.contextPath}/about/chinh-sach-bao-mat"
					target="_blank"> <b>Chính sách bảo mật</b></a> <input
					type="checkbox" name="agree" value="1" /> &nbsp; <input
					type="submit" value="Tiếp tục" class="btn btn-primary" />
				<c:if test="${not empty msgAgree }">
					<p style="color: red; font-style: italic;">${msgAgree }</p>
				</c:if>
			</div>
		</div>
	</form>
</div>
</div>
</div>
<script type="text/javascript">
<!--
	$('.date').datetimepicker({
		pickTime : false
	});

	$('.time').datetimepicker({
		pickDate : false
	});

	$('.datetime').datetimepicker({
		pickDate : true,
		pickTime : true
	});
//-->
</script>
