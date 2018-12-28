<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div id="content" class="col-sm-9">
	<h2>Thông tin Đơn hàng</h2>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<td class="text-left" colspan="2">Chi tiết Đơn hàng</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text-left" style="width: 50%;"><b>ID Đơn hàng:</b>
					 ${listOrdersDetails.get(0).id_orders }<br /> <b>Ngày tạo:</b> ${listOrdersDetails.get(0).date_create }</td>
				<td class="text-left" style="width: 50%;"><b>Phương thức
						Thanh toán:</b> ${listOrdersDetails.get(0).giaohang }
			</tr>
		</tbody>
	</table>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<td class="text-left" style="width: 50%; vertical-align: top;">Địa
					chỉ Giao Hàng</td>

			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text-left">${listOrdersDetails.get(0).andress }</td>

			</tr>
		</tbody>
	</table>
	<div class="table-responsive">
		<table class="table table-bordered table-hover">
			<thead>
				<tr>
					<td class="text-left">Tên sản phẩm</td>
					<td class="text-right">Số lượng</td>
					<td class="text-right">Giá</td>
					<td class="text-right">Tổng số</td>
					<td style="width: 40px;"></td>
				</tr>
			</thead>
			<tbody>
				<c:set value="0" var="tong"></c:set>
				<c:forEach items="${listOrdersDetails }" var="cart">
					<tr>
						<input type="hidden" value="${cart.name }" name="id" />
						<td class="text-left"><a
							href="${pageContext.request.contextPath }/${slugUtils.toSlug(cart.name)}-${cart.id_product}.html">${cart.name }</a></td>

						<td class="text-right cart-number">${cart.soluong }</td>

						<td class="text-right"><fmt:formatNumber type="number"
								pattern="###,###" value="${cart.gia }" /> đ</td>

						<td class="text-right" ><fmt:formatNumber
								type="number" pattern="###,###" value="${cart.gia * cart.soluong }" />
							đ</td>

						<td></td>	
					</tr>
							<c:set value="${tong + (cart.gia * cart.soluong)}" var="tong"></c:set>
						
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="3"></td>
					<td class="text-right"><b>Thành tiền</b></td>
					<td class="text-right"><fmt:formatNumber type="number"
								pattern="###,###" value="${tong }" /> đ</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<h3>Lịch sử Đơn hàng</h3>
	<table class="table table-bordered table-hover">
		<thead>
			<tr>
				<td class="text-left">Trạng thái</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="text-left"> ${listOrdersDetails.get(0).active}</td>
			</tr>
		</tbody>
	</table>
	<div class="buttons clearfix">
		<div class="pull-right">
			<a href="${pageContext.request.contextPath }/"
				class="btn btn-primary">Tiếp tục</a>
		</div>
	</div>
</div>
</div>
</div>
