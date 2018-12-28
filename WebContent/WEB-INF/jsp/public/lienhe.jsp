<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="content" class="col-sm-9">
	<h1>Liên hệ với chúng tôi</h1>
	<h3>Địa chỉ của chúng tôi</h3>
	<div class="panel panel-default">
		<div class="panel-body">
			<div class="row">
				<div>
					<strong>Styleshop</strong><br />
					<address>K117/4 Nguyễn Lương Bằng, Liên Chiểu, Đà Nẵng</address>
				</div>
				<div class="col-sm-3">
					<strong>Điện thoại</strong><br /> 0965 700 720<br /> <br />
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
	</div>
	<form action="${pageContext.request.contextPath }/lien-he"
		method="post" class="form-horizontal">
		<fieldset>
			<legend>Thông tin liên hệ</legend>
			<c:if test="${not empty msg }">
					<p style="color: red; font-weight: bold; font-size: 20px;">${msg }</p>

			</c:if>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-name">Tên
					của bạn</label>
				<div class="col-sm-10">
					<input type="text" name="name" value="${objLH.name }"
						id="input-name" class="form-control" />
					<form:errors path="objLH.name"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>

			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-email">Địa
					chỉ Email</label>
				<div class="col-sm-10">
					<input type="text" name="email" value="${objLH.email}"
						id="input-email" class="form-control" />
					<form:errors path="objLH.email"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>

			</div>
			<div class="form-group required">
				<label class="col-sm-2 control-label" for="input-enquiry">Nội
					dung</label>
				<div class="col-sm-10">
					<textarea name="noidung" rows="10" id="input-enquiry"
						class="form-control">${objLH.noidung}</textarea>
					<form:errors path="objLH.noidung"
						cssStyle="color:red; font-style:italic;"></form:errors>
				</div>

			</div>
		</fieldset>
		<div class="buttons">
			<div class="pull-right">
				<input class="btn btn-primary" type="submit" value="Gửi đi" />
			</div>
		</div>
	</form>
</div>
