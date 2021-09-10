<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>授权管理</title>
<meta name="description" content="授权管理">
<meta name="keywords" content="授权管理">

<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
	
	<script type="text/javascript">
		var $webName = "${pageContext.request.contextPath}";
	</script>	
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->
		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					授权管理 <small>授权列表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/url/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="${pageContext.request.contextPath}/url/product-list">授权管理</a></li>
					<li class="active">授权列表</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">
							<div>
								<div class="col-md-1 title">角色</div>
								<div class="col-md-4 data" >
									<select class="form-control select2" style="width: 100%"
											id="userList">
										<option value="">==请选择==</option>

									</select>
								</div>
								<div class="col-md-1 title">授权类型</div>
								<div class="col-md-4 data">
									<select class="form-control select2" style="width: 100%"
											id="permissionList">
										<option value="">==请选择==</option>
										<option value="0">权限</option>
										<option value="1">账号</option>
									</select>
								</div>
								<div class="col-md-1 title">
									<button type="button" class="btn bg-default"
											onclick="btnSelect()">查询</button>
								</div>

							</div>

							<!--工具栏-->
							<div class="col-md-4" style="top: 10px; bottom: 20px">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="账号授权"
											onclick="user()">
											<i class="fa fa-file-o"></i> 账号授权
										</button>

<%--										<button type="button" onclick="role()" class="btn btn-default" title="角色授权">--%>
<%--											<i class="fa fa-check"></i> 角色授权--%>
<%--										</button>--%>
										<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>


							<!--工具栏/-->

							<!--数据列表-->
							<table  id="dataList"
								   class="table table-bordered table-striped table-hover dataTable">
								<thead>

								</thead>
								<tbody style="top: 50px">
								</tbody>
							</table>
							<!--数据列表/-->


						</div>
						<!-- 数据表格 /-->


					</div>
					<!-- /.box-body -->
					<br/>
					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div id="pageDiv" class="form-group form-inline">
								
							</div>
						</div>

						<div class="box-tools pull-right">
							<ul id="pageUl" class="pagination">
								
							</ul>
						</div>

					</div>
					<!-- /.box-footer-->
				</div>
			</section>
			<!-- 正文区域 /-->
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.2.0
			</div>
			<strong>
				湖北工程学院
			</strong>
		</footer>
		<!-- 底部导航 /-->
	</div>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script
			SRC="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>
	<script>

		var $pageNum = 1;//当前页
		var $pageSize = 5;//每页的数量 
		var $pageInfo;//当前分页信息 



		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});

			//动态添加下拉框
			locationList();

			//获取数据,刷新表格 
			//getProductPageInfo($pageNum,$pageSize);


		});
		
		//批量删除
		$("#deleteProduct").click(function(){
			var ids = new Array();
			
			$.each($(".checkItem:checked"),function(){
				//删除产品的id
				var id = $(this).parents("tr").children("td").eq(1).text();
				ids.push(id);
			})
			
			if(confirm("确认删除用户吗")){
				//发送ajax请求，批量删除
				$.ajax({
					url:$webName + "/product/deleteProducts",
					type:"post",
					data:"ids="+ids,
					success:function(flag){
						//获取数据 
						getProductPageInfo($pageNum,$pageSize);
					}
				});
			}
		})
			
		//修改
		function update(id){
			//跳转到修改页面
			window.location.href= $webName + "/product/updateProduct?id="+id;
		}
		
		function btndetail(id){
			//跳转到修改页面
			window.location.href= $webName + "/product/ProductDetail?id="+id;
		}
		
		//获取数据后,动态生成表格 
		function addTable(pageInfo){
			var permission=$("#permissionList").val();
			if (permission==0){
				$("thead").empty();
				$("thead").append("<tr>" +
						"<th class='sorting_asc'>ID</th> " +
						"<th class='sorting_desc'>权限名称</th> " +
						"<th class='sorting_asc sorting_asc_disabled'>权限类型</th> " +
						"<th class='sorting_asc sorting_asc_disabled'>权限路径</th> " +
						"<th class='sorting_desc sorting_desc_disabled'>权限码</th> " +
						"<th class='text-center'>操作</th> " +
						"</tr>");

				$("tbody").empty();
				$.each(pageInfo.list,function (index,item) {
					$("tbody").append("<tr>"+
							"<td>"+ item.id +"</td>"+
							"<td>"+ item.name +"</td>"+
							"<td>"+ (item.type==0?"菜单":(item.type==1?"目录":"按钮")) +"</td>"+
							"<td>"+ item.uri +"</td>"+
							"<td>"+ item.code +"</td>"+
							"<td class='text-center'>"+
							"<button type='button' id='btnUser' class='btn bg-olive btn-xs'>解除授权</button>"+
							"</td></tr>"
					);
				});
			}else if (permission==1){
				$("thead").empty();
				$("thead").append("<tr>" +
						"<th class='sorting_asc'>ID</th> " +
						"<th class='sorting_desc'>名称</th> " +
						"<th class='sorting_asc sorting_asc_disabled'>电话号码</th> " +
						"<th class='sorting_asc sorting_asc_disabled'>密码</th> " +
						"<th class='sorting_desc sorting_desc_disabled'>地址</th> " +
						"<th class='sorting_desc sorting_desc_disabled'>状态</th> " +
						"<th class='text-center'>操作</th> " +
						"</tr>");

				$("tbody").empty();
				$.each(pageInfo.list,function (index,item) {
					$("tbody").append("<tr>"+
							"<td>"+ item.id +"</td>"+
							"<td>"+ item.name +"</td>"+
							"<td>"+ item.mobile +"</td>"+
							"<td>"+ item.password +"</td>"+
							"<td>"+ item.address +"</td>"+
							"<td>"+ (item.state==0?"正常":"禁用") +"</td>"+
							"<td class='text-center'>"+
							"<button type='button' id='btnRole' class='btn bg-olive btn-xs'>解除授权</button>"+
							"</td></tr>"
					);
				});
			}

		}
		
		//获取数据后,动态生成分页组件 
		function addPageInfo(pageInfo){
			$("#pageDiv").empty();
				
			var $options = $("<select class='form-control' id='list'><option>5</option><option>10</option><option>20</option><option>50</option><option>100</option></select>");
			
			if(pageInfo.pageSize == 5){
				$options.children("option").eq(0).attr("selected","selected");
			}else if(pageInfo.pageSize == 10){
				$options.children("option").eq(1).attr("selected","selected");
			}else if(pageInfo.pageSize == 20){
				$options.children("option").eq(2).attr("selected","selected");
			}else if(pageInfo.pageSize == 50){
				$options.children("option").eq(3).attr("selected","selected");
			}else if(pageInfo.pageSize == 100){
				$options.children("option").eq(4).attr("selected","selected");
			}else{
				$options.children("option").eq(0).attr("selected","selected");
			}



			$("#pageDiv").append("总共"+ pageInfo.pages +"页，共"+ pageInfo.total +"条数据。 每页");
			$("#pageDiv").append($options);
			$("#pageDiv").append("条");
			
			$("#pageUl").empty();
			$("#pageUl").append("<li><a href='#' class='first' aria-label='Previous'>首页</a></li>"+
				"<li><a href='#' class='pre' >上一页</a></li>"				
			);
				
			$.each(pageInfo.navigatepageNums,function(index,num){
				if(num == pageInfo.pageNum){
					//判断当前页
					$("#pageUl").append("<li class='active' ><a href='#' class='current' >"+ num +"</a></li>");
				}else{
					//判断当前页
					$("#pageUl").append("<li><a href='#' class='current' >"+ num +"</a></li>");
				}
			})
			
			$("#pageUl").append("<li><a href='#' class='next' >下一页</a></li>"+
				"<li><a href='#' class='last' aria-label='Previous'>尾页</a></li>"
			);	
		}
		
		$(document).on("change","#list",function(){
			var pageSize = $(this).val();
			$pageSize = pageSize;
			getProductPageInfo($pageNum,$pageSize);
		});
		
		$(document).on("click",".first",function(){
			$pageNum = 1;
			getProductPageInfo($pageNum,$pageSize);
		});
		
		$(document).on("click",".pre",function(){
			if($pageNum > 1){
				$pageNum = $pageNum - 1;
			}
			getProductPageInfo($pageNum,$pageSize);
		});
		
		$(document).on("click",".current",function(){	
			$pageNum = $(this).text();
			getProductPageInfo($pageNum,$pageSize);
		});
		
		$(document).on("click",".next",function(){
			if($pageNum < $pageInfo.pages){
				$pageNum = $pageNum + 1;
			}			
			getProductPageInfo($pageNum,$pageSize);
		});
		
		$(document).on("click",".last",function(){
			$pageNum = $pageInfo.pages;
			getProductPageInfo($pageNum,$pageSize);
		});
		
		function getProductPageInfo(pageNum,pageSize){
			var user=$("#userList").val();
			var permission=$("#permissionList").val();
			var urlList="";
			if (permission==0){
				urlList=$webName + "/product/selectRolePermission";
			}else if (permission==1){
				urlList=$webName + "/product/selectUserRole";
			}
			//获取页面数据
			$.ajax({
				url:urlList,
				type:"post",
				data:"pageNum=" + pageNum + "&pageSize=" + pageSize+"&roleID="+user,
				success:function(pageInfo){
					$pageNum = pageInfo.pageNum;//当前页
					$pageSize = pageInfo.pageSize;//每页的数量
					$pageInfo = pageInfo;//当前分页信息
					//动态生成表格
					addTable(pageInfo);
					//动态生成分页组件 
					addPageInfo(pageInfo);
				}
			});
		}

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}
		
		$(document).on("click","#kaiqi",function(){
			var ids = new Array();
			var flag = true;
			$.each($(".checkItem:checked"),function(){
				//删除产品的id
				var id = $(this).parents("tr").children("td").eq(0).text();
				ids.push(id);
			})
			
			$.ajax({
				url: $webName + "/product/zhuangtai",
				type:"post",
				data:"flag=" + flag + "&ids=" + ids,
				success:function(result){
					getProductPageInfo($pageNum,$pageSize);
				}
			})
			
		});
		
		$(document).on("click","#pingbi",function(){
			var ids = new Array();
			var flag = false;
			$.each($(".checkItem:checked"),function(){
				//删除产品的id
				var id = $(this).parents("tr").children("td").eq(0).text();
				ids.push(id);
			})
						
			$.ajax({
				url: $webName + "/product/zhuangtai",
				type:"post",
				data:"ids="+ids+"&flag="+flag,
				success:function(result){
					getProductPageInfo($pageNum,$pageSize);
				}
			})
			
		});

		$(document).ready(function() {

			// 激活导航位置
			setSidebarActive("permission_role");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});

		//动态加载下拉框$webName + "/product/selectRoleList"
		function locationList(){
			$.ajax({
				url:$webName + "/product/selectRoleList",
				type:"post",
				dataType:"json",
				success:function(pageInfo){
					$.each(pageInfo,function (index,role) {
						$("#userList").append(
								"<option value="+role.id+">"+role.name+"</option>"
						);
					})
				}
			});
		}
		//查询按钮
		function btnSelect() {
			var user=$("#userList").val();
			var permission=$("#permissionList").val();
			if (user!=""&&permission!=""){
				getProductPageInfo($pageNum,$pageSize);
			}else{
				layer.msg("请选择角色和授权类型");
			}
		}



		//解除角色授权
		$(document).on("click","#btnUser",function () {
			var roleID=$("#userList").val();
			var permissionID = $(this).parents("tr").children("td").eq(0).text();
			$.ajax({
				url:$webName + "/product/deleteRolePermission",
				data:{
					roleID:roleID,
					permissionID:permissionID
				},
				type:"post",
				dataType:"json",
				success:function (info) {
					if (info>0){
						var user=$("#userList").val();
						selectRolePermission(user);
					}
				}

			})

		})

		//解除账号授权
		$(document).on("click","#btnRole",function () {
			var roleID=$("#userList").val();
			var userID = $(this).parents("tr").children("td").eq(0).text();
			$.ajax({
				url:$webName + "/product/deleteUserRole",
				data:{
					userID:userID,
					roleID:roleID
				},
				type:"post",
				dataType:"json",
				success:function (info) {
					if (info>0){
						var user=$("#userList").val();
						getProductPageInfo($pageNum,$pageSize);
					}
				}

			})

		})

		//账号授权按钮
		function user() {
			var user=$("#userList").val();
			if (user!=""){
				window.location.href=$webName + "/url/product-add?user="+user;
			}else{
				layer.msg("请选择角色！");
			}
		}

		//角色授权
		function role() {
			var user=$("#userList").val();
			if (user!=""){
				window.location.href="${pageContext.request.contextPath}/product/getRoleInfoDetailById?userID="+user;
			}else{
				alert("请选择角色！");
			}
		}
	</script>
</body>

</html>