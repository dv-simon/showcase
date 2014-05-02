<%@ page language="java" pageEncoding="UTF-8"%>


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
		<div class="row">
			<div class="col-xs-12">

				<!-- ====================================== body start =============================================== -->

			<div><img id="imagePreview" width="180" height="180" src="/static/images/no_picture.jpg"></div>

			 <form id="imageUpload01" method="POST" action="${ctx}/app/api/imageUpload" enctype="multipart/form-data">
        		Select image to upload: (only jpg/png) <input type="file" id="file" name="file" onchange="return ajaxUpload();"><br /> 
        				 <input type="hidden" name="fileName" value="${someId}"><br /> <br /> 
    		</form>
			<div id="uploadedFileName"></div>



				<!-- ====================================== body end ================================================= -->

			</div>
		</div>
	</div>
</div>


<script type="text/javascript">

$("#imagePreview").dblclick(function (){  
	$('#file').click();
	}); 

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
		$("#imagePreview").attr("src","/upload/tempimage/"+data.dataObject+ '?rand=' + Math.random());  
		$('#uploadedFileName').text("Uploaded : /upload/tempimage/"+ data.dataObject);
		showAndDismissAlert('success','icon-ok',data.message,'',2000);
	}else{			
		showAndDismissAlert('danger','icon-remove',data.message,"",3000);
	}
	return;
}

</script>










