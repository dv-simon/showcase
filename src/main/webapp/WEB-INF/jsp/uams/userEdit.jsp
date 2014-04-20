<%@ page language="java" pageEncoding="UTF-8" %>
<script src="/static/js/jquery.form.js"></script>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />


<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<span class="white">&times;</span>
					</button>
					 Edit User Account
				</div>
			</div>

			<div class="modal-body no-padding">

	
				
				<div class="tabbable">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab" href="#userInfo"> <i
								class="green icon-user bigger-110"></i> User Info
						</a></li>

						<c:if test="${!empty userForm.userId}">
						<li><a data-toggle="tab" href="#changeUserPassword"> 
						<i class="blue icon-key bigger-110"></i>
						Change Password
						</a></li>
						</c:if>
					</ul>

					<div class="tab-content">
						<div id="userInfo" class="tab-pane in active">
							
				<form:form method="post" action="${ctx}/app/api/v1/user"
					modelAttribute="userForm" class="form-horizontal" role="form">
					
					<c:if test="${!empty userForm.userId}">
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">UserId:</label>

						<div class="col-sm-9">
							<form:input path="userId" class="col-xs-10 col-sm-6 limited" maxlength="20" readonly="true"/>
						</div>
					</div>
					</c:if>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">LoginName:</label>

						<div class="col-sm-9">
						<c:choose>
   							<c:when test="${!empty userForm.userId}">    
   								<form:input path="loginName" placeholder="loginName" class="col-xs-10 col-sm-6 limited" maxlength="20" readonly="true"/>
   							</c:when>
   
  						 	<c:otherwise>  
  						 		<form:input path="loginName" placeholder="loginName" class="col-xs-10 col-sm-6 limited" maxlength="20" />
   							</c:otherwise>
						</c:choose>
							
						</div>
					</div>

					<c:if test="${empty userForm.userId}">
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Password:</label>
						<div class="col-sm-9">
							<form:input path="plainPassword" type="password" placeholder="password" class="col-xs-10 col-sm-6" maxlength="20" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">
							Confirm Password:</label>
						<div class="col-sm-9">
							<form:input path="password" type="password"
								placeholder="repet password" class="col-xs-10 col-sm-6"
								maxlength="20" />
						</div>
					</div>
					</c:if>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Name:</label>
						<div class="col-sm-9">
							<form:input path="name" placeholder="Staff Name" class="col-xs-10 col-sm-6" maxlength="20" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Roles:</label>

						<div class="col-sm-9">
							<form:select multiple="true" path="roleList"
								class="col-xs-10 col-sm-6 chosen-select tag-input-style"
								data-placeholder="  Choose User Role...">
								<form:options items="${roleList}" itemLabel="name" itemValue="roleId" />
							</form:select>

						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Email:</label>
						<div class="col-sm-9">
							<form:input path="email" placeholder="@mail.com" class="col-xs-10 col-sm-6" maxlength="30" />
						</div>
					</div>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Phone:</label>
						<div class="col-sm-9">
							<form:input path="phone" placeholder="" class="input-mask-phone col-xs-10 col-sm-6" maxlength="20" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Office:</label>
						<div class="col-sm-9">
							<form:input path="office" placeholder="" class="col-xs-10 col-sm-6" maxlength="20" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Department:</label>
						<div class="col-sm-9">
							<form:input path="dept" placeholder="" class="col-xs-10 col-sm-6" maxlength="20" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Language:</label>
						<div class="col-sm-9">
							<form:select path="language" items="${languageMap}" class="col-xs-10 col-sm-6" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">

						<label class="col-sm-3 control-label no-padding-right">Status:</label>
						<div class="col-sm-9">
							<form:select path="status" items="${statusMap}" class="col-xs-10 col-sm-6" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Remark:</label>
						<div class="col-sm-9">
							<form:textarea path="remark" class="col-xs-10 col-sm-6 limited" maxlength="50"/>
						</div>
					</div>
				</form:form>
							
							<div class="modal-footer no-margin-top ">
							<button class="btn btn-sm pull-left" data-dismiss="modal">
								<i class="icon-remove"></i>Close&nbsp;
							</button>
							<button class="btn btn-sm btn-info pull-right" onclick="saveRecord()" type="submit">
							<i class="icon-ok"></i>Submit
							</button>
							</div>
						</div>

				<c:if test="${!empty userForm.userId}">
				<div id="changeUserPassword" class="tab-pane">
					<form:form method="post" action="${ctx}/app/api/v1/changeUserPassword"
					modelAttribute="passwordForm" class="form-horizontal" role="form">
					
					<form:hidden path="userId"/>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">New Password:</label>
						<div class="col-sm-9">
							<input name="plainPassword" type="password" placeholder="password" class="col-xs-10 col-sm-6" maxlength="20" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">
							Confirm Password:</label>
						<div class="col-sm-9">
							<input name="password" type="password"
								placeholder="repet password" class="col-xs-10 col-sm-6"
								maxlength="20" />
						</div>
					</div>

				</form:form>
							
							<div class="modal-footer no-margin-top ">
							<button class="btn btn-sm pull-left" data-dismiss="modal">
								<i class="icon-remove"></i>Close&nbsp;
							</button>
							<button class="btn btn-sm btn-info pull-right" onclick="changeUserPassword()" type="submit">
							<i class="icon-ok"></i>Submit
							</button>
							</div>
						</div>
						</c:if>
						
					</div>
				</div>
				
				
			</div>

			
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	
	<script type="text/javascript">

	/********** Ajax Form Script Start ************/
	
	var options = {
			   //target: '#output',          //把服务器返回的内容放入id为output的元素中    
			  // beforeSubmit: beforeSubmit,  //提交前的回调函数
			   success: processResponse,      //提交后的回调函数
			   dataType:'json',			   //html(默认), xml, script, json...接受服务端返回的类型
			   //url: url,                 //默认是form的action， 如果申明，则会覆盖
			   //type: type,               //默认是form的method（get or post），如果申明，则会覆盖   
			   //clearForm: true,          //成功提交后，清除所有表单元素的值
			   //resetForm: true,          //成功提交后，重置所有表单元素的值
			   timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求
				}	
	
	function beforeSubmit(formData, jqForm, options){
		   //formData: 数组对象，提交表单时，Form插件会以Ajax方式自动提交这些数据，格式如：[{name:user,value:val },{name:pwd,value:pwd}]
		   //jqForm:   jQuery对象，封装了表单的元素   
		   //options:  options对象
		   var queryString = $.param(formData);   //name=1&address=2
		   var formElement = jqForm[0];              //将jqForm转换为DOM对象
		  // var loginName = formElement.loginName.value;  //访问jqForm的DOM元素
		   return true;  //只要不返回false，表单都会提交,在这里可以对表单元素进行验证
	};
	
	function processResponse(data){
		if(data.success == true){
			showAndDismissAlert('success','icon-ok',data.message,'Refreshing DataGrid...',1000);
			$('#modal-userEdit').modal('hide');		//隐藏遮罩层
			$("#listDataGrid").trigger("reloadGrid");  //重新刷新DataGrid
		}else{			
			showAndDismissAlert('danger','icon-remove',data.message,data.exceptionMsg,3600*1000);
		}
	}

	function saveRecord() {
		$("#userForm").ajaxSubmit(options);
	} 
	
	function changeUserPassword() {
		$("#passwordForm").ajaxSubmit(options);
	} 

	$('.input-mask-phone').mask('(999) 9999-9999');
	/********** Ajax Form Script End ************/

</script>
<script src="${ctx}/static/js/cft-commons-custom-form-1.0.js"></script>