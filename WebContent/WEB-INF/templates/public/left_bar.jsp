<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
	<!-- sys-notification -->
	<div id="sys-notification">
	</div>
<c:if test="${error != 'error404' }">
	<c:if test="${title != 'StyleShop' }">
		<ul class="breadcrumb">
			<li><a href=${pageContext.request.contextPath } /><i
				class="fa fa-home"></i></a></li>
			<li><a href="${pageContext.request.contextPath }/${hrefhome}">${title }</a></li>
		</ul>
	</c:if>
	<div class="row">

		<aside id="column-left" class="col-sm-3 hidden-xs sidebar">
			<div class="col-inner  ">
				<div id="pav-verticalmenu"
					class="box pav-verticalmenu highlighted hidden-xs hidden-sm">
					<div class="box-heading">
						<span class="fa fa-bars"></span>Danh mục <span
							class="shapes round"><em class="shapes bottom"></em></span>
					</div>
					<div class="box-content">
						<div class="navbar navbar-default">
							<div id="verticalmenu" class="verticalmenu" role="navigation">
								<div class="navbar-header">
									<a href="javascript:;" data-target=".navbar-collapse"
										data-toggle="collapse" class="navbar-toggle"><span
										class="icon-bar"></span></a>
									<div class="collapse navbar-collapse navbar-ex1-collapse">
										<ul class="nav navbar-nav verticalmenu">
											<c:forEach items="${listCat }" var="objCat">
												<c:set value="${slugUtils.toSlug(objCat.name) }" var="url_Cat"></c:set>
												<c:if test="${objCat.parent_id == 0 }">
													<c:set value="0" var="num"></c:set>
													<c:forEach items="${listCat }" var="objCat2">
														<c:if test="${objCat.id_cat == objCat2.parent_id }">
															<c:set value="${num + 1}" var="num"></c:set>
														</c:if>
													</c:forEach>
													<li class="parent dropdown "><a
														class="dropdown-toggle" data-toggle="dropdown"
														href="${pageContext.request.contextPath }/${url_Cat}-${objCat.id_cat}"><span
															class="menu-title">${objCat.name }</span> <c:if
																test="${num > 0 }">
																<b class="caret"></b>
															</c:if> </a> <c:if test="${num > 0 }">
															<div class="dropdown-menu level1">
																<div class="dropdown-menu-inner">
																	<div class="row">
																		<div class="mega-col col-md-12" data-type="menu">
																			<div class="mega-col-inner">
																				<ul>
																					<c:forEach items="${listCat }" var="objCat2">
																					<c:set value="${slugUtils.toSlug(objCat2.name) }" var="url_Cat"></c:set>
																						<c:if
																							test="${objCat.id_cat == objCat2.parent_id }">
																							<li class="first"><a
																								href="${pageContext.request.contextPath }/${url_Cat}-${objCat2.id_cat}"><span
																									class="menu-title">${objCat2.name }</span></a></li>
																						</c:if>
																					</c:forEach>

																				</ul>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</c:if></li>
												</c:if>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<c:if test="${title != 'StyleShop' }">
				<div class="box orange nopadding products-latest">
					<div class="box-heading">
						<span class="title">Sản phẩm Mới nhất</span>
					</div>
					<div class="box-content">
						<div class="row product-items">
							<c:forEach items="${listProNew }" var="objP">
								<c:set value="${slugUtils.toSlug(objP.name) }" var="nameSlug"></c:set>
								<div
									class="col-lg-3 col-md-3 col-sm-6 col-xs-12 product-cols first">
									<div class="product-block item-default" itemtype=""
										itemscope="">

										<div class="image">
											<!-- text sale-->

											<a class="img"
												href="${pageContext.request.contextPath }/${nameSlug}-${objP.id_product}.html"><img
												width="80px" height="60px"
												src="${pageContext.request.contextPath }/files/${objP.picture}"
												alt="Vitamin C Serum" class="img-responsive" /></a>

										</div>

										<div class="product-meta">
											<div class="left">
												<h3 class="name">
													<a href="${pageContext.request.contextPath }/${nameSlug}-${objP.id_product}.html">${objP.name }</a>
												</h3>
												<c:choose>
													<c:when test="${objP.gia_sale != 0 }">
														<div class="price" itemtype="" itemscope=""
															itemprop="offers">
															<span class="price-new"> <fmt:formatNumber
																	type="number" pattern="###,###"
																	value="${objP.gia_sale}" /> VNĐ
															</span> <br /> <span class="price-old"><fmt:formatNumber
																	type="number" pattern="###,###" value="${objP.gia}" />
																VNĐ</span>

														</div>
													</c:when>
													<c:otherwise>
														<div class="price" itemtype="" itemscope=""
															itemprop="offers">
															<span class="price-new"> <fmt:formatNumber
																	type="number" pattern="###,###" value="${objP.gia}" />
																VNĐ
															</span>

														</div>
													</c:otherwise>
												</c:choose>


											</div>

										</div>
									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</div>
			</c:if>


		</aside>
</c:if>