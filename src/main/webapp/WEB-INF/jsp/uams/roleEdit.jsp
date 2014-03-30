<%@ page language="java" pageEncoding="UTF-8" %>
<script src="/static/js/jquery.form.js"></script>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date"%>



<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header no-padding">
				<div class="table-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						<span class="white">&times;</span>
					</button>
					Edit User Role
				</div>
			</div>

			<div class="modal-body no-padding">

				<form:form method="post" action="${ctx}/app/api/v1/role"
					modelAttribute="roleForm" class="form-horizontal" role="form">
					
					<c:if test="${!empty roleForm.roleId}">
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">RoleId</label>

						<div class="col-sm-9">
							<form:input path="roleId" class="col-xs-10 col-sm-6 limited" maxlength="20" readonly="true"/>
						</div>
					</div>
					</c:if>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Role Name:</label>

						<div class="col-sm-9">
  						 		<form:input path="name" placeholder="name" class="col-xs-10 col-sm-6 limited" maxlength="20" />
						</div>
					</div>

					
					

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Permissions:</label>
						<div class="col-sm-9">
						<form:input path="permissions" id="form-field-role-tags" class="col-xs-10 col-sm-6" placeholder="Enter permission tags ..." />
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
				
				
			</div>

			<div class="modal-footer no-margin-top">
				<button class="btn btn-sm pull-left" data-dismiss="modal">
					<i class="icon-remove"></i>Close&nbsp;
				</button>
				<button class="btn btn-sm btn-info pull-right"
					onclick="saveRecord()" type="submit">
					<i class="icon-ok"></i>Submit
				</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
	
	<script type="text/javascript">
	

	
	/********** Ajax Form Script Start ************/
	
	var options = {
			   //target: '#output',          //把服务器返回的内容放入id为output的元素中    
			   beforeSubmit: beforeSubmit,  //提交前的回调函数
			   success: processResponse,      //提交后的回调函数
			   dataType:'json',			   //html(默认), xml, script, json...接受服务端返回的类型
			   //clearForm: true,          //成功提交后，清除所有表单元素的值
			   //resetForm: true,          //成功提交后，重置所有表单元素的值
			   timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求
				}	
	
	function beforeSubmit(formData, jqForm, options){
		   //formData: 数组对象，提交表单时，Form插件会以Ajax方式自动提交这些数据，格式如：[{name:user,value:val },{name:pwd,value:pwd}]
		   //jqForm:   jQuery对象，封装了表单的元素   
		   //options:  options对象
		  // var queryString = $.param(formData);   //name=1&address=2
		  // var formElement = jqForm[0];              //将jqForm转换为DOM对象
		  // var loginName = formElement.loginName.value;  //访问jqForm的DOM元素
		   return true; 
	};
	
	function processResponse(data){
		if(data.success == true){
			showAndDismissAlert('success','icon-ok',data.message,'Refreshing DataGrid...',1000);
			$('#modal-roleEdit').modal('hide');		//隐藏遮罩层
			$("#listDataGrid").trigger("reloadGrid");  //重新刷新DataGrid
		}else{			
			showAndDismissAlert('danger','icon-remove',data.message,data.exceptionMsg,3600*1000);
		}
	}

	function saveRecord() {
		$("#roleForm").ajaxSubmit(options);
	} 

	//Role Permission Tags
	$(function($) {
		var role_tag_input = $('#form-field-role-tags');
		if(! ( /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase())) ) 
		{
			role_tag_input.tag(
			  {
				placeholder:role_tag_input.attr('placeholder'),
				source: ace.variable_ROLE_TAGS,//defined in ace.js >> ace.enable_search_ahead
			  }
			);
		}
		else {
			role_tag_input.after('<textarea id="'+role_tag_input.attr('id')+'" name="'+role_tag_input.attr('name')+'" rows="3">'+role_tag_input.val()+'</textarea>').remove();
		}
	});

	$(function($) {
		ace.variable_ROLE_TAGS = [ "sc:user:read","sc:user:create", "sc:user:update", "sc:user:delete", 
		                           "sc:role:read","sc:role:create", "sc:role:update", "sc:role:delete"];
		try {
			a("#nav-search-input").typeahead({
				source : ace.variable_ROLE_TAGS,
				updater : function(c) {
					a("#nav-search-input").focus();
					return c;
				}
			});
		} catch (b) {
		}
	});
	
</script>
<script src="${ctx}/static/js/cft-commons-custom-form-1.0.js"></script>
