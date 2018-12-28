<div class="page-header">
	<div class="container-fluid">
		<div class="pull-right">
			<a
				href="${pageContext.request.contextPath }/admincp/info/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-information').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Thông tin</h1>
		<ul class="breadcrumb">
			<li><a
				href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/info">Thông
					tin</a></li>
		</ul>
	</div>
</div>
<div class="container-fluid">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				<i class="fa fa-list"></i> Danh sách
			</h3>
		</div>
		<div class="panel-body">
			<form
				action="${pageContext.request.contextPath }/admincp/info/add/delete&amp;token=04I9lImi3pNPL5gnXWYRbx51rhDC3k9Y"
				method="post" enctype="multipart/form-data" id="form-information">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><a
									href=""
									>Tiêu đề</a></td>
								<td class="text-right"><a
									href="">Thứ
										tự</a></td>
								<td class="text-right">Hành động</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected[]" value="3" /></td>
								<td class="text-left">Chính sách bảo mật</td>
								<td class="text-right">3</td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/info/edit"
									data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
										class="fa fa-pencil"></i></a></td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected[]" value="6" /></td>
								<td class="text-left">Thông tin giao hàng</td>
								<td class="text-right">2</td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/info/edit"
									data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
										class="fa fa-pencil"></i></a></td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected[]" value="4" /></td>
								<td class="text-left">Về chúng tôi</td>
								<td class="text-right">1</td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/info/edit"
									data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
										class="fa fa-pencil"></i></a></td>
							</tr>
							<tr>
								<td class="text-center"><input type="checkbox"
									name="selected[]" value="5" /></td>
								<td class="text-left">Điều khoản &amp; Điều kiện</td>
								<td class="text-right">4</td>
								<td class="text-right"><a
									href="${pageContext.request.contextPath }/admincp/info/edit"
									data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
										class="fa fa-pencil"></i></a></td>
							</tr>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"></div>
				<div class="col-sm-6 text-right">Hiển thị từ 1 đến 4 của 4 (1
					Trang)</div>
			</div>
		</div>
	</div>
</div>
