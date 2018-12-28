<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<button type="submit" form="form-banner" data-toggle="tooltip"
				title="Lưu" class="btn btn-primary">
				<i class="fa fa-save"></i>
			</button>
			<a href="${pageContext.request.contextPath }/admincp/display/slider"
				data-toggle="tooltip" title="Hủy" class="btn btn-default"><i
				class="fa fa-reply"></i></a>
		</div>
		<h1>Quản lý Banner</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/display/slider">Quản
					lý Slider</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-pencil"></i> Sửa Slider
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/display/slider/edit/${obj.id_slider }"
				method="post" enctype="multipart/form-data" id="form-banner"
				class="form-horizontal">
				<br />
				<ul class="nav nav-tabs" id="language">
					<li><a href="#language1" data-toggle="tab">Sửa</a></li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane" id="language1">
						<table id="images1"
							class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left">Text1</td>
									<td class="text-left">Text2</td>
									<td class="text-left">Text3</td>
									<td class="text-left">Text_shopnow</td>
									<td class="text-center">Hình ảnh</td>
								</tr>
							</thead>
							<tbody>
								<tr id="image-row0">
									<td class="text-left"><input type="text" name="text1"
										value="${obj.text1 }" placeholder="text1" class="form-control" />
										<form:errors path="objItem.text1"
													cssStyle="color:red; font-style:italic;"></form:errors></td>
									<td class="text-left" style="width: 30%;"><input
										type="text" name="text2" value="${obj.text2 }" placeholder="text2"
										class="form-control" />
										<form:errors path="objItem.text2"
													cssStyle="color:red; font-style:italic;"></form:errors></td>
													<td class="text-left" style="width: 30%;"><input
										type="text" name="text3" value="${obj.text3 }" placeholder="text3"
										class="form-control" />
										<form:errors path="objItem.text3"
													cssStyle="color:red; font-style:italic;"></form:errors></td>
													<td class="text-left"><input type="text" name="text_shopnow"
										value="${obj.text_shopnow }" placeholder="text_shopnow" class="form-control" />
										<form:errors path="objItem.text_shopnow"
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