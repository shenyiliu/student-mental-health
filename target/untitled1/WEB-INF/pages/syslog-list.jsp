<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>日志管理</title>
<meta name="description" content="日志管理">
<meta name="keywords" content="日志管理">

<!-- Tell the browser to be responsive to screen width -->
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
				日志管理 <small>全部日志</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/pages/syslog-list.jsp">日志管理</a></li>

				<li class="active">全部日志</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content"> <!-- .box-body -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">列表</h3>
				</div>

				<div class="box-body">

					<!-- 数据表格 -->
					<div class="table-box">

						<!--工具栏-->
						<div class="pull-left">
							<div class="form-group form-inline">
								<div class="btn-group">
									<button type="button" class="btn btn-default" title="刷新"
										onclick="window.location.reload();">
										<i class="fa fa-refresh"></i> 刷新
									</button>
								</div>
							</div>
						</div>

						<!--工具栏/-->

						<!--数据列表-->
						<table id="dataList"
							class="table table-bordered table-striped table-hover dataTable"
							   align="center" style="word-break:break-all">
							<thead>
								<tr>
									<th class="" style="padding-right: 0px;width: 2%"><input id="selall"
										type="checkbox" class="icheckbox_square-blue" ></th>
									<th class="sorting_asc" style="width: 2%">ID</th>
									<th class="sorting_asc sorting_asc_disabled"  style="width: 10%" >访问时间</th>
									<th class="sorting_asc sorting_asc_disabled" style="width: 5%;padding: 5px">访问用户</th>
									<th class="sorting_asc sorting_asc_disabled" style="width: 8%">访问IP</th>
									<th class="sorting_asc sorting_asc_disabled" style="width: 20%">资源URL</th>
									<th class="sorting_asc sorting_asc_disabled" style="width: 5%;padding: 5px">执行时间</th>
									<th class="sorting_asc sorting_asc_disabled" style="width: 20%">访问方法</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
						<!--数据列表/-->

					</div>
					<!-- 数据表格 /-->
				</div>
				<!-- /.box-body -->

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
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript">
			var $webName = "${pageContext.request.contextPath}";
		</script>
	<script>
		var $pageInfo;
		var $pageNum = 1;
		var $pageSize = 10;
		
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
			
			selectLogAllPageHelper($pageNum,$pageSize)
		});
		
		function selectLogAllPageHelper(pageNum,pageSize){
			$.ajax({
				url:$webName + "/syslog/selectLogAllPageHelper",
				type:"post",
				data:"pageNum=" + pageNum + "&pageSize=" + pageSize,
				success:function(pageInfo){
					$pageInfo = pageInfo;
					$pageNum = pageInfo.pageNum;
					$pageSize = pageInfo.pageSize;
					
					//动态生成表格
					addTable($pageInfo);
					//动态生成分页信息
					addPageInfo($pageInfo);
				}
			})
		}

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}
		
		function addTable(pageInfo){
			$("tbody").empty();
			
			$.each(pageInfo.list,function(index,syslog){
				$("tbody").append("<tr><td><input class='checkItem' type='checkbox'></td>"+
						"<td>"+ syslog.id +"</td>"+
						"<td>"+ syslog.visitTime  +"</td>"+
						"<td>"+ syslog.username  +"</td>"+
						"<td>"+ syslog.ip +"</td>"+
						"<td>"+ syslog.url  +"</td>"+
						"<td>"+ syslog.times  +"</td>"+
						"<td>"+ syslog.method +"</td>"+
					"</tr>");
			});			
		}
	
		//获取数据后,动态生成分页组件 
		function addPageInfo(pageInfo){
			$("#pageDiv").empty();
				
			var $options = $("<select class='form-control'><option>5</option><option>10</option><option>20</option><option>50</option><option>100</option></select>");
			
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
		
		$(document).on("change","select",function(){
			var pageSize = $(this).val();
			$pageSize = pageSize;
			selectLogAllPageHelper($pageNum,$pageSize);
		});
		
		$(document).on("click",".first",function(){
			$pageNum = 1;
			selectLogAllPageHelper($pageNum,$pageSize);
		});
		
		$(document).on("click",".pre",function(){
			if($pageNum > 1){
				$pageNum = $pageNum - 1;
			}
			selectLogAllPageHelper($pageNum,$pageSize);
		});
		
		$(document).on("click",".current",function(){	
			$pageNum = $(this).text();
			selectLogAllPageHelper($pageNum,$pageSize);
		});
		
		$(document).on("click",".next",function(){
			if($pageNum < $pageInfo.pages){
				$pageNum = $pageNum + 1;
			}			
			selectLogAllPageHelper($pageNum,$pageSize);
		});
		
		$(document).on("click",".last",function(){
			$pageNum = $pageInfo.pages;
			selectLogAllPageHelper($pageNum,$pageSize);
		});

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("admin-syslog");

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
	</script>
</body>

</html>