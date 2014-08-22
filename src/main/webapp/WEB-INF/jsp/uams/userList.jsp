<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<title>User List</title>


<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">Home</a></li>

			<li><a href="#">Account</a></li>
			<li class="active">User Account</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
			
			<!-- ====================================== body start =============================================== -->
<!-- 			<div class="page-header">
							<h1>
								用户管理
								<small>
									<i class="icon-double-angle-right"></i>
									用户列表
								</small>
							</h1>
			</div> -->
			
			<table id="listDataGrid"></table>
			
			<div id="navBarDiv"></div>

			<!-- ====================================== body end ================================================= -->
			
			</div>
		</div>
	</div>
</div>


<!-- ====================================== User Edit Form =============================================== -->
<div id="modal-userEdit" class="modal fade" tabindex="-1"></div>






<script type="text/javascript">

jQuery("#listDataGrid").jqGrid({
   	url:'${ctx}/app/api/v1/user',
	datatype: "json",
	height: 330,
	autowidth: true,
	loadui: 'disable',
   	colNames:['Actions','UserId','LoginName', 'Name', 'Email','Phone','Office','Department','Language','Status','Remark'],
   	colModel:[
		{name:'act',index:'act', width:40,sortable:false,search:false},
   		{name:'userId',index:'userId', width:80,sortable:true},
   		{name:'loginName',index:'loginName', width:100},
   		{name:'name',index:'name', width:60},
   		{name:'email',index:'email', width:100, align:"center"},
   		{name:'phone',index:'phone', width:80, align:"center"},		
   		{name:'office',index:'office', width:50,align:"center"},		
   		{name:'dept',index:'dept', width:50,align:"center"},
   		{name:'language',index:'language', width:50,align:"center"},
   		{name:'status',index:'status', width:50,align:"center"},
   		{name:'remark',index:'remark', width:50,sortable:false}
   	],
   	rownumbers: true,
	rownumWidth: 40,
   	rowNum:10,
   	rowList:[10,20,30],
   	pager: '#navBarDiv',
   	sortname: 'userId',
    viewrecords: true,
    sortorder: "asc",
    altRows: true,
    multiselect: false,
	//multikey: "ctrlKey",
    multiboxonly: true,
    caption:"User Account List",
    
	loadComplete : function() {
			var table = this;
			setTimeout(function(){
				//styleCheckbox(table);
				//updateActionIcons(table);
				updatePagerIcons(table);
				//enableTooltips(table);
			}, 0);
		},
		gridComplete: function(){
			var ids = jQuery("#listDataGrid").jqGrid('getDataIDs');
			for(var i=0;i < ids.length;i++){
				var cl = ids[i];
				//va = "<span class='action-buttons'><a class='blue' href='#' onclick=\"viewRecord('"+cl+"');\"><i class='icon-zoom-in bigger-130'></i></a></span>&nbsp;"; 
				ua = "<span class='action-buttons'><a class='green' href='#' onclick=\"editRecord('"+cl+"');\"><i class='icon-pencil bigger-130'></i></a></span>&nbsp;"; 
				da = "<span class='action-buttons'><a class='red' href='#' onclick=\"deleteRecord('"+cl+"');\"><i class='icon-trash bigger-130'></i></a></span>"; 
				jQuery("#listDataGrid").jqGrid('setRowData',ids[i],{act:ua+da});
			}	
		}
});

//bottom controller bar
jQuery("#listDataGrid").jqGrid('navGrid','#navBarDiv',
		{ 	//navbar options
	edit: false,
	editicon : 'icon-pencil blue',
	add: false,
	addicon : 'icon-plus-sign purple',
	del: false,
	delicon : 'icon-trash red',
	search: false,
	searchicon : 'icon-search orange',
	refresh: true,
	refreshicon : 'icon-refresh green',
	view: false,
	viewicon : 'icon-zoom-in grey',
});

// Search filter bar
jQuery("#listDataGrid").jqGrid('filterToolbar',{searchOperators : false});

//自定義 Button
jQuery("#listDataGrid").jqGrid('navButtonAdd','#navBarDiv',{ caption:"", buttonicon:"icon-plus-sign", position: "0", title:"Create New Accout", cursor: "pointer",
	onClickButton:function(){	
		$("#modal-userEdit").modal({remote: "${ctx}/app/userEdit?act=edit"});
		$('#modal-userEdit').modal('show');			
	} 
});


function editRecord(rowId){
	var ret = $("#listDataGrid").jqGrid('getRowData',rowId);

	 $("#modal-userEdit").modal({remote: "${ctx}/app/userEdit?act=edit&userId=" + ret.userId});
	$('#modal-userEdit').modal('show');	
}

function deleteRecord(rowId){
	var ret = $("#listDataGrid").jqGrid('getRowData',rowId);

		bootbox.confirm('<h4 class="orange">Are you sure you want to delete this record?</h4>', function(result) {
			if(result) {
				
				//jQuery Ajax RESTful
				$.ajax({
			         type: "DELETE",
			         url: "${ctx}/app/api/v1/user/" + ret.userId,
			         contentType: "application/json; charset=utf-8",
			         //data: JSON.stringify(contactId),
			         dataType: "json",
			         success: function (data, status, jqXHR) {
			        	 
			        	if(data.success){
			        		showAndDismissAlert('success','icon-ok',data.message+ '','Refreshing DataGrid...',1000);
			        		$("#listDataGrid").trigger("reloadGrid");  //重新刷新DataGrid
			         	}else{
			         		showAndDismissAlert('danger','icon-remove',data.message,'Please re-try or contact admin.',3600*1000);
			         		$("#listDataGrid").trigger("reloadGrid");  //重新刷新DataGrid
			         	}
			         },
			         error: function (jqXHR, status) {
			        	showAndDismissAlert('danger','icon-remove',data.message,'Please re-try or contact admin.',3600*1000);
			         }  
			     });				
			}
	});
}


//当打开Model遮罩后必须重新渲染.chosen()
$('#modal-userEdit').on('shown.bs.modal', function (e) {
	$(".chosen-select").chosen(); 
})

//当关闭Model遮罩后清空Form
$('#modal-userEdit').on('hidden.bs.modal', function (e) {
	$('#userForm').resetForm();
	$(this).removeData("bs.modal");
})
</script>



	
								