<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-category" data-toggle="tooltip"
				title="Lưu" class="btn btn-primary">
				<i class="fa fa-save"></i>
			</button>
			<a href="${pageContext.request.contextPath }/admincp/categories"
				data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
				class="fa fa-reply"></i></a>
		</div>
		<h1>Danh mục</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
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
				<i class="fa fa-pencil"></i> Thêm Danh mục
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/categories/add"
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
										<input type="text" name="name" value="${objCat.name }"
											placeholder="Tên:" id="input-name1" class="form-control"
											onblur="setTitle(); setAutoSeoUrl();" />
										<form:errors path="objItem.name"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
								<div class="form-group required">
									<label class="col-sm-2 control-label" for="input-meta-title1">Thẻ
										tiêu đề (Meta title)</label>
									<div class="col-sm-10">
										<input type="text" name="meta_title" value=""
											placeholder="Thẻ tiêu đề (Meta title)" id="input-meta-title1"
											class="form-control" />
										<form:errors path="objItem.meta_title"
											cssStyle="color:red; font-style:italic;"></form:errors>
									</div>
								</div>
								<div class="form-group required">
									<label style="content: none;" class="col-sm-2 control-label">Thứ
										tự</label>
									<div class="col-sm-10">
										<input type="text" name="thu_tu" value="" placeholder="Thứ tự"
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
											<c:when test="${objC.id_cat == objCat.parent_id }">
												<option selected="selected" value="${objC.id_cat }">${objC.name }</option>
											</c:when>
											<c:otherwise>
												<option value="${objC.id_cat }">${objC.name }</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label">Hình ảnh:</label>
							<div class="col-sm-10">
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
	<link href="${define.URL_ADMIN }/javascript/summernote/summernote.css"
		rel="stylesheet" />
	<script type="text/javascript"
		src="${define.URL_ADMIN }/javascript/summernote/opencart.js"></script>


	<script type="text/javascript">
	<!--
		$('#language a:first').tab('show');
	//-->
	</script>