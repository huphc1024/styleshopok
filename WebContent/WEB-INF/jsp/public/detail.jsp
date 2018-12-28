<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="content" class="col-sm-9">
	<div class="">
		<div class="product-info">
			<div class="row">
				<div class="col-sm-6">

					<div class="fotorama" data-nav="thumbs"
						data-allowfullscreen="native">
						<a
							href="${pageContext.request.contextPath }/files/${objProduct.picture }"><img
							width="414px" height="542px"
							src="${pageContext.request.contextPath }/files/${objProduct.picture }"
							alt="${objProduct.name }" /></a> <a
							href="${pageContext.request.contextPath }/files/${objProduct.picture2 }"><img
							width="414px" height="542px"
							src="${pageContext.request.contextPath }/files/${objProduct.picture2 }"
							alt="${objProduct.name }" /></a> <a
							href="${pageContext.request.contextPath }/files/${objProduct.picture3 }"><img
							width="414px" height="542px"
							src="${pageContext.request.contextPath }/files/${objProduct.picture3 }"
							alt="${objProduct.name }" /></a>
					</div>
				</div>

				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 product-view">
					<h1 class="title-product">${objProduct.name }</h1>

					<div class="description">
						<p>
							<i class="fa fa-chevron-down"></i> <b>Xuất Xứ:</b>
							${objProduct.xuat_xu }
						</p>

						<p>
							<i class="fa fa-chevron-down"></i> <b>Màu:</b> ${objProduct.color }
						</p>

						<p>
							<i class="fa fa-chevron-down"></i> <b>Kích thước:</b>
							${objProduct.size }
						</p>

						<p>
							<i class="fa fa-chevron-down"></i> <b>Tình trạng:</b>
							${objProduct.tinh_trang }
						</p>
					</div>
					<c:choose>
						<c:when test="${objProduct.gia_sale != 0 }">
							<div class="price">
								<div class="price-group">
									<span class="text-price"><fmt:formatNumber type="number"
											pattern="###,###" value="${objProduct.gia_sale}" /> VNĐ</span> <span
										class="price-old"><fmt:formatNumber type="number"
											pattern="###,###" value="${objProduct.gia_sale}" /> VNĐ</span><br />
									<span class="price-new" style="text-decoration: line-through;"><fmt:formatNumber
											type="number" pattern="###,###" value="${objProduct.gia}" />
										VNĐ</span>
								</div>

							</div>
						</c:when>
						<c:otherwise>
							<div class="price">
								<div class="price-group">
									<span class="text-price"><fmt:formatNumber type="number"
											pattern="###,###" value="${objProduct.gia}" /> VNĐ</span> <span
										class="price-old"><fmt:formatNumber type="number"
											pattern="###,###" value="${objProduct.gia}" /> VNĐ</span>
								</div>
							</div>
						</c:otherwise>
					</c:choose>


					<div id="product" class="product-extra">
						<div class="form-group">
							<label class="control-label" for="input-quantity">Số
								lượng</label> <input type="number" min="1" name="quantity" value="1" size="2"
								id="input-quantity" class="form-control" /> <input
								type="hidden" name="product_id" value="53" /> <br />
							<button type="button" id="button-cart"
								data-loading-text="Đang tải..."
								onclick="return cart${objProduct.id_product}()" 
								class="btn btn-primary btn-lg btn-block">Thêm vào giỏ</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tabs-group box">
			<div id="tabs" class="htabs heighlight">
				<ul class="nav clearfix">
					<li class="active first"><a href="#tab-description"
						data-toggle="tab">Mô tả</a></li>
					<li><a href="#tab-review" data-toggle="tab">Đánh giá </a></li>
				</ul>
			</div>
			<div class="tab-content">
				<div class="tab-pane active" id="tab-description">
					<div id="twister_feature_div" class="feature"
						data-feature-name="twister"
						style="-webkit-font-smoothing: antialiased; font-family: HelveticaNeue-Light, Helvetica-Light, HelveticaNeue, Helvetica, Arial, sans-serif; color: rgb(17, 17, 17); font-size: 13px;">
						<div id="twisterContainer" class="addTwisterMargin"
							style="margin-top: 10px; -webkit-font-smoothing: antialiased; max-width: none;">
							<div id="variation_color_name" class="a-section a-spacing-small"
								style="margin-bottom: 0px; -webkit-font-smoothing: antialiased;">
								<div class="a-row a-spacing-micro singleton"
									style="width: 631.675px; -webkit-font-smoothing: antialiased; margin-bottom: 4px !important;">
									${objProduct.preview }</div>
							</div>
						</div>
					</div>
				</div>
				<div class="tab-pane" id="tab-review">
					<form class="form-horizontal" id="form-review" name="form">
						<div id="ajax">
							<div id="review">
								<c:forEach items="${listComment }" var="objC">
									<div class="row">
										<div class="col-sm-1">
											<div class="thumbnail">
												<img class="img-responsive user-photo hidden-xs"
													src="${define.URL_PUBLIC }/image/avatar_2x.png">
											</div>
										</div>
										<div class="col-sm-11">
											<div class="panel panel-default">
												<div class="panel-heading">
													<strong>Tên: ${objC.ho_ten }</strong> - <span
														class="text-muted"> <fmt:formatDate
															value="${objC.date_create }" var="fmtDate"
															pattern="dd/MM/yyyy" />${fmtDate }</span>
												</div>
												<div class="panel-body">${objC.noi_dung }</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<h2>Viết đánh giá</h2>
							<div class="form-group required">
								<div class="col-sm-12">
									<label class="control-label" for="input-name">Họ tên</label> <input
										type="text" name="ho_ten" value="" id="input-name"
										class="form-control" />
								</div>
							</div>
							<div class="form-group required">
								<div class="col-sm-12">
									<label style="margin-top: 35px;" class="control-label"
										for="input-review">Nội dung đánh giá</label>
									<textarea name="noi_dung" rows="5" id="input-review"
										class="form-control"></textarea>
									<div class="help-block">
										<span class="text-danger">Chú ý:</span> Không sử dụng các định
										dạng HTML!
									</div>
								</div>
							</div>
						</div>
						<div class="form-group required"></div>
						<div class="buttons clearfix">
							<div class="pull-right">
								<button style="margin-top: 30px;" type="button"
									id="button-review" data-loading-text="Đang tải..."
									class="btn btn-primary" onclick="return review()">Đánh
									giá</button>
							</div>
						</div>
						<script type="text/javascript">
																				function cart${objProduct.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${objProduct.id_product}',
																								type : 'POST',
																								cache : false,
																								data : {
																								},
																								success : function(data) {
																									$('#cart').html(data);
																									$('#sys-notification').html(
																											"<div class='container'>"
																											+"<div id='notification'>"
																											+"<div class='alert alert-success' style='margin-top: 15px;'>"
																											+"<i class='fa fa-check-circle'></i>"
																											+"Thành công: Bạn đã thêm <a "
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(objProduct.name)}-${objProduct.id_product}.html'>${objProduct.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
																													+"<button type='button' class='close' data-dismiss='alert'>×</button>"
																													+"</div>"
																													+"</div>"
																													+"</div>"
																									);
																								},
																								error : function() {
																									alert('có lỗi xảy ra');
																								}
																							});
																					jQuery('#product').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${objProduct.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${objProduct.id_product}',
																								type : 'POST',
																								cache : false,
																								data : {
																								},
																								success : function(data) {
																									$('#cart').html(data);
																								},
																								error : function() {
																									alert('có lỗi xảy ra');
																								}
																							});
																				}
																				</script>
						<script type="text/javascript">
							function getCheckedValue(radioObj) {
								if (!radioObj)
									return "";
								var radioLength = radioObj.length;
								if (radioLength == undefined)
									if (radioObj.checked)
										return radioObj.value;
									else
										return "";
								for (var i = 0; i < radioLength; i++) {
									if (radioObj[i].checked) {
										return radioObj[i].value;
									}
								}
								return "";
							}
							function check(radioObj) {
								var a = getCheckedValue(radioObj);
								return a;
							}
							function review() {
								radioObj = document.forms['form'].elements['danh_gia'];
								var hoten = $('#input-name').val();
								var noidung = $('#input-review').val();
								var danhgia = check(radioObj);
								$
										.ajax({
											url : '${pageContext.request.contextPath}/danhgia?pid=${objProduct.id_product}',
											type : 'POST',
											cache : false,
											data : {
												ho_ten : hoten,
												noi_dung : noidung,
												danh_gia : danhgia,
											},
											success : function(data) {
												$('#ajax').html(data);
											},
											error : function() {
												alert('có lỗi xảy ra');
											}
										});
							}
						</script>
						<script type="text/javascript">
							$(document)
									.ready(
											function() {
												$('#form-review')
														.validate(
																{
																	rules : {
																		ho_ten : {
																			required : true,
																			minlength : 6
																		},
																		noi_dung : {
																			required : true,
																			minlength : 20,
																		},
																		danh_gia : {
																			required : true,
																		}
																	},
																	messages : {
																		ho_ten : {
																			required : "Vui lòng không để trống!!!",
																			minlength : "Họ tên phải lớn hơn 6 ký tự",
																		},
																		noi_dung : {
																			required : "Vui lòng không để trống!!!",
																			minlength : "Nội dung phải lớn hơn 20 ký tự",
																		},
																	},
																	submitHandler : function(
																			form) {
																		review();
																		return false;
																	}
																});
											});
						</script>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br />

</div>