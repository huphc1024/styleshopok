<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-product" data-toggle="tooltip"
				title="Lưu" class="btn btn-primary">
				<i class="fa fa-save"></i>
			</button>
			<a href="${pageContext.request.contextPath }/admincp/product"
				data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
				class="fa fa-reply"></i></a>
		</div>
		<h1>Sản phẩm</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/product">Sản
					phẩm</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-pencil"></i> Thêm Sản phẩm
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/product/add"
				method="post" enctype="multipart/form-data" id="form-product"
				class="form-horizontal">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-general" data-toggle="tab">Tổng
							quan</a></li>
					<li><a href="#tab-data" data-toggle="tab">Dữ liệu</a></li>
					<li><a href="#tab-image" data-toggle="tab">Hình ảnh</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab-general">
						<ul class="nav nav-tabs" id="language">
							<li><a href="#language1" data-toggle="tab"> </a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="language1">
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-name1">Tên
										sản phẩm:</label>
									<div class="col-sm-10">
										<input type="text" name="name" value="${objP.name }"
											placeholder="Tên sản phẩm:" id="input-name1"
											class="form-control" onblur="setTitle(); setAutoSeoUrl();" />
										<form:errors path="objItem.name"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-2 control-label" for="input-description1">Mô
										tả sản phẩm:</label>
									<div class="col-sm-10">
										<textarea name="preview" placeholder="Mô tả sản phẩm:"
											id="ckeditor" id="input-description1"
											class="form-control summernote">${objP.preview }</textarea>
										<script>
											CKEDITOR.replace('ckeditor');
										</script>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-parent">Danh
										mục cha:</label>
									<div class="col-sm-10">
										<select name="id_cat" class="form-control">
											<option value="">----</option>
											<c:forEach items="${listParent }" var="objC">
												<c:if test="${objC.parent_id == 0 }">
													<c:choose>
														<c:when test="${objC.id_cat == objP.id_product }">
															<option selected="selected" value="${objC.id_cat }">${objC.name }</option>
															<c:forEach items="${listParent }" var="obj">
																<c:if test="${obj.parent_id == objC.id_cat }">
																	<c:choose>
																		<c:when test="${obj.id_cat == objP.id_product }">
																			<option selected="selected" value="${obj.id_cat }">--
																				${obj.name }</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${obj.id_cat }">-- ${obj.name }</option>
																		</c:otherwise>
																	</c:choose>
																</c:if>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<option value="${objC.id_cat }">${objC.name }</option>
															<c:forEach items="${listParent }" var="obj">
																<c:if test="${obj.parent_id == objC.id_cat }">
																	<c:choose>
																		<c:when test="${obj.id_cat == objP.id_product }">
																			<option selected="selected" value="${obj.id_cat }">--
																				${obj.name }</option>
																		</c:when>
																		<c:otherwise>
																			<option value="${obj.id_cat }">-- ${obj.name }</option>
																		</c:otherwise>
																	</c:choose>
																</c:if>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach>
										</select>
										<form:errors path="objItem.id_cat"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-data">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-price">Giá:</label>
							<div class="col-sm-10">
								<input type="text" name="gia" value="${objP.gia }"
									placeholder="Giá:" id="input-price" class="form-control" />
								<form:errors path="objItem.gia"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-price">Giá
								Sale:</label>
							<div class="col-sm-10">
								<input type="text" name="gia_sale" value="${objP.gia_sale }"
									placeholder="Giá Sale:" id="input-price" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-quantity">Màu:</label>
							<div class="col-sm-10">
								<input type="text" name="color" value="${objP.color }"
									placeholder="Màu:" id="input-quantity" class="form-control" />
								<form:errors path="objItem.color"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-quantity">Size:</label>
							<div class="col-sm-10">
								<input type="text" name="size" value="${objP.size }"
									placeholder="Size:" id="input-quantity" class="form-control" />
								<form:errors path="objItem.size"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-quantity">Tình
								trạng hàng:</label>
							<div class="col-sm-10">
								<input type="text" name="tinh_trang" value="${objP.tinh_trang }"
									placeholder="Tình trạng hàng" id="input-quantity"
									class="form-control" />
								<form:errors path="objItem.tinh_trang"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-quantity">Xuất
								xứ:</label>
							<div class="col-sm-10">
								<input type="text" name="xuat_xu" value="${objP.xuat_xu }"
									placeholder="Xuất xứ" id="input-quantity" class="form-control" />
								<form:errors path="objItem.xuat_xu"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-status">Trạng
								thái:</label>
							<div class="col-sm-10">
								<select name="active" id="input-status" class="form-control">
									<c:choose>
										<c:when test="${objP.active == 1}">
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
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-location">Địa
								chỉ Kho hàng:</label>
							<div class="col-sm-10">
								<input type="text" name="diachikhohang"
									value="${objP.diachikhohang }" placeholder="Địa chỉ Kho hàng:"
									id="input-location" class="form-control" />
								<form:errors path="objItem.diachikhohang"
									cssStyle="color:red; font-style:italic;"></form:errors>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-image">
						<div class="table-responsive">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-location">Hình
									ảnh 1:</label>
								<div class="col-sm-10">
									<input type="file" name="image" value="" class="form-control" />
									<c:if test="${ not empty msgPic }">
										<p style="color: red; font-style: italic;">${msgPic }</p>
									</c:if>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-location">Hình
									ảnh 2:</label>
								<div class="col-sm-10">
									<input type="file" name="image2" value="" class="form-control" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-location">Hình
									ảnh 3:</label>
								<div class="col-sm-10">
									<input type="file" name="image3" value="" class="form-control" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
	<!--
		$('#language a:first').tab('show');
		$('#option a:first').tab('show');
	//-->
	</script>