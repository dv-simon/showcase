<%@ page contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ page import="org.apache.shiro.authc.LockedAccountException "%>
<%@ page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="org.apache.shiro.subject.Subject"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<%@ include file="/static/commons/meta.jsp"%>
<%@ include file="/static/commons/jstl-taglibs.jsp"%>
<%@ include file="/static/commons/header-bootstrap.jsp"%>	

</head>

<%
//判断如果已经登录则直接重定向到 homepage
		Subject currentUser = SecurityUtils.getSubject();
		if (currentUser != null && currentUser.isAuthenticated()) {
			//isAuthenticated = true;
			response.sendRedirect("/app/view/index?item=dashboard");
		}
%>

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
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="icon-coffee green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>

											<form id="loginForm" action="${ctx}/app/login" method="post">
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="username" name="username" class="form-control" placeholder="Username" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password"  id="password" name="password" class="form-control" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">
														<label class="inline">
															<input type="checkbox" id="rememberMe" name="rememberMe" class="ace"/>
															<span class="lbl"> Remember Me</span>
														</label>

														<button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
															<i class="icon-key"></i>
															Login
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="icon-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="icon-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="icon-google-plus"></i>
												</a>
											</div>
										</div><!-- /widget-main -->

										<div class="toolbar clearfix">
											<div>
												<a href="#" onclick="show_box('forgot-box'); return false;" class="forgot-password-link">
													<i class="icon-arrow-left"></i>
													I forgot my password
												</a>
											</div>

										<div>
												<!--  <a href="#" onclick="show_box('signup-box'); return false;" class="user-signup-link">
													I want to register
													<i class="icon-arrow-right"></i>
												</a>-->
											</div>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /login-box -->

								<div id="forgot-box" class="forgot-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header red lighter bigger">
												<i class="icon-key"></i>
												Retrieve Password
											</h4>

											<div class="space-6"></div>
											<p>
												Enter your email and to receive instructions
											</p>

											<form id="forgotPasswordForm" action="${ctx}/app/forgotPassword" method="post" onkeypress="javascript:return NoSubmit(event);" >
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="email" name="email" type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
													</label>

													<div class="clearfix">
														<button type="button" onclick="forgotPassword()" class="width-35 pull-right btn btn-sm btn-danger">
															<i class="icon-lightbulb"></i>
															Send Me!
														</button>
													</div>
												</fieldset>
											</form>
										</div><!-- /widget-main -->

										<div class="toolbar center">
											<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
												Back to login
												<i class="icon-arrow-right"></i>
											</a>
										</div>
									</div><!-- /widget-body -->
								</div><!-- /forgot-box -->

								<div id="signup-box" class="signup-box widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header green lighter bigger">
												<i class="icon-group blue"></i>
												New User Registration
											</h4>

											<div class="space-6"></div>
											<p> Enter your details to begin: </p>

											<form>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="icon-envelope"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="Username" />
															<i class="icon-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Password" />
															<i class="icon-lock"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="Repeat password" />
															<i class="icon-retweet"></i>
														</span>
													</label>

													<label class="block">
														<input type="checkbox" class="ace" />
														<span class="lbl">
															I accept the
															<a href="#">User Agreement</a>
														</span>
													</label>

													<div class="space-24"></div>

													<div class="clearfix">
														<button type="reset" class="width-30 pull-left btn btn-sm">
															<i class="icon-refresh"></i>
															Reset
														</button>

														<button type="button" class="width-65 pull-right btn btn-sm btn-success">
															Register
															<i class="icon-arrow-right icon-on-right"></i>
														</button>
													</div>
												</fieldset>
											</form>
										</div>

										<div class="toolbar center">
											<a href="#" onclick="show_box('login-box'); return false;" class="back-to-login-link">
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

		
		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			function show_box(id) {
			 jQuery('.widget-box.visible').removeClass('visible');
			 jQuery('#'+id).addClass('visible');
			}
		</script>
		
	<%
	String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
	request.setAttribute("error", error);
	%>
	
	<c:if test="${!empty error}">
	
	<c:choose>
   	 <c:when test="${error eq 'org.apache.shiro.authc.UnknownAccountException'}">  
   	 	 <script> showAndDismissAlert('danger','icon-remove','Login Fails','Unknown User Account',2000); </script>
  	 </c:when>
   	 <c:when test="${error eq 'org.apache.shiro.authc.DisabledAccountException'}">  
   	 	 <script> showAndDismissAlert('danger','icon-remove','Login Fails','This account is locked.',2000); </script>
  	 </c:when>
  	 <c:when test="${error eq 'org.apache.shiro.authc.IncorrectCredentialsException'}">  
   	 	 <script>showAndDismissAlert('danger','icon-remove','Login Fails','Password is invaild!',2000);</script>
  	 </c:when>
   	<c:otherwise>  
   		<script>showAndDismissAlert('danger','icon-remove','Login Fails','',2000);</script>
   	</c:otherwise>
	</c:choose>

	</c:if>
	
	<c:if test="${!empty forgotPasswordError}">
	<c:choose>
  	 <c:when test="${forgotPasswordError eq 'token.inavaild'}">  
   	 	 <script>showAndDismissAlert('danger','icon-remove','Token expired','Can not continue to reset password.',4000);</script>
  	 </c:when>
   	<c:otherwise>  
   		<script>showAndDismissAlert('danger','icon-remove','System Error','',2000);</script>
   	</c:otherwise>
	</c:choose>

	</c:if>
		
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
			   resetForm: true,          //成功提交后，重置所有表单元素的值
			   timeout: 5000               //限制请求的时间，当请求大于3秒后，跳出请求
				}
				
	function processResponse(data){
		if(data.success == true){
			showAndDismissAlert('success','icon-ok',data.message,'',4000);
			show_box('login-box'); return false;
		}else{			
			showAndDismissAlert('danger','icon-remove',data.message,'',3000);
		}
	}

	function forgotPassword() {
		$("#forgotPasswordForm").ajaxSubmit(options);
	} 
	
	</script>
	<script src="${ctx}/static/js/cft-commons-custom-form-1.0.js"></script>
</html>