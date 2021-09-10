<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>Login</title>

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
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">


</head>

<body class="hold-transition login-page" style="background-image: url('${pageContext.request.contextPath}/img/fj1.jpg');height: 100%;width: 100%;background-size: 100%">
	<div class="login-box">

		<!-- /.login-logo -->
		<div class="login-box-body">

			<div class="login-logo">
				<a href="#">注册系统</a>
			</div>
			<%--<p class="login-box-msg">登录系统</p>--%>

			<form  method="post">
				<div class="form-group has-feedback">用户名
					<input type="text" id="name" name="username" class="form-control"
						placeholder="用户名">
				</div>
				<div class="form-group has-feedback">手机号
					<input type="text" name="mobile" id="mobile" class="form-control"
						   placeholder="手机号">
				</div>
				<div class="form-group has-feedback">密码
					<input type="password" name="password" class="form-control"
						placeholder="密码">
				</div>
				<div class="form-group has-feedback">重复密码
					<input type="password" name="passwordTwo" class="form-control"
						   placeholder="重复密码">
				</div>

				<div class="row">

					<!-- /.col -->
					
					<div class="col-xs-4"  style="left: 50px">
						<button type="button" id="btnSave" class="btn btn-primary btn-block btn-flat" >注册</button>
					</div>
					<div class="col-xs-4" style="left: 50px">
						<button type="button" class="btn btn-primary btn-block btn-flat" onclick="history.back(-1);">返回</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<%--<a href="#">忘记密码</a><br>--%>

		</div>
		<!-- /.login-box-body -->
	</div>
	<!-- /.login-box -->

	<!-- jQuery 2.2.3 -->
	<!-- Bootstrap 3.3.6 -->
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		SRC="${pageContext.request.contextPath}/plugins/layer/layer.js"></script>

<%--	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>--%>
	<%--<script>
		$(function() {
			$('input').iCheck({
				checkboxClass : 'icheckbox_square-blue',
				radioClass : 'iradio_square-blue',
				increaseArea : '20%' // optional
			});
		});
	</script>--%>
	<script type="text/javascript">

		//注册
		$(function () {
			$("#btnSave").click(function () {
				var name=$("input[name='username']").val();
				var mobile=$("input[name='mobile']").val();
				var password=$("input[name='password']").val();
				var passwordTwo=$("input[name='passwordTwo']").val();

				if (name!=""&&mobile!=""&&password!=""&&passwordTwo!=""){
					if(password==passwordTwo){

						$.ajax({
							url:"${pageContext.request.contextPath}/user/userSelectRegister",
							data:{
								name:name,
								mobile:mobile,
								password:password,
							},
							type:"post",
							dataType:"json",
							success:function (user) {
								if (user>0){
									layer.msg('注册成功');
									window.location="login.jsp";
								}else{
									layer.msg('注册失败，请重新注册');
								}
							}
						})
					}else{
						layer.msg('两次密码不一致！');
					}
				}else {
					layer.msg('请检查信息是否填写完整');
				}
			})

		})

		//判断电话号码是否被注册  user/userSelectMobile
		$("#mobile").blur(function () {
			var mobile=$("#mobile").val();
			var myreg = /^1[3456789]\d{9}$/;
			if (!myreg.test(mobile)){
				layer.msg('请输入正确电话号码');
				$("#mobile").val("");
			}else{
				var num=1;
				$.ajax({
					url:"${pageContext.request.contextPath}/user/userSelectMobile",
					type:"get",
					data:{
						mobile:mobile,
					},
					dataType: "json",
					success:function(page){
						if (page!=""&&num==1){
							layer.msg('手机号已被注册');
							$("#mobile").val("");
							num=0;
						}
					}
				})
			}
		})

		//判断用户名是否被注册
		$("#name").blur(function () {
			var name=$("#name").val();
			if (name!=""){
				var num=1;
				$.ajax({
					url:"${pageContext.request.contextPath}/user/userSelectLoginA",
					type:"get",
					data:{
						name:name,
					},
					success:function(pageInfo){
						if (pageInfo!=""&&num==1){
							layer.msg('用户名已经注册');
							$("#name").val("");
							num=0;
						}

					}
				})
			}else{
				layer.msg('请输入用户名!');
			}
		})


	</script>



</body>

</html>