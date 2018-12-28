<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="content" class="col-sm-9">
	<h1>Sản phẩm</h1>

	<div class="product-filter">
		<div class="inner clearfix">
			<div class="display">
				<div class="btn-group group-switch">
					<button type="button" id="list-view" class="btn btn-switch list"
						data-toggle="tooltip" title="" data-original-title="List">
						<i class="fa fa-th-list"></i>
					</button>
					<button type="button" id="grid-view" class="btn btn-switch grid"
						data-toggle="tooltip" title="" data-original-title="Grid">
						<i class="fa fa-th"></i>
					</button>
				</div>
			</div>
			<div class="filter-right">
				<div class="product-compare">
					<a href="${pageContext.request.contextPath }/"
						class="btn btn-compare btn-theme-default" id="compare-total">So
						sánh sản phẩm (0)</a>
				</div>

				<!-- <div class="sort">
					<span>Sắp xếp theo:</span> <select
						onchange="location = this.value;">
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=p.sort_order&amp;order=ASC"
							selected="selected">Mặc định</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=pd.name&amp;order=ASC">Tên
							(A - Z)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=pd.name&amp;order=DESC">Tên
							(Z - A)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=p.price&amp;order=ASC">Giá
							(Thấp &gt; Cao)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=p.price&amp;order=DESC">Giá
							(Cao &gt; Thấp)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=rating&amp;order=DESC">Đánh
							giá (Cao nhất)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=rating&amp;order=ASC">Đánh
							giá (Thấp nhất)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=p.model&amp;order=ASC">Dòng
							sản phẩm (A - Z)</option>
						<option
							value="http://vinaenter.myzozo.net/san-pham?sort=p.model&amp;order=DESC">Dòng
							sản phẩm (Z - A)</option>
					</select>
				</div>

				<div class="limit">
					<span>Giới hạn:</span> <select onchange="location = this.value;">
						<option value="http://vinaenter.myzozo.net/san-pham?limit=16"
							selected="selected">16</option>
						<option value="http://vinaenter.myzozo.net/san-pham?limit=25">25</option>
						<option value="http://vinaenter.myzozo.net/san-pham?limit=50">50</option>
						<option value="http://vinaenter.myzozo.net/san-pham?limit=75">75</option>
						<option value="http://vinaenter.myzozo.net/san-pham?limit=100">100</option>
					</select>
				</div> -->

			</div>
		</div>
	</div>
	<div id="products" class="product-grid">
		<div class="products-block">
			<c:set value="1" var="i"></c:set>
			<c:forEach items="${listProduct }" var="objP">
				<c:if test="${i == 1 || i ==5 || i == 9 }">
					<div class="row product-items">
				</c:if>
				<c:set value="${slugUtils.toSlug(objP.name) }" var="slugName"></c:set>
				<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols">
					<div class="product-block item-default" itemtype="" itemscope="">

						<div class="image">
							<c:if test="${objP.gia_sale != 0 }">
								<!-- text sale-->
								<span class="product-label-special product-label"><span
									class="special">Sale</span></span>
							</c:if>
							<a class="img"
								href="${pageContext.request.contextPath }/${slugName}-${objP.id_product}.html"><img
								width="270px" height="357px"
								src="${pageContext.request.contextPath }/files/${objP.picture}"
								alt="${objP.name }" class="img-responsive" /></a>

							<!-- zoom image-->
							<a
								href="${pageContext.request.contextPath }/files/${objP.picture}"
								class="info-view product-zoom" title="${objP.name }"><i
								class="fa fa-search-plus"></i></a>
						</div>

						<div class="product-meta">
							<div class="left">
								<h3 class="name">
									<a
										href="${pageContext.request.contextPath }/${slugName}-${objP.id_product}.html">${objP.name }</a>
								</h3>
								<c:choose>
									<c:when test="${objP.gia_sale != 0 }">
										<div class="price" itemtype="" itemscope="" itemprop="offers">
											<span class="price-new"> <fmt:formatNumber
													type="number" pattern="###,###" value="${objP.gia_sale}" />
												VNĐ
											</span> <span class="price-old"> <fmt:formatNumber
													type="number" pattern="###,###" value="${objP.gia}" /> VNĐ
											</span>

										</div>
									</c:when>
									<c:otherwise>
										<div class="price" itemtype="" itemscope="" itemprop="offers">
											<span class="special-price"><fmt:formatNumber
													type="number" pattern="###,###" value="${objP.gia}" /> VNĐ</span>
										</div>
									</c:otherwise>
								</c:choose>

							</div>

							<div class="right">
								<div class="description" itemprop="description">${objP.preview }</div>
								<div class="action">
									<div class="addcart">
										<button onclick="return cart${objP.id_product}()"
											class="btn btn-shopping-cart" value="Add to Cart">
											<i class="fa fa-shopping-cart"></i> <span>Thêm vào giỏ</span>
										</button>
									</div>
									<div class="button-group">
										<div class="wishlist">
											<a onclick="wishlist.add('54');" title="Add to Wish List"
												class="product-icon"> <i class="fa fa-heart"></i> <span>Thêm
													vào yêu thích</span>
											</a>
										</div>
										<div class="compare">
											<a onclick="compare.add('54');" title="Add to Compare"
												class="product-icon"> <i class="fa fa-refresh"></i> <span>So
													sánh sản phẩm</span>
											</a>
										</div>
									</div>
								</div>
							</div>
							<script type="text/javascript">
																				function cart${objP.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/giohang?pid=${objP.id_product}',
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
																											+"href='${pageContext.request.contextPath}/+${slugUtils.toSlug(objP.name)}-${objP.id_product}.html'>${objP.name}</a> vào <a href='${pageContext.request.contextPath}/gio-hang'>giỏ hàng</a>!"
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
																				function cartremove${objP.id_product}() {
																					$
																							.ajax({
																								url : '${pageContext.request.contextPath}/cartremove?pid=${objP.id_product}',
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
				<c:if
					test="${i == 4 || i == 8 || i == 12 || i == listProduct.size()}">
		</div>
		</c:if>

		<c:set value="${i + 1 }" var="i"></c:set>
		</c:forEach>
	</div>

</div>
<div
	style="background: #FFF; overflow: auto; padding-bottom: 10px; display: inline;">
	<div id="pages" class="col-sm-6 text-left">
		<c:choose>
			<c:when test="${sumPage == 1 || sumPage == 0}">

			</c:when>
			<c:otherwise>
				<c:set var="back" value="0"></c:set>
				<c:set var="next" value="0"></c:set>
				<c:set var="loop" value="8"></c:set>
				<c:set var="num" value="1"></c:set>
				<c:set var="total" value="${sumPage }"></c:set>
				<c:set var="pages" value="${current_page }"></c:set>
				<c:choose>
					<c:when test="${1 == total }">
						<small>Trang 1 / 1</small>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${pages == 1 }">
								<c:set var="back" value="1"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="back" value="${pages - 1 }"></c:set>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pages == total }">
								<c:set var="next" value="${total }"></c:set>
							</c:when>
							<c:otherwise>
								<c:set var="next" value="${pages + 1 }"></c:set>
							</c:otherwise>
						</c:choose>
						<c:if test="${total <= 8 }">
							<c:set var="loop" value="${total }"></c:set>
						</c:if>
						<c:if test="${pages > 8 - 0}">
							<c:set var="loop" value="${pages + 4 }"></c:set>
							<c:set var="num" value="${pages - 4 }"></c:set>
							<c:if test="${loop >= total }">
								<c:set var="loop" value="${total }"></c:set>
								<c:set var="num" value="${total - 8 + 1 }"></c:set>
							</c:if>
						</c:if>
						<small style="margin-right: 20px;">Trang ${pages } /
							${total }</small>
						<c:if test="${pages != 1 }">
							<a style="margin-right: 20px;"
								href="${pageContext.request.contextPath }/product?page=${back}"
								title=""><</a>
						</c:if>
						<c:forEach var="i" begin="${num }" end="${loop }">
							<c:choose>
								<c:when test="${pages == i }">
									<span style="margin-right: 20px; text-decoration: underline;">${i }</span>
								</c:when>
								<c:otherwise>
									<a style="margin-right: 20px;"
										href="${pageContext.request.contextPath }/product?page=${i}">${i }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pages != total }">
							<a
								href="${pageContext.request.contextPath }/product?page=${next}"
								title="">></a>
						</c:if>
					</c:otherwise>
				</c:choose>

			</c:otherwise>
		</c:choose>
	</div>
</div>
</div>
</div>
