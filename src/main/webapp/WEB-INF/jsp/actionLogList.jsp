<%@ page language="java" pageEncoding="UTF-8" %>
<title>Action Log List</title>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">Home</a></li>

			<li><a href="#">Action Log List</a></li>
		</ul>
	</div>

	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">
			
			<!-- ====================================== body start =============================================== -->
			
			<table id="listDataGrid"></table>
			
			<div id="navBarDiv"></div>
			
			<!-- ====================================== body end ================================================= -->
			
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

jQuery("#listDataGrid").jqGrid({
   	url:'${ctx}/app/api/v1/actionLog',
	datatype: "json",
	height: 500,
	autowidth: true,
   	colNames:['log Time','Log Type','Log Class', 'Log Body', 'ExecuteTime (ms)','Remark'],
   	colModel:[
   		{name:'logTime',index:'logTime', width:80,sortable:false,search:false},
   		{name:'logType',index:'logType', width:40,sortable:false,search:false},
   		{name:'logClass',index:'logClass', width:80,sortable:false,search:false},
   		{name:'logBody',index:'logBody', width:200,sortable:false,search:false},
   		{name:'executeTime',index:'ExecuteTime', width:60, align:"center",sortable:false,search:false},
   		{name:'remark',index:'remark', width:50,sortable:false,search:false}
   	],
   	rownumbers: true,
	rownumWidth: 40,
   	rowNum:15,
   	rowList:[15,30,100],
   	pager: '#navBarDiv',
    viewrecords: true,
    altRows: true,
    multiselect: false,
	//multikey: "ctrlKey",
    multiboxonly: true,
    caption:"Action Log List",
    
	loadComplete : function() {
			var table = this;
			setTimeout(function(){
				//styleCheckbox(table);
				//updateActionIcons(table);
				updatePagerIcons(table);
				//enableTooltips(table);
			}, 0);
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






</script>
