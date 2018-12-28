<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.sidebar-offcanvas {
	width: 100%;
	background: #FFFFFF;
	left: -100%;
	transition: left 0.2s;
	z-index: 9999;
}
</style>

<div id="content" class="col-sm-9">

	<div class="layerslider-wrapper" style="max-width: 873px;">
		<div class="bannercontainer banner-boxed" style="padding:; margin:;">
			<div id="sliderlayer170002292" class="rev_slider boxedbanner"
				style="width: 100%; height: 457px;">
				<ul>
					<c:forEach items="${objSlider }" var="objS">
						<li data-masterspeed="300" data-transition="random"
							data-slotamount="7"
							data-thumb="${pageContext.request.contextPath }/files/${objS.picture}">


							<img
							src="${pageContext.request.contextPath }/files/${objS.picture}"
							alt="" /> <!-- THE MAIN IMAGE IN THE SLIDE -->
							<div
								class="caption very_large_black_text lfl											easeInOutCubic   easeInOutCubic											"
								data-x="274" data-y="125" data-speed="300" data-start="700"
								data-easing="easeOutExpo">${objS.text1 }</div> <!-- THE MAIN IMAGE IN THE SLIDE -->
							<div
								class="caption bold_green_text lfl											easeInOutCubic   easeInOutCubic											"
								data-x="272" data-y="175" data-speed="300" data-start="1326"
								data-easing="easeOutExpo">${objS.text2 }</div> <!-- THE MAIN IMAGE IN THE SLIDE -->
							<div
								class="caption small_text lfr											easeOutExpo   easeOutExpo											"
								data-x="274" data-y="220" data-speed="300" data-start="2000"
								data-easing="easeOutExpo">${objS.text3 }</div> <!-- THE MAIN IMAGE IN THE SLIDE -->
							<div
								class="caption btn-link randomrotate											easeOutExpo   easeOutExpo											"
								data-x="274" data-y="295" data-speed="300" data-start="2800"
								data-easing="easeOutExpo">${objS.text_shopnow }</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<script type="text/javascript">

    var tpj = jQuery;

    if (tpj.fn.cssOriginal != undefined)
        tpj.fn.css = tpj.fn.cssOriginal;

    tpj('#sliderlayer170002292').revolution(
        {
            delay:9000,
            startheight:457,
            startwidth:873,
            hideThumbs:200,
            thumbWidth:100,
            thumbHeight:50,
            thumbAmount:5,
            navigationType: "bullet",
            navigationArrows: "verticalcentered",
                        navigationStyle: "round",
                        navOffsetHorizontal:0,
            navOffsetVertical:20,
            touchenabled: "on",
            onHoverStop: "on",
            shuffle: "off",
            stopAtSlide: -1,
            stopAfterLoops: -1,
            hideCaptionAtLimit: 0,
            hideAllCaptionAtLilmit: 0,
            hideSliderAtLimit: 0,
            fullWidth: "off",
            shadow:0        });
</script>
<div class="container">
	<c:forEach items="${listBanner }" var="objBanner">
		<c:if test="${objBanner.thu_tu == '1' }">
			<div id="banner0" style="margin-bottom: 20px;">
				<div class="item">
					<img
						src="${pageContext.request.contextPath }/files/${objBanner.picture}"
						alt="banner" class="img-responsive">
				</div>
			</div>
		</c:if>
	</c:forEach>


	<div class="pav-container ">
		<div class="pav-inner">

			<div class="row row-level-1 ">
				<div class="row-inner clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="col-inner">
							<div class="box nopadding pav-categoryproducts clearfix">
								<div class="box-wapper">
									<div class="tab-nav">
										<ul class="nav nav-tabs" role="tablist" id="producttabs13849">
											<li role="presentation" class="effect blue active first last">
												<a
												href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj1.name)}-${obj1.id_cat}"
												aria-controls="tab-cattabs1384924" role="tab"
												data-toggle="tab" class="category_name box-heading"> <span
													style="cursor: pointer;">${obj1.name }</span>
											</a>
											</li>
										</ul>
									</div>

									<!-- ========Content======== -->
									<div class="tab-content blue">

										<div class="tab-pane  hasbanner clearfix active"
											id="tab-cattabs1384924">

											<div class="tableft hidden-sm hidden-xs">
												<a
													href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj1.name)}-${obj1.id_cat}"><img
													width="279px" height="400px" class="img-responsive"
													src="${pageContext.request.contextPath }/files/${obj1.picture}"
													alt=""></a>
											</div>
											<div class="carousel-controls">
												<a class="carousel-control left fa"
													href="${pageContext.request.contextPath }/#boxcats1384924-0"
													data-slide="prev"> <em class="fa fa-angle-left"></em>
												</a> <a class="carousel-control right"
													href="${pageContext.request.contextPath }/#boxcats1384924-0"
													data-slide="next"> <em class="fa fa-angle-right"></em>
												</a>
											</div>

											<div class="pavproducts13849-0 slide tabright"
												id="boxcats1384924-0">
												<div class="carousel-inner">
													<div class="item active">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list1 }" var="obj11">
																<c:if test="${a <= 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name}</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<!-- <div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							
																						</div> -->
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>

													</div>
													<div class="item ">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list1 }" var="obj11">
																<c:if test="${a > 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name }</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>
													</div>

													<c:set value="${a + 1 }" var="a"></c:set>

												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<script type="text/javascript">
                            $(function () {
                                $('#pavproducts13849-0').carousel({interval:9999999999,auto:false,pause:'hover'});
                                $('#producttabs13849-0 a:first').tab('show');
                            });
                        </script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="pav-container ">
		<div class="pav-inner">

			<div class="row row-level-1 ">
				<div class="row-inner clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="col-inner">
							<div class="box nopadding pav-categoryproducts clearfix">
								<div class="box-wapper">
									<div class="tab-nav">
										<ul class="nav nav-tabs" role="tablist" id="producttabs13849">
											<li role="presentation" class="effect cyan active first last">
												<a
												href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj2.name)}-${obj2.id_cat}"
												aria-controls="tab-cattabs1384924" role="tab"
												data-toggle="tab" class="category_name box-heading"> <span
													style="cursor: pointer;">${obj2.name }</span>
											</a>
											</li>
										</ul>
									</div>

									<!-- ========Content======== -->
									<div class="tab-content cyan">

										<div class="tab-pane  hasbanner clearfix active"
											id="tab-cattabs1384924">

											<div class="tableft hidden-sm hidden-xs">
												<a
													href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj2.name)}-${obj2.id_cat}"><img
													width="279px" height="400px" class="img-responsive"
													src="${pageContext.request.contextPath }/files/${obj2.picture}"
													alt=""></a>
											</div>
											<div class="carousel-controls">
												<a class="carousel-control left fa"
													href="http://vinaenter.myzozo.net/#boxcats1384924-1"
													data-slide="prev"> <em class="fa fa-angle-left"></em>
												</a> <a class="carousel-control right"
													href="http://vinaenter.myzozo.net/#boxcats1384924-1"
													data-slide="next"> <em class="fa fa-angle-right"></em>
												</a>
											</div>

											<div class="pavproducts13849-1 slide tabright"
												id="boxcats1384924-1">
												<div class="carousel-inner">
													<div class="item active">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list2 }" var="obj21">
																<c:if test="${a <= 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj21.name)}-${obj21.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj21.picture}"
																					alt="${obj21.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj21.name)}-${obj21.id_product}.html">${obj21.name}</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj21.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj21.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj21.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj21.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj21.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj21.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj21.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj21.name)}-${obj21.id_product}.html'>${obj21.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj21.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj21.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>

													</div>
													<div class="item ">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list2 }" var="obj11">
																<c:if test="${a > 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name }</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>
													</div>

													<c:set value="${a + 1 }" var="a"></c:set>

												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<script type="text/javascript">
                            $(function () {
                                $('#pavproducts13849-1').carousel({interval:9999999999,auto:false,pause:'hover'});
                                $('#producttabs13849-1 a:first').tab('show');
                            });
                        </script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="pav-container ">
		<div class="pav-inner">

			<div class="row row-level-1 ">
				<div class="row-inner clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="col-inner">
							<div class="box nopadding pav-categoryproducts clearfix">
								<div class="box-wapper">
									<div class="tab-nav">
										<ul class="nav nav-tabs" role="tablist" id="producttabs13849">
											<li role="presentation"
												class="effect green active first last"><a
												href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj3.name)}-${obj3.id_cat}"
												aria-controls="tab-cattabs1384924" role="tab"
												data-toggle="tab" class="category_name box-heading"> <span
													style="cursor: pointer;">${obj3.name }</span>
											</a></li>
										</ul>
									</div>

									<!-- ========Content======== -->
									<div class="tab-content green">

										<div class="tab-pane  hasbanner clearfix active"
											id="tab-cattabs1384924">

											<div class="tableft hidden-sm hidden-xs">
												<a
													href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj3.name)}-${obj3.id_cat}"><img
													width="279px" height="400px" class="img-responsive"
													src="${pageContext.request.contextPath }/files/${obj3.picture}"
													alt=""></a>
											</div>
											<div class="carousel-controls">
												<a class="carousel-control left fa"
													href="http://vinaenter.myzozo.net/#boxcats1384924-2"
													data-slide="prev"> <em class="fa fa-angle-left"></em>
												</a> <a class="carousel-control right"
													href="http://vinaenter.myzozo.net/#boxcats1384924-2"
													data-slide="next"> <em class="fa fa-angle-right"></em>
												</a>
											</div>

											<div class="pavproducts13849-2 slide tabright"
												id="boxcats1384924-2">
												<div class="carousel-inner">
													<div class="item active">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list3 }" var="obj11">
																<c:if test="${a <= 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name}</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>

													</div>
													<div class="item ">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list3 }" var="obj11">
																<c:if test="${a > 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name }</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>
													</div>

													<c:set value="${a + 1 }" var="a"></c:set>

												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<script type="text/javascript">
                            $(function () {
                                $('#pavproducts13849-2').carousel({interval:9999999999,auto:false,pause:'hover'});
                                $('#producttabs13849-2 a:first').tab('show');
                            });
                        </script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="pav-container ">
		<div class="pav-inner">

			<div class="row row-level-1 ">
				<div class="row-inner clearfix">
					<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
						<div class="col-inner">
							<div class="box nopadding pav-categoryproducts clearfix">
								<div class="box-wapper">
									<div class="tab-nav">
										<ul class="nav nav-tabs" role="tablist" id="producttabs13849">
											<li role="presentation" class="effect red active first last">
												<a
												href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj4.name)}-${obj4.id_cat}"
												aria-controls="tab-cattabs1384924" role="tab"
												data-toggle="tab" class="category_name box-heading"> <span
													style="cursor: pointer;">${obj4.name }</span>
											</a>
											</li>
										</ul>
									</div>

									<!-- ========Content======== -->
									<div class="tab-content red">

										<div class="tab-pane  hasbanner clearfix active"
											id="tab-cattabs1384924">

											<div class="tableft hidden-sm hidden-xs">
												<a
													href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj4.name)}-${obj4.id_cat}"><img
													width="279px" height="400px" class="img-responsive"
													src="${pageContext.request.contextPath }/files/${obj4.picture}"
													alt=""></a>
											</div>
											<div class="carousel-controls">
												<a class="carousel-control left fa"
													href="http://vinaenter.myzozo.net/#boxcats1384924-3"
													data-slide="prev"> <em class="fa fa-angle-left"></em>
												</a> <a class="carousel-control right"
													href="http://vinaenter.myzozo.net/#boxcats1384924-3"
													data-slide="next"> <em class="fa fa-angle-right"></em>
												</a>
											</div>

											<div class="pavproducts13849-3 slide tabright"
												id="boxcats1384924-3">
												<div class="carousel-inner">
													<div class="item active">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list4 }" var="obj11">
																<c:if test="${a <= 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name}</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>

													</div>
													<div class="item ">
														<div class="row product-items last">
															<c:set value="1" var="a"></c:set>
															<c:forEach items="${list4 }" var="obj11">
																<c:if test="${a > 4 }">
																	<div
																		class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
																		<div class="product-block item-default" itemtype=""
																			itemscope="">
																			<div class="image">
																				<a class="img"
																					href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html"><img
																					width="200px" height="222px"
																					src="${pageContext.request.contextPath }/files/${obj11.picture}"
																					alt="${obj11.name }" class="img-responsive"></a>
																			</div>
																			<div class="product-meta">
																				<div class="left">
																					<h3 class="name">
																						<a
																							href="${pageContext.request.contextPath }/${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html">${obj11.name }</a>
																					</h3>
																					<div class="price" itemtype="" itemscope=""
																						itemprop="offers">
																						<c:choose>
																							<c:when test="${obj11.gia_sale != 0 }">
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia_sale }" />đ</span>
																								<span class="price-old"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:when>
																							<c:otherwise>
																								<span class="price-new"><fmt:formatNumber
																										type="number" pattern="###,###"
																										value="${obj11.gia }" />đ</span>
																							</c:otherwise>
																						</c:choose>

																					</div>
																				</div>

																				<div class="right">
																					<div class="description" itemprop="description">

																					</div>
																					<div class="action">
																						<div class="addcart">
																							<button
																								onclick="return cart${obj11.id_product}()"
																								class="btn btn-shopping-cart"
																								value="Add to Cart">
																								<i class="fa fa-shopping-cart"></i> <span>Thêm
																									vào giỏ</span>
																							</button>
																						</div>
																						<div class="button-group">
																							<div class="wishlist">
																								<a onclick="wishlist.add(&#39;54&#39;);"
																									title="Add to Wish List" class="product-icon">
																									<i class="fa fa-heart"></i> <span>Thêm
																										vào yêu thích</span>
																								</a>
																							</div>
																							<div class="compare">
																								<a onclick="compare.add(&#39;54&#39;);"
																									title="Add to Compare" class="product-icon">
																									<i class="fa fa-refresh"></i> <span>So
																										sánh sản phẩm</span>
																								</a>
																							</div>
																						</div>
																					</div>
																				</div>
																				<script type="text/javascript">
																				function cart${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${obj11.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(obj11.name)}-${obj11.id_product}.html'>${obj11.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																					jQuery('.addcart').click(function () {
																			            jQuery("html, body").animate({scrollTop: 0}, 300);
																			            return false;
																			        });
																				}
																				function cartremove${obj11.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${obj11.id_product}',
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
																			</div>
																		</div>
																	</div>
																</c:if>
																<c:set value="${a + 1 }" var="a"></c:set>
															</c:forEach>
														</div>
													</div>

													<c:set value="${a + 1 }" var="a"></c:set>

												</div>
											</div>
										</div>
									</div>

								</div>
							</div>

							<script type="text/javascript">
                            $(function () {
                                $('#pavproducts13849-3').carousel({interval:9999999999,auto:false,pause:'hover'});
                                $('#producttabs13849-3 a:first').tab('show');
                            });
                        </script>
							<script type="text/javascript">
	$('select[name=\'recurring_id\'], input[name="quantity"]')
			.change(
					function() {
						$
								.ajax({
									url : 'index.php?route=product/product/getRecurringDescription',
									type : 'post',
									data : $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
									dataType : 'json',
									beforeSend : function() {
										$('#recurring-description').html('');
									},
									success : function(json) {
										$('.alert, .text-danger').remove();

										if (json['success']) {
											$('#recurring-description').html(
													json['success']);
										}
									}
								});
					});
</script>
							<script type="text/javascript">
	$('#button-cart')
			.on(
					'click',
					function() {
						$
								.ajax({
									url : 'index.php?route=checkout/cart/add',
									type : 'post',
									data : $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
									dataType : 'json',
									beforeSend : function() {
										$('#button-cart').button('loading');

									},
									complete : function() {
										$('#button-cart').button('reset');
									},
									success : function(json) {

										$('.alert, .text-danger').remove();
										$('.form-group').removeClass(
												'has-error');

										if (json['error']) {
											if (json['error']['option']) {
												for (i in json['error']['option']) {
													var element = $('#input-option'
															+ i.replace('_',
																	'-'));

													if (element
															.parent()
															.hasClass(
																	'input-group')) {
														element
																.parent()
																.after(
																		'<div class="text-danger">'
																				+ json['error']['option'][i]
																				+ '</div>');
													} else {
														element
																.after('<div class="text-danger">'
																		+ json['error']['option'][i]
																		+ '</div>');
													}
												}
											}

											if (json['error']['recurring']) {
												$(
														'select[name=\'recurring_id\']')
														.after(
																'<div class="text-danger">'
																		+ json['error']['recurring']
																		+ '</div>');
											}

											// Highlight any found errors
											$('.text-danger').parent()
													.addClass('has-error');
										}

										if (json['success']) {
											$('.breadcrumb')
													.after(
															'<div class="alert alert-success">'
																	+ json['success']
																	+ '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');

											$('#cart-total')
													.html(json['total']);

											$('html, body').animate({
												scrollTop : 0
											}, 'slow');

											$('#cart > ul')
													.load(
															'index1e1c.html?route=common/cart/info%20ul%20li');
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
</script>
							<script type="text/javascript">
	$('.date').datetimepicker({
		pickTime : false
	});

	$('.datetime').datetimepicker({
		pickDate : true,
		pickTime : true
	});

	$('.time').datetimepicker({
		pickDate : false
	});

	$('button[id^=\'button-upload\']')
			.on(
					'click',
					function() {
						var node = this;

						$('#form-upload').remove();

						$('body')
								.prepend(
										'<form enctype="multipart/form-data" id="form-upload" style="display: none;"><input type="file" name="file" /></form>');

						$('#form-upload input[name=\'file\']').trigger('click');

						if (typeof timer != 'undefined') {
							clearInterval(timer);
						}

						timer = setInterval(
								function() {
									if ($('#form-upload input[name=\'file\']')
											.val() != '') {
										clearInterval(timer);

										$
												.ajax({
													url : 'index.php?route=tool/upload',
													type : 'post',
													dataType : 'json',
													data : new FormData(
															$('#form-upload')[0]),
													cache : false,
													contentType : false,
													processData : false,
													beforeSend : function() {
														$(node).button(
																'loading');
													},
													complete : function() {
														$(node).button('reset');
													},
													success : function(json) {
														$('.text-danger')
																.remove();

														if (json['error']) {
															$(node)
																	.parent()
																	.find(
																			'input')
																	.after(
																			'<div class="text-danger">'
																					+ json['error']
																					+ '</div>');
														}

														if (json['success']) {
															alert(json['success']);

															$(node)
																	.parent()
																	.find(
																			'input')
																	.val(
																			json['code']);
														}
													},
													error : function(xhr,
															ajaxOptions,
															thrownError) {
														alert(thrownError
																+ "\r\n"
																+ xhr.statusText
																+ "\r\n"
																+ xhr.responseText);
													}
												});
									}
								}, 500);
					});
</script>
							<script type="text/javascript">
	$('#review').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();

		$('#review').fadeOut('slow');

		$('#review').load(this.href);

		$('#review').fadeIn('slow');
	});

	$('#review').load(
			'index9092.html?route=product/product/review&amp;product_id=53');

	$('#button-review')
			.on(
					'click',
					function() {
						$
								.ajax({
									url : 'index.php?route=product/product/write&product_id=53',
									type : 'post',
									dataType : 'json',
									data : $("#form-review").serialize(),
									beforeSend : function() {
										$('#button-review').button('loading');
									},
									complete : function() {
										$('#button-review').button('reset');
									},
									success : function(json) {
										$('.alert-success, .alert-danger')
												.remove();

										if (json['error']) {
											$('#review').after(
													'<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> '
															+ json['error']
															+ '</div>');
										}

										if (json['success']) {
											$('#review').after(
													'<div class="alert alert-success"><i class="fa fa-check-circle"></i> '
															+ json['success']
															+ '</div>');

											$('input[name=\'name\']').val('');
											$('textarea[name=\'text\']')
													.val('');
											$('input[name=\'rating\']:checked')
													.prop('checked', false);
										}
									}
								});
					});

	$(document).ready(function() {
		$('.thumbnails').magnificPopup({
			type : 'image',
			delegate : 'a',
			gallery : {
				enabled : true
			}
		});
	});
</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:forEach items="${listBanner }" var="objBanner">
		<c:if test="${objBanner.thu_tu == '2' }">
			<div id="banner1" style="margin-bottom: 20px;">
				<div class="item">
					<img
						src="${pageContext.request.contextPath }/files/${objBanner.picture}"
						alt="banner" class="img-responsive">
				</div>
			</div>
		</c:if>
	</c:forEach>