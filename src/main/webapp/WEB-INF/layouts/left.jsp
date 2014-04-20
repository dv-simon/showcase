<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>


				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					

				<!--  
					<div class="sidebar-shortcuts" id="sidebar-shortcuts">
						<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
							<button class="btn btn-success">
								<i class="icon-signal"></i>
							</button>

							<button class="btn btn-info">
								<i class="icon-pencil"></i>
							</button>

							<button class="btn btn-warning">
								<i class="icon-group"></i>
							</button>

							<button class="btn btn-danger">
								<i class="icon-cogs"></i>
							</button>
						</div>

						<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
							<span class="btn btn-success"></span>

							<span class="btn btn-info"></span>

							<span class="btn btn-warning"></span>

							<span class="btn btn-danger"></span>
						</div>
					</div>--><!-- #sidebar-shortcuts -->
					
				<!-- 左menu缩进  ： Start -->	
				<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
				</div>	
				<!-- 左menu缩进  ： End -->	
				
				<ul class="nav nav-list">
				
						<!-- ================= Level-1 item ================= -->
						<li id="dashboard">
							<a href="${ctx}/app/view/index?item=dashboard">
								<i class="icon-dashboard"></i>
								<span class="menu-text"> Dashboard </span>
							</a>
						</li>
						<!-- ================= Level-1 item ================= -->
						
						
						<!-- ================= Level-1 item ================= -->
						<li id="account">
							<a href="#" class="dropdown-toggle">
								<i class="icon-group"></i>
								<span class="menu-text">Account</span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li id="userAccount">
									<a href="${ctx}/app/view/user?item=account&subItem=userAccount">
										<i class="icon-double-angle-right"></i>
										User Account
									</a>
								</li>

								<li id="userRole">
									<a href="${ctx}/app/view/role?item=account&subItem=userRole">
										<i class="icon-double-angle-right"></i>
										User Role
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						
						
						<!-- ================= Level-1 item ================= -->
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> Function2 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function1
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function2
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						
												<!-- ================= Level-1 item ================= -->
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> Function3 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function1
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function2
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						
						
						<!-- ================= Level-1 item ================= -->
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> Function4 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function1
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function2
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						
						
						<!-- ================= Level-1 item ================= -->
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> Function5 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function1
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function2
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						
						<!-- ================= Level-1 item ================= -->
						<li>
							<a href="#" class="dropdown-toggle">
								<i class="icon-desktop"></i>
								<span class="menu-text"> Function6 </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function1
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-double-angle-right"></i>
										Sub Function2
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						
						<!-- ================= Level-1 item ================= -->
						<li id="systemLog">
							<a href="#" class="dropdown-toggle">
								<i class="icon-exchange"></i>
								<span class="menu-text"> System Log </span>

								<b class="arrow icon-angle-down"></b>
							</a>

							<ul class="submenu">
								<li id="actionLog">
									<a href="${ctx}/app/view/actionLog?item=systemLog&subItem=actionLog">
										<i class="icon-double-angle-right"></i>
										Action Log
									</a>
								</li>
							</ul>
						</li>
						<!-- ================= Level-1 item ================= -->
						

						<li>
							<a href="${ctx}/app/logout">
								<i class="icon-unlock"></i>
								<span class="menu-text"> Logout </span>
							</a>
						</li>
						
						
						
					</ul><!-- /.nav-list -->

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}

						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
						
						
						
					</script>
					
										
					<script type="text/javascript">
					$("#${item}").addClass("active open");
					$("#${subItem}").addClass("active");
					
				
					</script>

				</div>
				
				