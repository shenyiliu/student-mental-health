<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
	String userID=request.getParameter("id");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<!-- 页面meta -->
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">

	<title>订单管理</title>
	<meta name="description" content="订单管理">
	<meta name="keywords" content="订单管理">

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
				订单管理 <small>订单列表</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/url/main"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="${pageContext.request.contextPath}/url/order-list">订单管理</a></li>
				<li class="active">订单列表</li>
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
						<input type="hidden" id="roleID" value="<%=userID%>">
						<div class="col-md-1 title" style="text-align: center">订单状态</div>
						<div class="col-md-2 data" >
							<select class="form-control" id="state" style="width: 100%">
								<option value="-1">====请选择====</option>
								<option value="0">未接</option>
								<option value="1">已接受</option>
								<option value="2">已完成</option>
							</select>
						</div>

						<!--工具栏-->
						<div class="col-md-10" style="top: 10px; bottom: 20px">
							<div class="form-group form-inline">
								<div class="btn-group">
									<button type="button" class="btnDelete2 btn btn-default" title="删除">
										<i class="fa fa-file-o"></i> 批量分配
									</button>
									<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();">
										<i class="fa fa-refresh"></i> 刷新
									</button>
								</div>
							</div>
						</div>


						<!--工具栏/-->

						<!--数据列表-->
						<!--数据列表-->
						<table id="dataList"
							   class="table table-bordered table-striped table-hover dataTable">
							<thead>
							<tr>
								<th class="" style="padding-right: 0px; width: 4%"><input
										id="selall" type="checkbox" class="icheckbox_square-blue">
								</th>
								<th class="sorting_asc sorting_asc_disabled" style="width: 8%">订单ID</th>
								<th class="sorting_asc sorting_asc_disabled" style="width: 8%">姓名</th>
								<th class="sorting_desc sorting_desc_disabled" style="width: 20%">下单时间</th>
								<th class="sorting_desc sorting_desc_disabled" style="width: 10%">电话</th>
								<th class="sorting_desc sorting_desc_disabled" style="width: 20%">地址</th>
								<th class="sorting_desc sorting_desc_disabled" style="width: 8%">订单状态</th>
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
		<strong>湖北工程学院</strong>
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
<script type="text/javascript">
	var $webName = "${pageContext.request.contextPath}";
</script>
<script
		SRC="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>
<script>
	var $pageInfo;
	var $pageNum = 1;
	var $pageSize = 5;
	var $urlItem=$webName + "/order/selectAll";

	$(document).ready(function() {
		// 选择框
		$(".select2").select2();

		// WYSIHTML5编辑器
		$(".textarea").wysihtml5({
			locale : 'zh-CN'
		});

		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});

	//下拉框查询
	$(document).on("change","#state",function(){
		var state = $("#state").val();
		if (state==0){
			$urlItem=$webName + "/order/selectOrderStatue";
		}else if (state==1){
			$urlItem=$webName + "/order/selectOrderStatue";
		}else if (state==2){
			$urlItem=$webName + "/order/selectOrderStatue";
		}else if (state==-1){
			$urlItem=$webName + "/order/selectAll";
		}
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});


	function getUserListPageHelper(pageNum,pageSize,urlItem){
		var state = $("#state").val();
		$.ajax({
			url:urlItem,
			type:"post",
			data:"pageNum=" + pageNum + "&pageSize=" + pageSize+"&orderStatue="+state,
			success:function(pageInfo){
				$pageInfo = pageInfo;
				$pageNum = pageInfo.pageNum;
				$pageSize = pageInfo.pageSize;
				$urlItem=urlItem;

				//动态生成表格
				addTable($pageInfo);
				//动态生成分页信息
				addPageInfo($pageInfo);
			}
		})
	}

	function addTable(pageInfo){
		$("tbody").empty();

		$.each(pageInfo.list,function(index,order){
			$("tbody").append("<tr><td><input class='checkItem' type='checkbox'></td>"+
					"<td>"+order.id+"</td>"+
					"<td>"+order.name+"</td>"+
					"<td>"+order.orderTime +"</td>"+
					"<td>"+order.phone +"</td>"+
					"<td>"+order.address +"</td>"+
					"<td class='text-center'>"+(order.orderStatue == 0? "未接" : (order.orderStatue == 1? "已接" : "已完成") )+
					"</td></tr>"
			);
		});
	}

	//获取数据后,动态生成分页组件
	function addPageInfo(pageInfo){
		$("#pageDiv").empty();

		var $options = $("<select class='form-control' id='item'><option>5</option><option>10</option><option>20</option><option>50</option><option>100</option></select>");

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

	$(document).on("change","#item",function(){
		var pageSize = $(this).val();
		$pageSize = pageSize;
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});

	$(document).on("click",".first",function(){
		$pageNum = 1;
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});

	$(document).on("click",".pre",function(){
		if($pageNum > 1){
			$pageNum = $pageNum - 1;
		}
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});

	$(document).on("click",".current",function(){
		$pageNum = $(this).text();
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});

	$(document).on("click",".next",function(){
		if($pageNum < $pageInfo.pages){
			$pageNum = $pageNum + 1;
		}
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});

	$(document).on("click",".last",function(){
		$pageNum = $pageInfo.pages;
		getUserListPageHelper($pageNum,$pageSize,$urlItem);
	});


	$(document).on("click",".btnDetail",function(){
		var id=$(this).parents("tr").children("td").eq(1).text();
		window.location.href=$webName +"/user/getUserInfoDetailById?id="+id;
	});

	$(document).on("click",".btnUpdate",function(){
		var id=$(this).parents("tr").children("td").eq(1).text();
		window.location.href=$webName +"/user/userSelectID?id="+id;
	});

	//批量分配
	$(document).on("click",".btnDelete2",function(){
		var state=$("#state").val();
		if(state==0){
			var ids = new Array();//存储删除的id
			var userWxID=$("#roleID").val();
			$.each($(".checkItem:checked"),function(){
				//删除产品的id
				var id = $(this).parents("tr").children("td").eq(1).text();
				ids.push(id);
			})
			$.ajax({
				url:$webName + "/order/insertOrderItem",
				type:"post",
				dataType:"json",
				data:"ids="+ids+"&userWxID="+userWxID,
				success:function(flag){
					console.log(flag);
					//获取数据
					layer.msg("添加成功");
					getUserListPageHelper($pageNum,$pageSize,$urlItem);
				}
			});
		}else{
			layer.msg("请选择未接状态的订单");
		}

	});

	// 设置激活菜单
	function setSidebarActive(tagUri) {
		var liObj = $("#" + tagUri);
		if (liObj.length > 0) {
			liObj.parent().parent().addClass("active");
			liObj.addClass("active");
		}
	}

	$(document).ready(function() {
		// 激活导航位置
		setSidebarActive("admin-order");

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