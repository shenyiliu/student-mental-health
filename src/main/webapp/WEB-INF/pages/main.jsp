<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>大学生心理健康语料库管理系统</title>
<meta name="description" content="大学生心理健康语料库管理系统">
<meta name="keywords" content="大学生心理健康语料库管理系统">

<!-- Tell the browser to be responsive to screen width -->
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
	  href="${pageContext.request.contextPath}/plugins/layui/css/layui.css">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layuimini/lib/layui-v2.6.3/css/layui.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layuimini/lib/font-awesome-4.7.0/css/font-awesome.min.css" media="all">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/layuimini/css/public.css" media="all">
	<style>
		.layui-card {border:1px solid #f2f2f2;border-radius:5px;}
		.icon {margin-right:10px;color:#1aa094;}
		.icon-cray {color:#ffb800!important;}
		.icon-blue {color:#1e9fff!important;}
		.icon-tip {color:#ff5722!important;}
		.layuimini-qiuck-module {text-align:center;margin-top: 10px}
		.layuimini-qiuck-module a i {display:inline-block;width:100%;height:60px;line-height:60px;text-align:center;border-radius:2px;font-size:30px;background-color:#F8F8F8;color:#333;transition:all .3s;-webkit-transition:all .3s;}
		.layuimini-qiuck-module a cite {position:relative;top:2px;display:block;color:#666;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;font-size:14px;}
		.welcome-module {width:100%;height:210px;}
		.panel {background-color:#fff;border:1px solid transparent;border-radius:3px;-webkit-box-shadow:0 1px 1px rgba(0,0,0,.05);box-shadow:0 1px 1px rgba(0,0,0,.05)}
		.panel-body {padding:10px}
		.panel-title {margin-top:0;margin-bottom:0;font-size:12px;color:inherit}
		.label {display:inline;padding:.2em .6em .3em;font-size:75%;font-weight:700;line-height:1;color:#fff;text-align:center;white-space:nowrap;vertical-align:baseline;border-radius:.25em;margin-top: .3em;}
		.layui-red {color:red}
		.main_btn > p {height:40px;}
		.layui-bg-number {background-color:#F8F8F8;}
		.layuimini-notice:hover {background:#f6f6f6;}
		.layuimini-notice {padding:7px 16px;clear:both;font-size:12px !important;cursor:pointer;position:relative;transition:background 0.2s ease-in-out;}
		.layuimini-notice-title,.layuimini-notice-label {
			padding-right: 70px !important;text-overflow:ellipsis!important;overflow:hidden!important;white-space:nowrap!important;}
		.layuimini-notice-title {line-height:28px;font-size:14px;}
		.layuimini-notice-extra {position:absolute;top:50%;margin-top:-8px;right:16px;display:inline-block;height:16px;color:#999;}
	</style>
</head>

<body class="hold-transition skin-blue sidebar-mini" style="left: 0px">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="header.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">
			<input type="hidden" id="name" value="<security:authentication property='principal.username'></security:authentication>"/>

			<div class="layuimini-container">
				<div class="layuimini-main">
					<div class="layui-row layui-col-space15">
						<div class="layui-col-md8">
							<div class="layui-row layui-col-space15">
								<div class="layui-col-md6">
									<div class="layui-card">
										<div class="layui-card-header"><i class="fa fa-warning icon"></i>数据统计</div>
										<div class="layui-card-body">
											<div class="welcome-module">
												<div class="layui-row layui-col-space10">
													<div class="layui-col-xs6">
														<div class="panel layui-bg-number">
															<div class="panel-body">
																<div class="panel-title">
																	<span class="label pull-right layui-bg-blue">实时</span>
																	<h5>用户统计</h5>
																</div>
																<div class="panel-content">
																	<h1 class="no-margins" id="user"></h1>
																	<small>当前分类总记录数</small>
																</div>
															</div>
														</div>
													</div>
													<div class="layui-col-xs6">
														<div class="panel layui-bg-number">
															<div class="panel-body">
																<div class="panel-title">
																	<span class="label pull-right layui-bg-cyan">实时</span>
																	<h5>角色统计</h5>
																</div>
																<div class="panel-content">
																	<h1 class="no-margins" id="role"></h1>
																	<small>当前分类总记录数</small>
																</div>
															</div>
														</div>
													</div>
													<div class="layui-col-xs6">
														<div class="panel layui-bg-number">
															<div class="panel-body">
																<div class="panel-title">
																	<span class="label pull-right layui-bg-orange">实时</span>
																	<h5>权限统计</h5>
																</div>
																<div class="panel-content">
																	<h1 class="no-margins" id="permission"></h1>
																	<small>当前分类总记录数</small>
																</div>
															</div>
														</div>
													</div>
													<div class="layui-col-xs6">
														<div class="panel layui-bg-number">
															<div class="panel-body">
																<div class="panel-title">
																	<span class="label pull-right layui-bg-green">实时</span>
																	<h5>语料库数量统计</h5>
																</div>
																<div class="panel-content">
																	<h1 class="no-margins" id="Yw"></h1>
																	<small>当前分类总记录数</small>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="layui-col-md6">
									<div class="layui-card">
										<div class="layui-card-header"><i class="fa fa-credit-card icon icon-blue"></i>快捷入口</div>
										<div class="layui-card-body">
											<div class="welcome-module">

												<div class="layui-row layui-col-space10 layuimini-qiuck">
													<security:authorize access="hasRole('MNUM_user_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/user-list" data-title="用户管理" data-icon="fa fa-window-maximize">
																<i class="fa fa-window-maximize"></i>
																<cite>用户管理</cite>
															</a>
														</div>
													</security:authorize>
													<security:authorize access="hasRole('MNUM_role_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/role-list"  data-title="角色管理" data-icon="fa fa-gears">
																<i class="fa fa-gears"></i>
																<cite>角色管理</cite>
															</a>
														</div>
													</security:authorize>

													<security:authorize access="hasRole('MNUM_permission_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/permission-list" data-title="权限管理" data-icon="fa fa-file-text">
																<i class="fa fa-file-text"></i>
																<cite>权限管理</cite>
															</a>
														</div>
													</security:authorize>

													<security:authorize access="hasRole('MNUM_product_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/product-list"  data-title="授权管理" data-icon="fa fa-dot-circle-o">
																<i class="fa fa-dot-circle-o"></i>
																<cite>授权管理</cite>
															</a>
														</div>
													</security:authorize>

													<security:authorize access="hasRole('MNUM_order_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/yj-list"  data-title="预警管理" data-icon="fa fa-calendar">
																<i class="fa fa-calendar"></i>
																<cite>预警管理</cite>
															</a>
														</div>
													</security:authorize>

													<security:authorize access="hasRole('MNUM_order_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/tb-list"  data-title="数据分析" data-icon="fa fa-hourglass-end">
																<i class="fa fa-bar-chart-o"></i>
																<cite>数据分析</cite>
															</a>
														</div>
													</security:authorize>

													<security:authorize access="hasRole('MNUM_product_list')">
														<div class="layui-col-xs3 layuimini-qiuck-module">
															<a href="${pageContext.request.contextPath}/url/gg-list"  data-title="公告管理" data-icon="fa fa-snowflake-o">
																<i class="fa fa-snowflake-o"></i>
																<cite>公告管理</cite>
															</a>
														</div>
													</security:authorize>
													<div class="layui-col-xs3 layuimini-qiuck-module">
														<a href="${pageContext.request.contextPath}/url/syslog-list"  data-title="日志管理" data-icon="fa fa-snowflake-o">
															<i class="fa fa-hourglass-end "></i>
															<cite>日志管理</cite>
														</a>
													</div>

												</div>
											</div>
										</div>
									</div>

								</div>
								<div class="layui-col-md12">
									<div class="layui-card">
										<div class="layui-card-header"><i class="fa fa-line-chart icon"></i>报表统计</div>
										<div class="layui-card-body">
											<div id="echarts-records" style="width: 100%;min-height:500px"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="layui-col-md4">

							<div class="layui-card">
								<div class="layui-card-header"><i class="fa fa-bullhorn icon icon-tip"></i>系统公告</div>
								<div class="layui-card-body layui-text" style="width: 100%; height: 300px;overflow-x:auto;">
									<table id="dataList"
										   class="table table-bordered table-striped table-hover dataTable">

										<tbody id="item">

										</tbody>
									</table>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->

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


	<script src="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/apache-echarts/echarts.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/layuimini/lib/layui-v2.6.3/layui.js" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/plugins/layuimini/js/lay-config.js?v=1.0.4" charset="utf-8"></script>
<script>


	layui.use(['layer', 'miniTab','echarts'], function () {
		var $ = layui.jquery,
				layer = layui.layer,
				miniTab = layui.miniTab,
				echarts = layui.echarts;

		miniTab.listen();

		/**
		 * 查看公告信息
		 **/
		$('body').on('click', '.layuimini-notice', function () {
			var title = $(this).children('.layuimini-notice-title').text(),
					noticeTime = $(this).children('.layuimini-notice-extra').text(),
					content = $(this).children('.layuimini-notice-content').html();
			var html = '<div style="padding:15px 20px; text-align:justify; line-height: 22px;border-bottom:1px solid #e2e2e2;background-color: #2f4056;color: #ffffff">\n' +
					'<div style="text-align: center;margin-bottom: 20px;font-weight: bold;border-bottom:1px solid #718fb5;padding-bottom: 5px"><h4 class="text-danger">' + title + '</h4></div>\n' +
					'<div style="font-size: 12px">' + content + '</div>\n' +
					'</div>\n';
			parent.layer.open({
				type: 1,
				title: '系统公告'+'<span style="float: right;right: 1px;font-size: 12px;color: #b1b3b9;margin-top: 1px">'+noticeTime+'</span>',
				area: '300px;',
				shade: 0.8,
				id: 'layuimini-notice',
				btn: ['查看', '取消'],
				btnAlign: 'c',
				moveType: 1,
				content:html,
				success: function (layero) {
					var btn = layero.find('.layui-layer-btn');
					btn.find('.layui-layer-btn0').attr({
						href: 'https://gitee.com/zhongshaofa/layuimini',
						target: '_blank'
					});
				}
			});
		});

		/**
		 * 报表功能
		 */
		var user=$("#user").html();
		var role=$("#role").html();
		var permission=$("#permission").html();
		var Yw=$("#Yw").html();


		var myChart = echarts.init(document.getElementById('echarts-records'));
		var option;

		var option;

		var dataAxis = ['用户统计', '角色统计', '权限统计', '语料库统计'];
		var data = [user, role, permission, Yw];
		var yMax = 500;
		var dataShadow = [];

		for (var i = 0; i < data.length; i++) {
			dataShadow.push(yMax);
		}

		option = {
			title: {
				text: '数据统计',
			},
			xAxis: {
				data: dataAxis,
				axisLabel: {
					inside: true,
					textStyle: {
						color: '#fff'
					}
				},
				axisTick: {
					show: false
				},
				axisLine: {
					show: false
				},
				z: 10
			},
			yAxis: {
				axisLine: {
					show: false
				},
				axisTick: {
					show: false
				},
				axisLabel: {
					textStyle: {
						color: '#999'
					}
				}
			},
			dataZoom: [
				{
					type: 'inside'
				}
			],
			series: [
				{
					type: 'bar',
					showBackground: true,
					itemStyle: {
						color: new echarts.graphic.LinearGradient(
								0, 0, 0, 1,
								[
									{offset: 0, color: '#83bff6'},
									{offset: 0.5, color: '#188df0'},
									{offset: 1, color: '#188df0'}
								]
						)
					},
					emphasis: {
						itemStyle: {
							color: new echarts.graphic.LinearGradient(
									0, 0, 0, 1,
									[
										{offset: 0, color: '#2378f7'},
										{offset: 0.7, color: '#2378f7'},
										{offset: 1, color: '#83bff6'}
									]
							)
						}
					},
					data: data
				}
			]
		};

// Enable data zoom when user click bar.
		var zoomSize = 6;
		myChart.on('click', function (params) {
			console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
			myChart.dispatchAction({
				type: 'dataZoom',
				startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
				endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
			});
		});

		option && myChart.setOption(option);


		// echarts 窗口缩放自适应
		// window.onresize = function(){
		// 	echartsRecords.resize();
		// }

	});

		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});

			userName();

			getSelectIndex();

			selectNotice();

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
			setSidebarActive("admin-index");
		});


		//登录
		function userName() {
			var name=$("#name").val();
			$.ajax({
				url:"${pageContext.request.contextPath}/user/userSelectLoginID",
				data:{
					name:name
				},
				type:"post",
				dataType:"json",
				success:function (user) {

				}
			})
		}


		//获取 用户  角色   权限  语料库数量
		function getSelectIndex() {

			//用户
			selectUserIndex();
 			//角色
			selectRoleIndex();
			//权限
			selectPermissionIndex();
			//语料库数量
			selectYwIndex();

		}
	//用户
		function selectUserIndex() {
			$.ajax({
				url:"${pageContext.request.contextPath}/main/selectUserIndex",
				data:{

				},
				type:"get",
				dataType: "json",
				success:function (index) {
					$("#user").append(index);
				}
			})
		}
	//角色
	function selectRoleIndex() {
		$.ajax({
			url:"${pageContext.request.contextPath}/main/selectRoleIndex",
			data:{

			},
			type:"get",
			dataType: "json",
			success:function (index) {
				$("#role").append(index);
			}
		})
	}
	//权限
	function selectPermissionIndex() {
		$.ajax({
			url:"${pageContext.request.contextPath}/main/selectPermissionIndex",
			data:{

			},
			type:"get",
			dataType: "json",
			success:function (index) {
				$("#permission").append(index);
			}
		})
	}

	//语料库数量
	function selectYwIndex() {
		$.ajax({
			url:"${pageContext.request.contextPath}/main/selectYwIndex",
			data:{

			},
			type:"get",
			dataType: "json",
			success:function (index) {
				$("#Yw").append(index);
			}
		})
	}

	//获取公告栏信息
	function selectNotice() {
		$.ajax({
			url:"${pageContext.request.contextPath}/main/selectNoticeAll",
			type:"get",
			data:{

			},
			success:function(pageInfo){
				$("tbody").empty();

				$.each(pageInfo,function(index,item){
					console.log(item);
					$("tbody").append("<tr>"+
							"<td style='display:none'>"+item.id+"</td>"+
							"<td>"+item.title+"</td>"+
							"<td>"+item.noticeTime+"</td>"+
							"</td></tr>"
					);

				});
			}
		})
	}

	$("#item").on("click","tr",function () {
		var id=$(this).children("td").eq(0).text();
		$.ajax({
			url:"${pageContext.request.contextPath}/main/selectNoticeContext",
			type:"get",
			data:{
				id:id,
			},
			success:function(pageInfo){
				//示范一个公告层
				layer.open({
					type: 1
					,title: false //不显示标题栏
					,closeBtn: false
					,area: '300px;'
					,shade: 0.8
					,id: 'LAY_layuipro' //设定一个id，防止重复弹出
					,btn: ['关闭']
					,btnAlign: 'c'
					,moveType: 1 //拖拽模式，0或者1
					,content: '<div style="padding: 50px; line-height: 22px; background-color: #393D49; color: #fff; font-weight: 300;">'+pageInfo.context+'</div>'

				});

			}
		})

	})


	</script>
</body>

</html>