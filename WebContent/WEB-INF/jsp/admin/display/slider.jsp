<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div class="page-header">
	<div class="container-fluid">
	<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i>${msg }
				<button type="button" class="close" data-dismiss="alert">×</button>
			</div>
		</c:if>
		<div class="pull-right">
			<a href="${pageContext.request.contextPath }/admincp/display/slider/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-product').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Sản phẩm</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/display/slider">Slider</a></li>
		</ul>
	</div>
</div>
<!-- End div#page-header -->

<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-list"></i> Danh sách
			</h3>
		</div>
			<form
				action="${pageContext.request.contextPath }/admincp/display/slider/del"
				method="post" enctype="multipart/form-data" id="form-product">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" />
								</td>
								<td class="text-center">Hình ảnh</td>
								<td class="text-left"><a href="">Text1</a></td>
								<td class="text-right"><a href="">Text2</a></td>
								<td class="text-right"><a href="">Text3</a></td>
								<td class="text-center"><a href="">Text_ShopNow</a></td>
								<td class="text-center">Hành động</td>
							</tr>
						</thead>
						<tbody>
						`	<c:forEach items="${listSlider }" var="obj">
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected" value="${obj.id_slider }" /></td>
								<td class="text-center"><img width="200px" height="150px"
									src="${pageContext.request.contextPath }/files/${obj.picture}"
									alt="" class="img-thumbnail" />
								</td>
								<td class="text-left">${obj.text1 } </td>
								<td class="text-right">
									<div class="text-danger">${obj.text2 }</div></td>
								<td class="text-right"><span class="label label-success">${obj.text3 }</span>
								</td>
								<td class="text-center"><span class="text_enabled">${obj.text_shopnow }</span>
								</td>
								<td class="text-center" style="max-width: 150px;">
									<!-- Button trigger modal -->
									 <a
									href="${pageContext.request.contextPath }/admincp/display/slider/edit/${obj.id_slider }"
									data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
										class="fa fa-pencil"></i> <span class="hidden-xs">Sửa</span></a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>



