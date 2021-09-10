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
	<div class="login-box" style="top: 50px">

		<!-- /.login-logo -->
		<div class="login-box-body" >

			<div class="login-logo">
				<a href="#">语料库管理系统</a>
			</div>
			<%--<p class="login-box-msg">登录系统</p>--%>

			<form method="post" action="${pageContext.request.contextPath}/user/userSelectLogin">
				<div class="form-group has-feedback">
					<input type="text" name="username" class="form-control"
						placeholder="用户名"> <span
						class="glyphicon glyphicon-envelope form-control-feedback"></span>
				</div>
				<div class="form-group has-feedback">
					<input type="password" name="password" class="form-control"
						placeholder="密码"> <span
						class="glyphicon glyphicon-lock form-control-feedback"></span>
				</div>
				<div class="row">
					<!-- /.col -->

					<div class="col-xs-4"  style="left: 50px">
						<button id="btnSave" type="submit" class="btn btn-primary btn-block btn-flat" >登录</button>
					</div>
					<div class="col-xs-4" style="left: 50px">
						<button type="button" class="btn btn-primary btn-block btn-flat" onclick="window.location.href='${pageContext.request.contextPath}/register.jsp'">注册</button>
					</div>
					<!-- /.col -->
				</div>
			</form>

			<%--<a href="#">忘记密码</a><br>--%>

		</div>
		<!-- /.login-box-body -->
		<!-- 底部导航 -->

		<!-- 底部导航 /-->
	</div>
	<!-- /.login-box -->

	<div style="position:fixed; left:0px; bottom:0px; width:100%; z-index:999;height: 40px">
		<footer style="width: 100%;background-color: white;height: 40px">

			<div  style="float: left;padding: 10px;" >&nbsp;
				<b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;copyright：湖北工程学院 </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 大学生心理健康语料库管理系统  2021-2025
			</div>
			<div class="pull-right hidden-xs" style="padding: 10px">
				<b>Version</b> 1.2.0
			</div>

		</footer>
	</div>
	<!-- jQuery 2.2.3 -->
	<!-- Bootstrap 3.3.6 -->
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
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

		//登录
		<%--$(function () {--%>
		<%--	$("#btnSave").click(function () {--%>
		<%--		var mobile=$("input[name='username']").val();--%>
		<%--		var password=$("input[name='password']").val();--%>
		<%--		if (mobile!=""&&password!=""){--%>
		<%--			$.ajax({--%>
		<%--				url:"${pageContext.request.contextPath}user/userSelectLogin",--%>
		<%--				data:{--%>
		<%--					mobile:mobile,--%>
		<%--					password:password--%>
		<%--				},--%>
		<%--				type:"post",--%>
		<%--				dataType:"json",--%>
		<%--				success:function (user) {--%>
		<%--					if (user!=null&&user!=""){--%>
		<%--						window.location.href="${pageContext.request.contextPath}/url/main?id="+user.id+"&name="+user.name;--%>
		<%--					}else{--%>
		<%--						alert("账号或密码错误");--%>
		<%--					}--%>
		<%--				}--%>
		<%--			})--%>
		<%--		}else {--%>
		<%--			alert("请检查信息是否填写完整！");--%>
		<%--		}--%>
		<%--	})--%>

		<%--})--%>

	</script>
</body>

</html>