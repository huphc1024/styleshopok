<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<tiles:insertAttribute name="header"></tiles:insertAttribute>
		<tiles:insertAttribute name="left-bar"></tiles:insertAttribute>
		<div id="content">
			<tiles:insertAttribute name="content"></tiles:insertAttribute>
			</div>
		</div>
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</div>
</body>
</html>
