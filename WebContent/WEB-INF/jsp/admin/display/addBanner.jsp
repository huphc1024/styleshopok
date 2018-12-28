<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-banner" data-toggle="tooltip"
				title="Lưu" class="btn btn-primary">
				<i class="fa fa-save"></i>
			</button>
			<a href="${pageContext.request.contextPath }/admincp/display/banner"
				data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
				class="fa fa-reply"></i></a>
		</div>
		<h1>Quản lý Banner</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/display/banner">Quản
					lý Banner</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-pencil"></i> Thêm Banner
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/display/banner/add"
				method="post" enctype="multipart/form-data" id="form-banner"
				class="form-horizontal">
				<div class="form-group required">
					<label class="col-sm-2 control-label" for="input-name">Tên
						Banner:</label>
					<div class="col-sm-10">
						<input type="text" name="name" value="${objBanner.name }" placeholder="Tên Banner:"
							id="input-name" class="form-control" />
							<form:errors path="objItem.name"
													cssStyle="color:red; font-style:italic;"></form:errors>
					</div>
				</div>
				<br />
				<ul class="nav nav-tabs" id="language">
					<li><a href="#language1" data-toggle="tab">Thêm</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="language1">
						<table id="images1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left">Tiêu đề:</td>
									<td class="text-left">Liên kết</td>
									<td class="text-left">Thứ tự</td>
									<td class="text-center">Hình ảnh:</td>
								</tr>
							</thead>
							<tbody>
								<tr id="image-row0">
									<td class="text-left"><input type="text" name="title"
										value="${objBanner.title }" placeholder="Tiêu đề:" class="form-control" />
										<form:errors path="objItem.title"
													cssStyle="color:red; font-style:italic;"></form:errors></td>
									<td class="text-left" style="width: 30%;"><input
										type="text" name="link" value="${objBanner.link }" placeholder="Liên kết"
										class="form-control" />
										<form:errors path="objItem.link"
													cssStyle="color:red; font-style:italic;"></form:errors></td>
													<td class="text-left"><input type="text" name="thu_tu"
										value="${objBanner.thu_tu }" placeholder="Thứ tự:" class="form-control" />
										<form:errors path="objItem.thu_tu"
													cssStyle="color:red; font-style:italic;"></form:errors></td>
									<td class="text-center">
										 <input type="file" name="hinhanh">
										<c:if test="${not empty msgPic}">
										<p style="color: red; font-style: italic;">${msgPic }</p>
										</c:if>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</form>
		</div>
		<script type="text/javascript">
		<!--
			$('#language a:first').tab('show');
		//-->
		</script>