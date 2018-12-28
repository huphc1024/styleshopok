<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div class="page-header">
	<div class="container-fluid">
	<c:if test="${ not empty msg }">
			<div class="alert alert-success">
				<i class="fa fa-check-circle"></i>${msg }
				<button type="button" class="close" data-dismiss="alert">×</button>
			</div>
		</c:if>
		<div class="pull-right">
			<a
				href="${pageContext.request.contextPath }/admincp/account/customer/add"
				data-toggle="tooltip" title="Thêm" class="btn btn-primary"><i
				class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="Xóa"
				class="btn btn-danger"
				onclick="confirm('Bạn có Chắc chắn?') ? $('#form-customer').submit() : false;">
				<i class="fa fa-trash-o"></i>
			</button>
		</div>
		<h1>Khách hàng</h1>
		<ul class="breadcrumb">
			<li><a href="${pageContext.request.contextPath }/admincp">Trang
					chủ</a></li>
			<li><a
				href="${pageContext.request.contextPath }/admincp/account/customer">Khách
					hàng</a></li>
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
			<!-- <div class="well">
				<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label class="control-label" for="input-name">Tên khách
								hàng</label> <input type="text" name="filter_name" value=""
								placeholder="Tên khách hàng" id="input-name"
								class="form-control" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label class="control-label" for="input-email">Email</label> <input
								type="text" name="filter_email" value="" placeholder="Email"
								id="input-email" class="form-control" />
						</div>
						<button type="button" id="button-filter"
							class="btn btn-primary pull-right">
							<i class="fa fa-filter"></i> Lọc
						</button>
					</div>
				</div>
			</div> -->
			<form action="${pageContext.request.contextPath }/admincp/account/customer/del" method="post" enctype="multipart/form-data"
				id="form-customer">
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td style="width: 1px;" class="text-center"><input
									type="checkbox"
									onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
								<td class="text-left"><a >Tên khách
										hàng</a></td>
								<td class="text-left"><a>Email</a></td>
								<td class="text-left"><a>Telephone</a></td>
								<td class="text-right">Thao tác</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${listCustomer }" var="objCus">
								<tr>
									<td class="text-center"><input type="checkbox"
										name="selected" value="${objCus.id_customer }" /></td>
									<td class="text-left">${objCus.ho } ${objCus.ten }</td>
									<td class="text-left">${objCus.email }</td>
									<td class="text-left">${objCus.telephone }</td>
									<td class="text-right"><c:choose>
											<c:when test="${objCus.active == 1 }">
												<div class="btn-group" data-toggle="tooltip"
													title="button_login">
													<button type="button" class="btn btn-info dropdown-toggle">
														<i class="fa fa-lock"></i>
													</button>
												</div>
											</c:when>
											<c:otherwise>
												<button type="button" class="btn btn-warning">
											<i class="fa fa-unlock"></i>
										</button>
											</c:otherwise>
										</c:choose>

										 
										<a href="${pageContext.request.contextPath }/admincp/account/customer/edit/${objCus.id_customer}"
										data-toggle="tooltip" title="Sửa" class="btn btn-primary"><i
											class="fa fa-pencil"></i></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</form>
			<div class="row">
				<div class="col-sm-6 text-left"></div>
				<div class="col-sm-6 text-right">Hiển thị từ 1 đến 3 của 3 (1
					Trang)</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	<!--
		$('.date').datetimepicker({
			pickTime : false
		});
	//-->
	</script>