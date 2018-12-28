<footer id="footer">
	<div class="footer-top">
		<div class="container">
			<div class="custom">
				<div class="row">
					<div class="col-md-3 col-sm-6 col-xs-12 box">
						<div class="box-heading">
							<span>Thông tin</span>
						</div>
						<ul class="list-unstyled">
							<li><a href="${pageContext.request.contextPath }/about">Về chúng tôi</a></li>
							<li><a href="${pageContext.request.contextPath }/about/thong-tin-giao-hang">Thông tin giao hàng</a></li>
							<li><a href="${pageContext.request.contextPath }/about/chinh-sach-bao-mat">Chính sách bảo mật</a></li>
							<li><a href="${pageContext.request.contextPath }/about/dieu-khoan-&-dieu-kien">Điều khoản &amp; Điều kiện</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12 box">
						<div class="box-heading">
							<span>Dịch vụ</span>
						</div>
						<ul class="list-unstyled">
							<li><a href="${pageContext.request.contextPath }/lien-he">Liên hệ với chúng tôi</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12 box">
						<div class="box-heading">
							<span>Thông tin thêm</span>
						</div>
						<ul class="list-unstyled">
							<li><a href="#">Thương hiệu</a></li>
							<li><a href="#">Phiếu Quà tặng</a></li>
							<li><a href="#">Cộng
									tác viên</a></li>
							<li><a href="#">Sản phẩm Đặc biệt</a></li>
						</ul>
					</div>
					<div class="col-md-3 col-sm-6 col-xs-12 box">
						<div class="box-heading">
							<span>Tài khoản</span>
						</div>
						<ul class="list-unstyled">
							<li><a href="${pageContext.request.contextPath }/account">Tài
									khoản</a></li>
							<li><a href="${pageContext.request.contextPath }/account/lich-su-dat-hang">Lịch sử
									đơn hàng</a></li>
							<li><a href="${pageContext.request.contextPath }/account/danh-sach-thich">Danh
									sách Yêu thích</a></li>
							<li><a href="${pageContext.request.contextPath }/account/dang-ky-nhan-tin">Đăng
									ký nhận tin</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="footer-center">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 hidden-xs">
					<img src="${define.URL_PUBLIC }/image/catalog/logo/logo_styleshop.png"
						class="img-responsive" style="max-width: 100%;" />
					<ul class="list-inline"
						style="margin-top: 20px; margin-left: 10px;">
						<li><a href="https://www.facebook.com/huuphuoc.97"><i
								class="fa fa-facebook-official fa-2x" aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter fa-2x"
								aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-instagram fa-2x"
								aria-hidden="true"></i></a></li>
						<li><a href="#"><i class="fa fa-google-plus fa-2x"
								aria-hidden="true"></i></a></li>
					</ul>
				</div>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
					<div class="box pav-custom">
						<div class="box-heading">
							<span>Liên hệ với chúng tôi</span>
						</div>
						<ul class="social">
							<li class="first"><a href="#"><span
									class="fa fa-map-marker">&nbsp;</span>Địa chỉ: Trung tâm VinaENTER.EDU </a></li>
							<li><a href="#"><span class="fa fa-mobile-phone">&nbsp;</span>Điện
									thoại: 0965 700 720</a></li>
							<li class="last"><a href="#"><span
									class="fa fa-envelope">&nbsp;</span>Email: leehuphc@gmail.com</a></li>
						</ul>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
					<div class=" box newsletter_block" id="newsletter_18008">
						<div class="box-heading">
							<span>Đăng ký nhận tin</span>
						</div>
						<div class="description">Đăng ký email để nhanh chóng nhận
							được các thông báo về khuyến mại, chương trình giảm giá của chúng
							tôi</div>

						<div class="block_content">
							<form id="formNewLestter" method="post" action="#">
								<div class="input-group">
									<input type="text" class="form-control inputNew"
										id="input_email_newsletter"
										placeholder="Nhập email tại đây..." size="18" name="email">

									<span class="input-group-btn">
										<button type="submit" name="submitNewsletter"
											class="btn btn-primary button_mini">Đăng ký</button>
									</span>
								</div>

								<input type="hidden" value="1" name="action">
								<div class="valid"></div>
							</form>
						</div>
					</div>

					<script type="text/javascript">
						$(document)
								.ready(
										function() {
											var id = 'newsletter_12091';
											$('#' + id + ' .box-heading')
													.bind(
															'click',
															function() {
																$('#' + id)
																		.toggleClass(
																				'active');
															});

											$('#formNewLestter')
													.on(
															'submit',
															function() {
																var email = $(
																		'.inputNew')
																		.val();
																$(
																		".success_inline, .warning_inline, .error")
																		.remove();
																if (!isValidEmailAddress(email)) {
																	$('.valid')
																			.html(
																					"<div class=\"error alert alert-danger\">Email không hợp lệ<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div></div>");
																	$(
																			'.inputNew')
																			.focus();
																	return false;
																}
																var url = "indexd801.json?route=tool/newsletter";
																$
																		.ajax({
																			type : "post",
																			url : url,
																			data : $(
																					"#formNewLestter")
																					.serialize(),
																			dataType : 'json',
																			success : function(
																					json) {
																				$(
																						".success_inline, .warning_inline, .error")
																						.remove();
																				if (json['error']) {
																					$(
																							'.valid')
																							.html(
																									"<div class=\"warning_inline alert alert-danger\">"
																											+ json['error']
																											+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div>");
																				}
																				if (json['success']) {
																					$(
																							'.valid')
																							.html(
																									"<div class=\"success_inline alert alert-success\">"
																											+ json['success']
																											+ "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div>");
																				}
																			}
																		});
																return false;
															});
										});

						function isValidEmailAddress(emailAddress) {
							var pattern = new RegExp(
									/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
							return pattern.test(emailAddress);
						}
					</script>
				</div>
			</div>
		</div>
	</div>

	<div id="powered">
		<div class="container">
			<div id="top">
				<a class="scrollup" href="#" style="display: inline;"><i
					class="fa fa-angle-up"></i>Top</a>
			</div>
			<div class="copyright pull-left">
				Copyright &copy; Styleshop 2017. Thiết kế bởi <a
					href="http://facebook.com/huuphuoc.97">Hữu Phước</a>
			</div>
		</div>
	</div>

</footer>
</body>
</html>