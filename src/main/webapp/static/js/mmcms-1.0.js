
function startLoad(){

	isBlock = true;
}

function stopLoad(){
	setTimeout(function(){	
		isBlock =false;
	   },1000);
}


function setmain(title,href){  

	   // $(".combo-panel").parent(".panel").remove(); //解决combobox在页面缓存的问题
	

		var centerURL = href;
		var centerTitle = title;
		$('body').layout('panel', 'center').panel({
			title : "Your Location: " + centerTitle,
			href : centerURL
		});
		$('body').layout('panel', 'center').panel('refresh');
	
	return false;
}  


function showLoadingMask(panel){
	var msg = "Loading...";
	$("<div class=\"datagrid-mask\"></div>").css({ display: "block", width: panel.width(), height: panel.height() }).appendTo(panel);
	$("<div class=\"datagrid-mask-msg\" style=\"font: 12px/18px Lucida Sans, sans-serif\"></div>").html(msg).appendTo(panel).css({ display: "block", left: (panel.width() - $("div.datagrid-mask-msg", panel).outerWidth()) / 2, top: (panel.height() - $("div.datagrid-mask-msg", panel).outerHeight()) / 2 });
}

function hideLoadingMask(panel){
	panel.find("div.datagrid-mask-msg").remove();
    panel.find("div.datagrid-mask").remove();
}




// show bottom right message
function showInfoMessage(title, message){
	$.messager.show({  
		title: title,  
        msg: '<div class="messager-icon messager-info"></div><div>' + message + "</div>",    
        showType:'slide',
        timeout: 5000
    }); 
}

function showWarningMessage(title, message){
	$.messager.show({  
		title: title,  
        msg: '<div class="messager-icon messager-warning"></div><div>' + message + "</div>",    
        showType:'slide',
        timeout: 5000
    }); 
}

function showErrorMessage(title, message){
	$.messager.show({  
		title: title,  
        msg: '<div class="messager-icon messager-error"></div><div>' + message + "</div>",    
        showType:'slide',
        timeout: 5000
    }); 
}