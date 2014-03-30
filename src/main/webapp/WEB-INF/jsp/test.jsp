<%@ page language="java" pageEncoding="UTF-8"%>
<title>test</title>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">

		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">Home</a></li>

			<li><a href="#">item</a></li>
			<li class="active">Sub item</li>
		</ul>
	</div>

	<div class="page-content">
		<div class="row">
			<div class="col-xs-12">

				<!-- ====================================== body start =============================================== -->
				<div class="page-header">
					<h1>
						用户管理 <small> <i class="icon-double-angle-right"></i> 用户列表
						</small>
					</h1>
				</div>
				<!-- /.page-header -->
















				<a data-toggle="modal" href="modal1.jsp" data-target="#myModal">Click
					me</a>


				<!-- ====================================== body end ================================================= -->

			</div>
		</div>
	</div>
</div>









<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="false">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Modal title</h4>
			</div>
			<div class="modal-body">


				<div class="tabbable">
					<ul class="nav nav-tabs" id="myTab">
						<li class="active"><a data-toggle="tab" href="#userInfo"> <i
								class="green icon-edit bigger-110"></i> User Info
						</a></li>

						<li><a data-toggle="tab" href="#userPassword"> 
						<i class="blue icon-key bigger-110"></i>
						Change Password
						</a></li>
					</ul>

					<div class="tab-content">
						<div id="userInfo" class="tab-pane in active">
							<p>Raw denim you probably haven't heard of them jean shorts
								Austin.</p>
								<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>

						<div id="userPassword" class="tab-pane">
							<p>Food truck fixie locavore, accusamus mcsweeney's marfa
								nulla single-origin coffee squid.</p>
							<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
							</div>
						</div>
					</div>
				</div>



			</div>
		
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->



