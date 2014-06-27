<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

		<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-home"></i>
							cft-commons-showcase  (ver 0.9.0)
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
					
						<li class="grey">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="icon-book"></i>
							</a>

							<ul class="pull-right dropdown-navbar navbar-blue dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									Please select your language
								</li>
								<li>
									<a href="?lang=zh_TW">
										繁体中文
									</a>
								</li>

								<li>
									<a href="?lang=zh_CN">
										简体中文
									</a>
								</li>
								<li>
									<a href="?lang=en_US">
										<div class="clearfix">
											<span class="pull-left">
												English
											</span>
										</div>
									</a>
								</li>
							</ul>
						</li>
					
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="/static/images/icon_user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>Welcome,</small>
									<shiro:principal/> 
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="icon-cog"></i>
										Settings
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i>
										Profile
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="${ctx}/app/logout">
										<i class="icon-off"></i>
										Logout
									</a>
								</li>
							</ul>
							 
						</li>
					</ul><!-- /.ace-nav -->
				</div><!-- /.navbar-header -->
			</div><!-- /.container -->
		</div>
