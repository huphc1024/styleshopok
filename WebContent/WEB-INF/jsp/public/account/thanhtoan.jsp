<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="content" class="col-sm-9">
	<h1>Thanh toán</h1>
	<div class="panel-group" id="accordion">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h4 class="panel-title">
					<a href="#collapse-payment-address" data-toggle="collapse"
						data-parent="#accordion" class="accordion-toggle collapsed">
						Xác nhận đơn hàng <i class="fa fa-caret-down"></i>
					</a>
				</h4>
			</div>
			<div class="panel-collapse collapse in" id="collapse-payment-method"
				style="height: auto;">
				<div class="panel-body">
					<p>Vui lòng lựa chọn phương thức thanh toán yêu thích cho đơn
						hàng.</p>
					<div class="radio">
						<c:choose>
							<c:when test="${objCus == null }">
								<c:set value="${cid }" var="cid"></c:set>
							</c:when>
							<c:otherwise>
								<c:set value="${objCus.id_customer }" var="cid"></c:set>
							</c:otherwise>
						</c:choose>

						<form
							action="${pageContext.request.contextPath }/thanh-toan/${cid }"
							method="post" id="thanhtoan">
							<label> <input type="radio" name="giaohang" value="cod"
								checked="checked"> Thu tiền tại nhà (COD)
							</label>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left">Tên sản phẩm</td>
							<td class="text-right">Số lượng</td>
							<td class="text-right">Đơn giá</td>
							<td class="text-right">Tổng tiền</td>
						</tr>
					</thead>
					<tbody>
						<c:set value="0" var="tong"></c:set>
						<c:forEach items="${listCart }" var="cart">
							<tr>
								<td class="text-left"><a
									href="${pageContext.request.contextPath }/${slugUtils.toSlug(cart.name)}-${cart.id_product}.html">${cart.name }</a></td>

								<td class="text-right cart-number">${cart.num }</td>
								<c:choose>
									<c:when test="${cart.gia_sale  == 0}">
										<td class="text-right"><fmt:formatNumber type="number"
												pattern="###,###" value="${cart.gia }" /> đ</td>
									</c:when>
									<c:otherwise>
										<td class="text-right"><fmt:formatNumber type="number"
												pattern="###,###" value="${cart.gia_sale}" /> đ</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${cart.gia_sale  == 0}">
										<td class="text-right"><fmt:formatNumber type="number"
												pattern="###,###" value="${cart.gia * cart.num }" /> đ</td>
									</c:when>
									<c:otherwise>
										<td class="text-right"><fmt:formatNumber type="number"
												pattern="###,###" value="${cart.gia_sale * cart.num }" /> đ</td>
									</c:otherwise>
								</c:choose>
							</tr>
							<c:choose>
								<c:when test="${cart.gia_sale  == 0}">
									<c:set value="${tong + (cart.gia * cart.num)}" var="tong"></c:set>
								</c:when>
								<c:otherwise>
									<c:set value="${tong + (cart.gia_sale * cart.num)}" var="tong"></c:set>
								</c:otherwise>
							</c:choose>

						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="3" class="text-right"><strong>Thành
									tiền:</strong></td>
							<td class="text-right"><fmt:formatNumber type="number"
									pattern="###,###" value="${tong}" /> đ</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<div class="buttons">
				<div class="pull-right">
					<c:if test="${listCart.size() != 0 }">
						<input type="submit" data-toggle="tooltip"
							value="Xác nhận đơn hàng" form="thanhtoan"
							class="btn btn-primary" />
					</c:if>
					<c:if test="${listCart.size() == 0 }">
						<a href="${pageContext.request.contextPath }/">Mua hàng nào</a>
					</c:if>

				</div>

			</div>
			<script type="text/javascript">
			<!--
				
			//-->
			</script>
		</div>
	</div>

</div>
</div>