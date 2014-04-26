<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>Retrieve Password</title>
<%@ include file="/static/commons/meta.jsp"%>
<%@ include file="/static/commons/jstl-taglibs.jsp"%>
<%@ include file="/static/commons/header-bootstrap.jsp"%>	

</head>


<body class="login-layout">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="icon-leaf green"></i>
									<span class="red">cft-commons</span>
									<span class="white">showcase</span>
								</h1>
								<h4 class="blue">&copy; commons framework team</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">

								<div id="signup-box" class="signup-box widget-box visible no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="icon-group blue"></i>
												Reset Your Password
											</h4>

											<div class="space-6"></div>
											<p> Enter your new password: </p>

					<form:form method="post" action="${ctx}/app/resetPassword" modelAttribute="passwordForm" class="form-horizontal" role="form">
					
										<form:hidden path="userId"/>
					
										<input type="hidden" name="token" value="${token}" />
								
												<fieldset>
												<!-- 
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="your@email.com" readonly=""/>
															<i class="icon-envelope"></i>
														</span>
													</label>  -->
													
													
													
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<form:input path="loginName" class="form-control" placeholder="${loginName}" readonly="true" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input name="plainPassword" type="password" class="form-control" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input name="password" type="password" class="form-control" placeholder="Repeat password" />
															<i class="icon-retweet"></i>
														</span>
													</label>

													<!--  <label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label> -->

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="icon-refresh"></i>
															Reset
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success" onclick="resetPassword()">
															Submit
															<i class="icon-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form:form>
										</div>

										<div class="toolbar center">
											<a href="${ctx}/app/login" class="back-to-login-link">
												<i class="icon-arrow-left"></i>
												Back to login
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /signup-box -->
							</div><!-- /position-relative -->
						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div>
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		
		
	</body>
	<script type="text/javascript">
	
	var options = {
			   //target: '#output',          //把服务器返回的内容放入id为output的元素中    
			  // beforeSubmit: beforeSubmit,  //提交前的回调函数
			   success: processResponse,      //提交后的回调函数
			   dataType:'json',			   //html(默认), xml, script, json...接受服务端返回的类型
			   //url: url,                 //默认是form的action， 如果申明，则会覆盖
			   //type: type,               //默认是form的method（get or post），如果申明，则会覆盖   
			   //clearForm: true,          //成功提交后，清除所有表单元素的值
			   //resetForm: true,          //成功提交后，重置所有表单元素的值
			   timeout: 5000               //限制请求的时间，当请求大于3秒后，跳出请求
				}
				
	function processResponse(data){
		if(data.success == true){
			alertRedirect('success','icon-ok',data.message,'',5000, "/app/view/index?item=dashboard"); 
			
		}else{			
			showAndDismissAlert('danger','icon-remove',data.message,'',3000);
		}
	}

	function resetPassword() {
		$("#passwordForm").ajaxSubmit(options);
	} 
	
	</script>
	<script src="${ctx}/static/js/cft-commons-custom-form-1.0.js"></script>
</html>