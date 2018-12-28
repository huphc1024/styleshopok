<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-category" data-toggle="tooltip"
				title="Lưu" class="btn btn-primary">
				<i class="fa fa-save"></i>
			</button>
			<a
				href="${pageContext.request.contextPath }/admincp/categories"
				data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
				class="fa fa-reply"></i></a>
		</div>
		<h1>Danh mục</h1>
		<ul class="breadcrumb">
			<li><a
				href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/categories">Danh
					mục</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-pencil"></i> Sửa Danh mục
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/categories/edit/${objCat.id_cat }"
				method="post" enctype="multipart/form-data" id="form-category"
				class="form-horizontal">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab-general" data-toggle="tab">Tổng
							quan</a></li>
					<li><a href="#tab-data" data-toggle="tab">Dữ liệu</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="tab-general">
						<ul class="nav nav-tabs" id="language">
							<li><a href="#language1" data-toggle="tab"></a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane" id="language1">
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-name1">Tên:</label>
									<div class="col-sm-10">
										<input type="text" name="name" value="${objCat.name }" placeholder="Tên:"
											id="input-name1" class="form-control"
											onblur="setTitle(); setAutoSeoUrl();" />
										<form:errors path="objItem.name"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-meta-title1">Thẻ
										tiêu đề (Meta title)</label>
									<div class="col-sm-10">
										<input type="text" name="meta_title" value="${objCat.meta_title }"
											placeholder="Thẻ tiêu đề (Meta title)" id="input-meta-title1"
											class="form-control" />
											<form:errors path="objItem.meta_title"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
								<div class="form-group required">
									<label style="content: none;" class="col-sm-2 control-label" >Thứ
										tự</label>
									<div class="col-sm-10">
										<input type="text" name="thu_tu" value="${objCat.thu_tu }" placeholder="Thứ tự"
											id="input-meta-title1" class="form-control" />
											<form:errors path="objItem.thu_tu"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pane" id="tab-data">
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-parent">Danh
								mục cha:</label>
							<div class="col-sm-10">
								<select name="parent_id" class="form-control">
									<option value="0">----</option>
									<c:forEach items="${listParent }" var="objC">
										<c:choose>
										<c:when test="${objC.id_cat == objCat.parent_id }"><option selected="selected" value="${objC.id_cat }">${objC.name }</option></c:when>
										<c:otherwise><option value="${objC.id_cat }">${objC.name }</option></c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Hình ảnh:</label>
							<div class="col-sm-10">
								<c:if test="${empty objCat.picture }"><img width="100px" height="100px" alt="no-image" src="${define.URL_ADMIN }/image/no-images.jpg"></c:if>
								<c:if test="${not empty objCat.picture }"><img width="100px" height="100px" alt="${objCat.name }" src="${pageContext.request.contextPath }/files/${objCat.picture}"></c:if>
								<input type="file" name="image" />
								<%-- <a href="" id="thumb-image" data-toggle="image"
									class="img-thumbnail"> <img
									src="${define.URL_ADMIN }/image/cache/no_image-100x100.png"
									alt="" title=""
									data-placeholder="http://vinaenter.myzozo.net/image/cache/no_image-100x100.png" /></a>
								<input type="hidden" name="image" value="" id="input-image" /> --%>
								<c:if test="${not empty msgPic }"><p style="color: red; font-style: italic;">${msgPic }</p></c:if>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-status">Trạng
								thái:</label>
							<div class="col-sm-10">
								<select name="active" id="input-status" class="form-control">
									<option value="1" selected="selected">Bật</option>
									<option value="0">Tắt</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
<script type="text/javascript"
	src="${define.URL_ADMIN }/javascript/summernote/summernote.js"></script>
<link href="${define.URL_ADMIN }/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript"
	src="${define.URL_ADMIN }/javascript/summernote/opencart.js"></script>

<script type='text/javascript'>
<!--
	function setTitle() {
		var str = (document.getElementById("input-name1").value);
		document.getElementById("input-meta-title1").value = str;
	}

	function setAutoSeoUrl() {
		var str = (document.getElementById("input-name1").value);// lấy chuỗi dữ liệu nhập vào từ form có tên title
		str = str.toLowerCase();// chuyển chuỗi sang chữ thường để xử lý
		/* tìm kiếm và thay thế tất cả các nguyên âm có dấu sang không dấu*/
		str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
		str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
		str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
		str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
		str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
		str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
		str = str.replace(/đ/g, "d");
		str = str
				.replace(
						/!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'| |\"|\&|\#|\[|\]|~|$|_/g,
						"-");
		/* tìm và thay thế các kí tự đặc biệt trong chuỗi sang kí tự - */
		str = str.replace(/-+-/g, "-"); //thay thế 2- thành 1-
		str = str.replace(/^\-+|\-+$/g, "");//cắt bỏ ký tự - ở đầu và cuối chuỗi
		document.getElementById("input-keyword").value = str;// xuất kết quả xữ lý ra keyword
	}
//-->
</script>

<script type="text/javascript">
<!--
	$('input[name=\'path\']')
			.autocomplete(
					{
						'source' : function(request, response) {
							$
									.ajax({
										url : 'index.php?route=catalog/category/autocomplete&token=PLDDHknkJS8fwxIxGNzLEUioVxhVTvoP&filter_name='
												+ encodeURIComponent(request),
										dataType : 'json',
										success : function(json) {
											json.unshift({
												category_id : 0,
												name : ' --- Không --- '
											});

											response($
													.map(
															json,
															function(item) {
																return {
																	label : item['name'],
																	value : item['category_id']
																}
															}));
										}
									});
						},
						'select' : function(item) {
							$('input[name=\'path\']').val(item['label']);
							$('input[name=\'parent_id\']').val(item['value']);
						}
					});
//-->
</script>
<script type="text/javascript">
<!--
	$('input[name=\'filter\']')
			.autocomplete(
					{
						'source' : function(request, response) {
							$
									.ajax({
										url : 'index.php?route=catalog/filter/autocomplete&token=PLDDHknkJS8fwxIxGNzLEUioVxhVTvoP&filter_name='
												+ encodeURIComponent(request),
										dataType : 'json',
										success : function(json) {
											response($
													.map(
															json,
															function(item) {
																return {
																	label : item['name'],
																	value : item['filter_id']
																}
															}));
										}
									});
						},
						'select' : function(item) {
							$('input[name=\'filter\']').val('');

							$('#category-filter' + item['value']).remove();

							$('#category-filter')
									.append(
											'<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> '
													+ item['label']
													+ '<input type="hidden" name="category_filter[]" value="' + item['value'] + '" /></div>');
						}
					});

	$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
//-->
</script>
<script type="text/javascript">
<!--
	$('#language a:first').tab('show');
//-->
</script>