<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true"%>
<%@ include file="/static/commons/meta.jsp"%>
<%@ include file="/static/commons/header-bootstrap.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.slf4j.Logger,org.slf4j.LoggerFactory" %>
<%	
	//设置返回码200，避免浏览器自带的错误页面
	response.setStatus(200);
	//记录日志
	Logger logger = LoggerFactory.getLogger("500.jsp");
	logger.error(exception.getMessage(), exception);
%>


<!DOCTYPE html>
<html>
<head>
<title>500 - System Internal Error.</title>
</head>

<body>


			<div class="alert alert-danger">
				<button type="button" class="close" data-dismiss="alert">
					<i class="icon-remove"></i>
				</button>

				<strong> <i class="icon-remove"></i> Exception:
				</strong> 500 - System Internal Error. <br />
			</div>


</body>
</html>
