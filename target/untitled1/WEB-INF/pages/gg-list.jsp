<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>

<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>公告管理</title>
<meta name="description" content="公告管理">
<meta name="keywords" content="公告管理">

<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">

<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>

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
			<input type="hidden" id="roles" value="${sessionScope.roleInfo.name}">
			<!-- 内容头部 -->
			<section class="content-header">
				<h1>
					公告管理 <small>全部公告</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/url/main"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li><a
							href="${pageContext.request.contextPath}/url/gg-list">公告管理</a></li>
					<li class="active">全部公告</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表</h3>
						<input type="hidden" id="user_id" value="${sessionScope.userInfo.id}">
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
											<button type="button" class="btn btn-default" title="新建" onclick="window.location='${pageContext.request.contextPath}/url/gg-add'">
												<i class="fa fa-file-o"></i> 新建
											</button>
											<button type="button" id="deleteOrders" class="btn btn-default" title="删除">
												<i class="fa fa-trash-o"></i> 删除
											</button>
										<security:authorize access="hasRole('ELEMENT_order:page-list')">

										</security:authorize>

										<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();">
											<i class="fa fa-refresh"></i> 刷新
										</button>
									</div>
								</div>
							</div>
<%--							<div class="box-tools pull-right">--%>
<%--								<div class="has-feedback">--%>
<%--									<input id="search" type="text" class="form-control input-sm"--%>
<%--										placeholder="搜索">--%>
<%--										<span class="glyphicon glyphicon-search form-control-feedback"></span>--%>

<%--								</div>--%>
<%--							</div>--%>
							<!--工具栏/-->

							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px; width: 4%"><input
											id="selall" type="checkbox" class="icheckbox_square-blue">
										</th>
										<th class="sorting_asc sorting_asc_disabled">ID</th>
										<th class="sorting_asc sorting_asc_disabled">标题</th>
										<th class="sorting_desc sorting_desc_disabled">作者</th>
										<th class="sorting_desc sorting_desc_disabled">创作时间</th>
										<th class="sorting_desc sorting_desc_disabled">内容</th>
										<th class="text-center">操作</th>
									</tr>
								</thead>

								<tbody>

								</tbody>
							</table>
<%--							数据列表--%>

							<!--工具栏-->
							<!--工具栏/-->
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
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script type="text/javascript">
		var $webName = "${pageContext.request.contextPath}";
	</script>
	<script src="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>
	<script>

		var $pageNum = 1;//当前页
		var $pageSize = 5;//每页的数量
		var $pageInfo;//当前分页信息


		function changePageSize() {
			//获取下拉框的值
			var pageSize = $("#changePageSize").val();

			//向服务器发送请求，改变没页显示条数
			location.href = "${pageContext.request.contextPath}/order/findAll?page=1&pageSize="
					+ pageSize;
		}

		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});

			//发送异步请求，查询全部订单
			getUserListPageHelper($pageNum,$pageSize);

		});

		function getUserListPageHelper(pageNum,pageSize){
			$.ajax({
				url:$webName + "/notice/selectAll",
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

		function addTable(pageInfo){
			$("tbody").empty();
			$.each(pageInfo.list,function(index,order){
				console.log(order);
				$("tbody").append("<tr><td><input class='checkItem' type='checkbox'></td>" +
						"<td>" + order.id + "</td>" +
						"<td>" + order.title + "</td>" +
						"<td>" + order.name + "</td>" +
						"<td>" + order.noticeTime + "</td>" +
						"<td>" + order.context + "</td>" +
						"<td class='text-center'>" +
						"<button type='button' class='deleteOrder btn bg-olive btn-xs'>删除</button>" +
						"<button type='button' class='updateOrder btn bg-olive btn-xs'>修改</button>" +
						"</td></tr>"
				);

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
			getUserListPageHelper($pageNum,$pageSize);
		});

		$(document).on("click",".first",function(){
			$pageNum = 1;
			getUserListPageHelper($pageNum,$pageSize);
		});

		$(document).on("click",".pre",function(){
			if($pageNum > 1){
				$pageNum = $pageNum - 1;
			}
			getUserListPageHelper($pageNum,$pageSize);
		});

		$(document).on("click",".current",function(){
			$pageNum = $(this).text();
			getUserListPageHelper($pageNum,$pageSize);
		});

		$(document).on("click",".next",function(){
			if($pageNum < $pageInfo.pages){
				$pageNum = $pageNum + 1;
			}
			getUserListPageHelper($pageNum,$pageSize);
		});

		$(document).on("click",".last",function(){
			$pageNum = $pageInfo.pages;
			getUserListPageHelper($pageNum,$pageSize);
		});

		//修改，详情，删除，添加

		//1.删除单个
		$(document).on("click",".deleteOrder",function(){
			var id = $(this).parents("tr").children("td").eq(1).text();
			if(confirm("确认删除第"+id+"条公告吗")){
				$.ajax({
					url:"${pageContext.request.contextPath}/notice/deleteNotice",
					type:"post",
					data:"id="+id,
					success:function(flag){
						console.log(flag);
						if (flag==1){
							layer.msg("删除成功");
							//获取数据
							getUserListPageHelper($pageNum,$pageSize);
						}else{
							layer.msg("删除失败");
						}

					}
				});
			}
		});

		//2.批量删除
		$(document).on("click","#deleteOrders",function(){
			var ids = new Array();//存储删除的id

			$.each($(".checkItem:checked"),function(){
				//删除产品的id
				var id = $(this).parents("tr").children("td").eq(1).text();
				ids.push(id);
			})

			if(confirm("确认删除订单吗")){
				$.ajax({
					url:$webName + "/notice/deleteNoticeItem",
					type:"post",
					data:"ids="+ids,
					success:function(flag){
						layer.msg("删除成功");
						console.log(flag);
						//获取数据
						getUserListPageHelper($pageNum,$pageSize);
					}
				});
			}
		});

		//3.修改订单
		$(document).on("click",".updateOrder",function(){
			var id = $(this).parents("tr").children("td").eq(1).text();
			window.location.href ="${pageContext.request.contextPath}/notice/selectNoticeID?id=" + id;
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
			setSidebarActive("admin-gg");

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