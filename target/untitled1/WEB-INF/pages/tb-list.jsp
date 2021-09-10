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

<title>数据分析</title>
<meta name="description" content="数据分析">
<meta name="keywords" content="数据分析">

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
					数据分析 <small>数据图表</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/url/main"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li><a href="${pageContext.request.contextPath}/url/yj-list">数据分析</a></li>
					<li class="active">数据分析</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">

				<!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">图表</h3>
						<input type="hidden" id="user_id" value="${sessionScope.userInfo.id}">
					</div>

					<div class="box-body">
						<div style="width: 50%;height: 600px;float: left;" id="yuanBing">

						</div>
						<div style="width: 50%;height: 600px;float: left;" id="LeiDa">

						</div>
						<div id="zhiFang" style="width: 100%;height: 500px;float: left;">

						</div>

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

	<script src="${pageContext.request.contextPath}/plugins/apache-echarts/echarts.js"></script>

	<script>





		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});



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
			setSidebarActive("admin-fx");

		});

	</script>
</body>
<script type="text/javascript">
	//圆饼图表
	$(document).ready(function () {

		$.ajax({
			url:"${pageContext.request.contextPath}/notice/selectAVG",
			type:"get",
			dataType:"json",
			success:function (info) {
				//圆饼图表
				var chartDom = document.getElementById('yuanBing');
				var myChart = echarts.init(chartDom);
				var option;

				option = {
					title: {
						text: '语料数据统计',
						left: 'left'
					},
					tooltip: {
						trigger: 'item',
						formatter: '{a} <br/>{b}: {c} ({d}%)'
					},
					legend: {
						top:30,
						data: ['躯体化', '强迫症状', '人际关系敏感', '抑郁', '焦虑', '敌对', '恐怖', '偏执', '精神病性', '其他','总分','平均分','阴性项目数','阳性项目数','预警分值']
					},
					series: [
						{
							name: '数据统计',
							type: 'pie',
							selectedMode: 'single',
							radius: [0, '30%'],
							label: {
								position: 'inner',
								fontSize: 14,
							},
							labelLine: {
								show: false
							},
							data: [
								{value: info.jg, name: '健康'},
								{value: ( info.sum-info.jg ), name: '不健康'}
							]
						},
						{
							name: '数据统计',
							type: 'pie',
							radius: ['45%', '60%'],
							labelLine: {
								length: 30,
							},
							label: {
								rich: {
									a: {
										color: '#6E7079',
										lineHeight: 22,
										align: 'center'
									},
									hr: {
										borderColor: '#8C8D8E',
										width: '100%',
										borderWidth: 1,
										height: 0
									},
									b: {
										color: '#4C5058',
										fontSize: 14,
										fontWeight: 'bold',
										lineHeight: 33
									},
									per: {
										color: '#fff',
										backgroundColor: '#4C5058',
										padding: [3, 4],
										borderRadius: 4
									}
								}
							},
							data: [
								{value: info.qth,name: '躯体化'},
								{value: info.qpzz, name: '强迫症状'},
								{value: info.rjgxmg, name: '人际关系敏感'},
								{value: info.yy, name: '抑郁'},
								{value: info.jl, name: '焦虑'},
								{value: info.dd, name: '敌对'},
								{value: info.kb, name: '恐怖'},
								{value: info.pz, name: '偏执'},
								{value: info.jsbx, name: '精神病性'},
								{value: info.qt, name: '其他'},
								{value: info.zf, name: '总分'},
								{value: info.pjf, name: '平均分'},
								{value: info.yinxxms, name: '阴性项目数'},
								{value: info.yangxxms, name: '阳性项目数'},
								{value: info.yjfz, name: '预警分值'},

							]
						}
					]
				};

				option && myChart.setOption(option);
			}
		})


	});

	var $bjkData=[];
	//柱状折线图
	$(document).ready(function () {

		//获取不健康数据
		bjk();

	});

	//获取不健康数据
	function bjk() {
		$.ajax({
			url:"${pageContext.request.contextPath}/notice/selectBzcAVG",
			type:"get",
			dataType:"json",
			success:function (info) {
				$bjkData=[
					info.qth,
					info.qpzz,
					info.rjgxmg,
					info.yy,
					info.jl,
					info.dd,
					info.kb,
					info.pz,
					info.jsbx,
					info.qt,
					info.zf,
					info.pjf,
					info.yinxxms,
					info.yangxxms,
					info.yjfz,
				];
				bjkvalue($bjkData);
				//显示雷达图
				LeiDa($bjkData);
			}
		});

	}

	//正常数据
	function bjkvalue(bjkData) {
		$.ajax({
			url:"${pageContext.request.contextPath}/notice/selectZcAVG",
			type:"get",
			dataType:"json",
			success:function (info) {

				// Generate data
				var category = ['躯体化', '强迫症状', '人际关系敏感', '抑郁', '焦虑', '敌对', '恐怖', '偏执', '精神病性', '其他','总分','平均分','阴性项目数','阳性项目数','预警分值'];

				var dottedBase = [];
				var lineData = bjkData;
				var barData = [
					info.qth,
					info.qpzz,
					info.rjgxmg,
					info.yy,
					info.jl,
					info.dd,
					info.kb,
					info.pz,
					info.jsbx,
					info.qt,
					info.zf,
					info.pjf,
					info.yinxxms,
					info.yangxxms,
					info.yjfz,
				];
				var rateData = [];

				for (var i = 0; i < 33; i++) {
					// var date = i+2001;
					// category.push(date)
					var rate=barData[i]/lineData[i];
					rateData[i] = rate.toFixed(2);
				}

				var chartDom = document.getElementById('zhiFang');
				var myChart = echarts.init(chartDom);
// option
				option = {
					title: {
						text: '健康与不健康情况',
						top:10,
						x: 'left',
						y: 0,
						textStyle:{
							color:'black',
							fontSize:16,
							fontWeight:'normal',
						},

					},
					backgroundColor: 'white',
					tooltip: {
						trigger: 'axis',
						backgroundColor:'rgba(156,107,211,0.5)',
						axisPointer: {
							type: 'shadow',
							label: {
								show: true,
								backgroundColor: '#7B7DDC'
							}
						}
					},
					legend: {
						data: ['不健康', '健康','健康/不健康 比值',],
						textStyle: {
							color: '#B4B4B4',
						},
						top:'7%',
					},
					grid:{
						x:'12%',
						width:'82%',
						y:'12%',
					},
					xAxis: {
						data: category,
						axisLine: {
							lineStyle: {
								color: '#B4B4B4'
							}
						},
						axisTick:{
							show:false,
						},
					},
					yAxis: [{

						splitLine: {show: false},
						axisLine: {
							lineStyle: {
								color: '#B4B4B4',
							}
						},

						axisLabel:{
							formatter:'{value} ',
						}
					},
						{

							splitLine: {show: false},
							axisLine: {
								lineStyle: {
									color: '#B4B4B4',
								}
							},
							axisLabel:{
								formatter:'{value} ',
							}
						}],

					series: [{
						name: '健康/不健康 比值',
						type: 'line',
						smooth: true,
						showAllSymbol: true,
						symbol: 'emptyCircle',
						symbolSize: 8,
						yAxisIndex: 1,
						itemStyle: {
							normal: {
								color:'#F02FC2'},
						},
						data: rateData
					},

						{
							name: '健康',
							type: 'bar',
							barWidth: 20,
							itemStyle: {
								normal: {
									barBorderRadius: 5,
									color: new echarts.graphic.LinearGradient(
											0, 0, 0, 1,
											[
												{offset: 0, color: '#956FD4'},
												{offset: 1, color: '#3EACE5'}
											]
									)
								}
							},
							data: barData
						},

						{
							name: '不健康',
							type: 'bar',
							barGap: '-100%',
							barWidth: 20,
							itemStyle: {
								normal: {
									barBorderRadius: 5,
									color: new echarts.graphic.LinearGradient(
											0, 0, 0, 1,
											[
												{offset: 0, color: 'rgba(156,107,211,0.5)'},
												{offset: 0.2, color: 'rgba(156,107,211,0.3)'},
												{offset: 1, color: 'rgba(156,107,211,0)'}
											]
									)
								}
							},
							z: -12,

							data: lineData
						},
					]
				};

				option && myChart.setOption(option);

			}
		});
	}

	//雷达图
	function LeiDa(bjkData) {
		$.ajax({
			url:"${pageContext.request.contextPath}/notice/selectZcAVG",
			type:"get",
			dataType:"json",
			success:function (info) {
				var barData = [
					info.qth,
					info.qpzz,
					info.rjgxmg,
					info.yy,
					info.jl,
					info.dd,
					info.kb,
					info.pz,
					info.jsbx,
					info.qt,
					info.zf,
					info.pjf,
					info.yinxxms,
					info.yangxxms,
					info.yjfz,
				];
				var chartDom = document.getElementById('LeiDa');
				var myChart = echarts.init(chartDom);
				var option = {
					title: {
						text: '雷达图',
					},
					tooltip: {},
					legend: {
						top: 20,
						itemWidth: 12,
						itemHeight: 12,
						data: ['健康', '不健康'],
						textStyle: {
							color: 'black',
						},
					},
					radar: {
						radius: '60%',
						splitNumber: 8,
						axisLine: {
							lineStyle: {
								color: 'black',
								opacity: 0.2,
							},
						},
						splitLine: {
							lineStyle: {
								color: 'black',
								opacity: 0.2,
							},
						},
						splitArea: {
							areaStyle: {
								color: '#D2D7FD',
								opacity: 1,
								shadowBlur: 0,
								shadowColor: 'black',
								shadowOffsetX: 0,
								shadowOffsetY: 0,
							},
						},
						indicator: [
							{
								name: '躯体化',
								max: 5,
							},
							{
								name: '强迫症状',
								max: 5,
							},
							{
								name: '人际关系敏感',
								max: 5,
							},
							{
								name: '抑郁',
								max: 5,
							},
							{
								name: '焦虑',
								max: 5,
							},
							{
								name: '敌对',
								max: 5,
							},
							{
								name: '恐怖',
								max: 5,
							},
							{
								name: '偏执',
								max: 5,
							},
							{
								name: '精神病性',
								max: 5,
							},
							{
								name: '其他',
								max: 5,
							},
							{
								name: '总分',
								max: 250,
							},
							{
								name: '平均分',
								max: 5,
							},
							{
								name: '阴性项目数',
								max: 100,
							},
							{
								name: '阳性项目数',
								max: 100,
							},
							{
								name: '预警分值',
								max: 150,
							},
						],
					},
					series: [
						{
							name: '预算 vs 开销',
							type: 'radar',
							itemStyle: {
								normal: {
									lineStyle: {
										color: '#4A99FF',
										// shadowColor: '#4A99FF',
										// shadowBlur: 10,
									},
									shadowColor: '#4A99FF',
									shadowBlur: 10,
								},
							},
							areaStyle: {
								normal: { // 单项区域填充样式
									color: {
										type: 'linear',
										x: 0, //右
										y: 0, //下
										x2: 1, //左
										y2: 1, //上
										colorStops: [{
											offset: 0,
											color: '#4A99FF'
										}, {
											offset: 0.5,
											color: 'rgba(0,0,0,0)'
										}, {
											offset: 1,
											color: '#4A99FF'
										}],
										globalCoord: false
									},
									opacity: 1 // 区域透明度
								}
							},
							data: [
								{
									value:barData,
									name: '健康',
								},
							],
						},
						{
							name: '预算 vs 开销',
							type: 'radar',
							symbolSize: 0,
							itemStyle: {
								normal: {
									lineStyle: {
										color: '#4BFFFC',
										// shadowColor: '#4BFFFC',
										// shadowBlur: 10,
									},
									shadowColor: '#4BFFFC',
									shadowBlur: 10,
								},
							},
							areaStyle: {
								normal: { // 单项区域填充样式
									color: {
										type: 'linear',
										x: 0, //右
										y: 0, //下
										x2: 1, //左
										y2: 1, //上
										colorStops: [{
											offset: 0,
											color: '#4BFFFC'
										}, {
											offset: 0.5,
											color: 'rgba(0,0,0,0)'
										}, {
											offset: 1,
											color: '#4BFFFC'
										}],
										globalCoord: false
									},
									opacity: 1 // 区域透明度
								}
							},
							data: [
								{
									value: bjkData,
									name: '不健康',
								},
							],
						},

					],
					color:['#4A99FF','#4BFFFC'],
					backgroundColor: 'white',
				};
				option && myChart.setOption(option);

			}
		});


	}
</script>
</html>