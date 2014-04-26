<link href="${ctx}/static/assets/css/bootstrap.min.css" rel="stylesheet" />

<link rel="stylesheet" href="${ctx}/static/assets/css/font-awesome.min.css" />

<link rel="stylesheet" href="${ctx}/static/assets/css/jquery-ui-1.10.3.full.min.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/ui.jqgrid.css" />

<link rel="stylesheet" href="${ctx}/static/assets/css/chosen.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/datepicker.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/daterangepicker.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/colorpicker.css" />

<link rel="stylesheet" href="${ctx}/static/styles/httpfonts.googleapis.com.css" />

<link rel="stylesheet" href="${ctx}/static/assets/css/ace.min.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="${ctx}/static/assets/css/ace-skins.min.css" />
		
<!--[if lte IE 8]>
<link rel="stylesheet" href="${ctx}/static/assets/css/ace-ie.min.css" />
<![endif]-->

<script src="${ctx}/static/assets/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
<script src="${ctx}/static/assets/js/html5shiv.js"></script>
<script src="${ctx}/static/assets/js/respond.min.js"></script>
<![endif]-->

<!--<link type="image/x-icon" href="${ctx}/${ctx}/static/images/favicon.ico" rel="shortcut icon"> -->






<!-- basic scripts -->

<!--[if !IE]> -->
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script> -->
<!-- <![endif]-->

<!--[if IE]>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<!--[endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
window.jQuery || document.write("<script src='${ctx}/static/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>
<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${ctx}/static/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
if("ontouchend" in document) document.write("<script src='${ctx}/static/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="${ctx}/static/assets/js/bootstrap.min.js"></script>
<script src="${ctx}/static/assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->
<script src="${ctx}/static/assets/js/jquery.dataTables.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.dataTables.bootstrap.js"></script>

<!-- Form component script -->
<script src="${ctx}/static/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${ctx}/static/assets/js/chosen.jquery.min.js"></script>
<script src="${ctx}/static/assets/js/fuelux/fuelux.spinner.min.js"></script>
<script src="${ctx}/static/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${ctx}/static/assets/js/date-time/bootstrap-timepicker.min.js"></script>
<script src="${ctx}/static/assets/js/date-time/moment.min.js"></script>
<script src="${ctx}/static/assets/js/date-time/daterangepicker.min.js"></script>
<script src="${ctx}/static/assets/js/bootstrap-colorpicker.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.knob.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.autosize.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
<script src="${ctx}/static/assets/js/jquery.maskedinput.min.js"></script>
<script src="${ctx}/static/assets/js/bootstrap-tag.min.js"></script>
<script src="${ctx}/static/js/jquery.form.js"></script>

<!-- ace scripts -->
<script src="${ctx}/static/assets/js/ace-elements.min.js"></script>
<script src="${ctx}/static/assets/js/ace.min.js"></script>

<!-- jqGrid script -->
<script src="${ctx}/static/assets/js/date-time/bootstrap-datepicker.min.js"></script>
<script src="${ctx}/static/assets/js/jqGrid/jquery.jqGrid.min.js"></script>
<script src="${ctx}/static/assets/js/jqGrid/i18n/grid.locale-tw.js"></script>
<script src="${ctx}/static/assets/js/jqGrid/jqGrid-custom-1.0.js"></script>
<script src="${ctx}/static/assets/js/bootbox.min.js"></script>


<!-- Commons Script -->
<script type="text/javascript">
try {
	ace.settings.check('breadcrumbs', 'fixed')
} catch (e) {
} 

</script>



<!-- Alert Box Script  -->
<style>
    div.alert-messages {
        position: fixed;
        top: 100px;
        left: 28%;
        right: 28%;
        z-index: 7000;
    }
</style>


<!-- ============= Alert 对话框 ========================= -->
<script type="text/javascript">
function showAndDismissAlert(type,icon,title,detial,delay) {
    var htmlAlert = '<div class="alert alert-' + type + '">'+
    '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>'+
    '<strong><i class="'+icon+'"></i>'+title+'</strong><br/>'+ detial + '<br/></div>';

    $(".alert-messages").prepend(htmlAlert);
    $(".alert-messages .alert").first().hide().fadeIn(200).delay(delay).fadeOut(1000, function () { $(this).remove(); });
}

function alertRedirect(type,icon,title,detial,delay,url){
	
	var htmlAlert = '<div class="alert alert-' + type + '">'+
    '<button type="button" class="close" data-dismiss="alert"><i class="icon-remove"></i></button>'+
    '<strong><i class="'+icon+'"></i>'+title+'</strong><br/>'+ detial + '<br/></div>';

    $(".alert-messages").prepend(htmlAlert);
    $(".alert-messages .alert").first().hide().fadeIn(200).delay(delay).fadeOut(1000, function () { $(this).remove(); });
    
	window.location = url;
}
</script>
<div class="alert-messages text-center"></div>

<script src="${ctx}/static/js/cft-commons-custom-script-1.0.js"></script>