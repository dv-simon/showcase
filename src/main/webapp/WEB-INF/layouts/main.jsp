<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator"%>

<!DOCTYPE html>
<html>
<head>
<title><sitemesh:title /></title>
<%@ include file="/static/commons/meta.jsp"%>
<%@ include file="/static/commons/spring-taglibs.jsp"%>
<%@ include file="/static/commons/jstl-taglibs.jsp"%>
<%@ include file="/static/commons/header-bootstrap.jsp"%>	

<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@page import="java.util.Date"%>
</head>


<body>
	<!-- ===================  header  ============================== -->
	<%@ include file="/WEB-INF/layouts/header.jsp"%>


	<!-- ====================  Body container  ===================== -->
	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">

			<!-- ===================  Body : Left  ================= -->
			<%@ include file="/WEB-INF/layouts/left.jsp"%>


			<!-- ===================  Body : Center  =============== -->
			<sitemesh:body />

			<%@ include file="/WEB-INF/layouts/float-settings.jsp"%>

		</div>
	</div>

	<a href="#" id="btn-scroll-up"
		class="btn-scroll-up btn btn-sm btn-inverse"> <i
		class="icon-double-angle-up icon-only bigger-110"></i>
	</a>

</body>
</html>