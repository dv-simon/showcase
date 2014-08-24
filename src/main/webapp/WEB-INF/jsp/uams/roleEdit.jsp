<%@ page language="java" pageEncoding="UTF-8" %>
<script src="/static/js/jquery.form.js"></script>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
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
							<form:input path="roleId" class="col-xs-10 col-sm-8 limited" maxlength="20" readonly="true"/>
						</div>
					</div>
					</c:if>
					
					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Role Name:</label>

						<div class="col-sm-9">
  						 		<form:input path="name" placeholder="name" class="col-xs-10 col-sm-8 limited" maxlength="20"/>
						</div>
					</div>

				<div class="space-4"></div>
			    <div class="form-group">
				    
				    <form:input path="permissions" type="hidden" id="form-field-role-tags"/>
				    
				    	<label class="col-sm-3 control-label no-padding-right">Permissions:</label>
				    	<div class="col-sm-9" style="width:52%">
							<div class="widget-box">
							    <div class="widget-header header-color-blue2">
							        <h5 class="lighter smaller">
							            Choose Permissions
							        </h5>
							    </div>
							    <div class="widget-body">
							        <div class="widget-main padding-8">
							            <div id="treePermissions" class="tree tree-selectable">
							               
							                <!-- =========Account========= -->	
							                <div class="tree-folder" style="display: block;">
							                    <div class="tree-folder-header">
							                        <i class="icon-plus">
							                        </i>
							                        <div class="tree-folder-name">
							                            Account
							                        </div>
							                    </div>
							                    <div class="tree-folder-content" style="display: none;">
							                      <div class="tree-item" style="display: block;">
							                            <i class="icon-remove">
							                            </i>
							                            <div class="tree-item-name">
							                                User:Read
							                            </div>
							                        </div>
							                      <div class="tree-item" style="display: block;">
							                            <i class="icon-remove">
							                            </i>
							                            <div class="tree-item-name">
							                                User:Edit
							                            </div>
							                        </div>		
							                        <div class="tree-item" style="display: block;">
							                            <i class="icon-remove">
							                            </i>
							                            <div class="tree-item-name">
							                                Role:Read
							                            </div>
							                        </div>
							                      <div class="tree-item" style="display: block;">
							                            <i class="icon-remove">
							                            </i>
							                            <div class="tree-item-name">
							                                Role:Edit
							                            </div>
							                        </div>								                        							                        							                        
							                    </div>
							                </div>
							                
							                 <!-- =========System========= -->	
							                <div class="tree-folder" style="display: block;">
							                    <div class="tree-folder-header">
							                        <i class="icon-plus">
							                        </i>
							                        <div class="tree-folder-name">
							                            System
							                        </div>
							                    </div>
							                    <div class="tree-folder-content" style="display: none;">
							                        <div class="tree-item" style="display: block;">
							                            <i class="icon-remove">
							                            </i>
							                            <div class="tree-item-name">
							                                SystemConfig:Read
							                            </div>
							                        </div>
							                        <div class="tree-item" style="display: block;">
							                            <i class="icon-remove">
							                            </i>
							                            <div class="tree-item-name">
							                                SystemConfig:Edit
							                            </div>
							                        </div>							                        							                        							                        
							                    </div>
							                </div>
							               					                						               							                
							            </div>							            
							        </div>
							    </div>
							</div>
						</div>						    	
				    </div>	
					
					
					<div class="space-4"></div>
					<div class="form-group">

						<label class="col-sm-3 control-label no-padding-right">Status:</label>
						<div class="col-sm-9">
							<form:select path="status" items="${statusMap}" class="col-xs-10 col-sm-8" />
						</div>
					</div>

					<div class="space-4"></div>
					<div class="form-group">
						<label class="col-sm-3 control-label no-padding-right">Remark:</label>
						<div class="col-sm-9">
							<form:textarea path="remark" class="col-xs-10 col-sm-8 limited" maxlength="50"/>
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
		
		//保存treePermissions已选的值
		var treePer = $("#treePermissions").find(".tree-item-name");
		var treePerVal = "";
		$.each(treePer,function(i){
			if ($(treePer[i]).prev().attr("class") == "icon-ok"){
				treePerVal = treePerVal + $(treePer[i]).text().trim() + ",";	
			}				
		});
		treePerVal = treePerVal.substring(0,treePerVal.length-1);
		$("#form-field-role-tags").val(treePerVal);
		
		$("#roleForm").ajaxSubmit(options);
	} 


	//初始化显示页面role select的值
	$(function($) {		

		//已选的permissions的值
		var selVal = '${roleForm.permissions}';
		var nameSels = selVal.split(",");
		
		//显示已选的permissions
		var treePer = $("#treePermissions").find(".tree-item-name");
		$.each(treePer,function(i){
			var treePerVal = $(treePer[i]).text().trim();
			$.each(nameSels,function(j){
				if(treePerVal == nameSels[j]){					
					$(treePer[i]).parent().addClass("tree-selected");
					$(treePer[i]).prev().removeClass("icon-remove").addClass("icon-ok");
					$(treePer[i]).parent().parent().css("display","block");
					$(treePer[i]).parent().parent().prev().find("i").removeClass("icon-plus").addClass("icon-minus");
				}
			});
		});
		
		//绑定树第一标题点击事件
		$("#treePermissions").find(".tree-folder-header").each(function(){
			$(this).click(function(){
				$(this).find("i").toggleClass("icon-plus").toggleClass("icon-minus");
				$(this).next().toggle();
			});
		});
		
		//绑定树第二标题点击事件
		$("#treePermissions").find(".tree-folder-content").children().each(function(){
			$(this).click(function(){
				$(this).find("i").toggleClass("icon-ok").toggleClass("icon-remove");
				$(this).find("i").parent().toggleClass("tree-selected");
			});
		});
		
	});
</script>
<script src="${ctx}/static/js/cft-commons-custom-form-1.0.js"></script>
