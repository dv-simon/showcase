<%@ page language="java" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${ctx}/static/assets/css/colorbox.css" />

<title>Image Upload</title>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">Home</a></li>

			<li><a href="#">Commons</a></li>
			<li class="active">Image Upload</li>
		</ul>
	</div>

	<div class="page-content">
		<!-- ====================================== body start =============================================== -->
		<div class="row">
		
		<div class="col-xs-12">

			<div class="row">
								<div class="col-xs-4">
											<div class="widget-box">
												<div class="widget-header">
													<h4>Preview and upload images:</h4>

													<div class="widget-toolbar">
														<a href="#" data-action="collapse">
															<i class="icon-chevron-up"></i>
														</a>
				
														<!--  <a href="#" data-action="close">
															<i class="icon-remove"></i>
														</a> -->
													</div>
												</div>

												<div class="widget-body">
													<div class="widget-main">
														<div>
														<div><img id="imagePreview" width="180" height="180" src="${ctx}/static/images/no_picture.jpg">
			
														<form id="imageUpload01" method="POST" action="${ctx}/app/api/previewImage" enctype="multipart/form-data">
        												<input type="file" id="file" name="file" onchange="return ajaxUpload();"><br /> 
        												 <input type="hidden" name="fileName" value="${someId}"> 
    													</form></div>
														<hr />
														</div>
														<div>
											
															<button class="btn" type="reset" onclick="doReset()">
																<i class="icon-undo bigger-110"></i>
																Reset
															</button>&nbsp; &nbsp; &nbsp;&nbsp;
															
															<button class="btn btn-info" type="button" onclick="confirmImage()">
																<i class="icon-ok bigger-110"></i>
																Upload
															</button>
														</div>
														
													</div>
												</div>
											</div>
										</div>

										<div class="col-xs-8">
											
										<div class="row-fluid">
											<ul class="ace-thumbnails"></ul>
										</div>
											
										</div>
			</div>
		</div>
		
				<!-- ====================================== body end ================================================= -->

		</div>
	</div>
</div>


<script type="text/javascript">
/**
 * 初始化image list
 */
$(document).ready(function() {
	refreshImageList(); 
});

/**
 * 双击图片预览区
 */
$("#imagePreview").dblclick(function (){  
	$('#file').click();
}); 

var fileName = "";

/**
 * 使用Ajax Form插件实现 异步上传图片
 */
function ajaxUpload(){  
		$('#imageUpload01').ajaxSubmit(options);
}

var options = {
		   beforeSubmit: beforeSubmit,  //提交前的回调函数
		   success: processResponse,      //提交后的回调函数
		   dataType:'json',			   //html(默认), xml, script, json...接受服务端返回的类型
		   //clearForm: true,          //成功提交后，清除所有表单元素的值
		   //resetForm: true,          //成功提交后，重置所有表单元素的值
		   timeout: 3000               //限制请求的时间，当请求大于3秒后，跳出请求
			}	
 
function beforeSubmit(formData, jqForm, options){
	if(($('#file').val().indexOf('.jpg')!=-1) ||($('#file').val().indexOf('.png')!=-1)){
		return true;
	}else{
		showAndDismissAlert('danger','icon-remove',"not image file","",2000);
		$('#file').val("");  
	   return false;  
	}
}; 

function processResponse(data){
	if(data.success == true){
		$("#imagePreview").attr("src","${ctx}/upload/imagetemp/"+data.dataObject+ '?rand=' + Math.random());  
		fileName = data.dataObject;
	}else{			
		showAndDismissAlert('danger','icon-remove',data.message,"",2000);
	}
	return;
}


/**
 * 清除表单和预览图片
 */
function doReset(){
	$("#imagePreview").attr("src","${ctx}/static/images/no_picture.jpg");
	$('#imageUpload01').resetForm();
	fileName = null;
	
}


/**
 * 确认图片并copy到PROD目录夹
 */
function confirmImage(){

	if(fileName){

	$.ajax( {    
	    url:'${ctx}/app/api/confirmImage',// 跳转到 action    
	    data:{    
	             fileName : fileName,    
	    },    
	    type:'get',    
	    cache:false,    
	    dataType:'json',    
	    success:function(data) {    
	        if(data.success){    
	        	showAndDismissAlert('success','icon-ok','Image upload successful.<br>Uploaded onto: /upload/imageprod/'+ fileName,'',2000);
				refreshImageList(); 
	        }else{    
	        	showAndDismissAlert('danger','icon-remove',"Exception during image upload.","",2000);   
	        }    
	     },    
	     error : function() {        
	    	 showAndDismissAlert('danger','icon-remove',"Exception during image upload.","",2000); 
	     }    
	});  
	
	}else{
		 showAndDismissAlert('danger','icon-remove',"Please select image and preview it firstly.","",2000); 
	}
	
	
}


/**
 * 更新image list
 */
function refreshImageList(){
	
	$('.ace-thumbnails').empty();
	
	$.getJSON("${ctx}/app/api/image",
			function(data){
			  $.each(data.dataObject, function(i,item){
				  $('.ace-thumbnails').append('<li><a target="blank" href="${ctx}/upload/imageprod/' + item +'" data-rel="colorbax"> '+
					'<img alt="150x150" width="180" height="180" src="${ctx}/upload/imageprod/' + item +'" /></a></li>');
			  });
		});
}


</script>


<!-- page specific plugin scripts -->

<script src="${ctx}/static/assets/js/jquery.colorbox-min.js"></script>



<!-- <script type="text/javascript">
			jQuery(function($) {
	var colorbox_params = {
		reposition:true,
		scalePhotos:true,
		scrolling:false,
		previous:'<i class="icon-arrow-left"></i>',
		next:'<i class="icon-arrow-right"></i>',
		close:'&times;',
		current:'{current} of {total}',
		maxWidth:'80%',
		maxHeight:'80%',
		onOpen:function(){
			document.body.style.overflow = 'hidden';
		},
		onClosed:function(){
			document.body.style.overflow = 'auto';
		},
		onComplete:function(){
			$.colorbox.resize();
		}
	};

	$('.ace-thumbnails [data-rel="colorbox"]').colorbox(colorbox_params);
	$("#cboxLoadingGraphic").append("<i class='icon-spinner orange'></i>");//let's add a custom loading icon

	/**$(window).on('resize.colorbox', function() {
		try {
			//this function has been changed in recent versions of colorbox, so it won't work
			$.fn.colorbox.load();//to redraw the current frame
		} catch(e){}
	});*/
})


</script> -->


