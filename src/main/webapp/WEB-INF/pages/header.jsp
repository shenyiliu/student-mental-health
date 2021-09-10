<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- 页面头部 -->
<header class="main-header" style="background-color: black" >
	<!-- Logo -->
	<a href="${pageContext.request.contextPath}/url/main" class="logo" style="background-color: #222D32"> <!-- mini logo for sidebar mini 50x50 pixels -->
		<span class="logo-mini">心理健康</span> <!-- logo for regular state and mobile devices -->
		<span class="logo-lg"><b>大学生心理健康语料库管理系统</b></span>
	</a>
	<!-- Header Navbar: style can be found in header.less -->
	<nav class="navbar navbar-static-top" style="background-color:#222D32">
		<!-- Sidebar toggle button-->
		<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
		   role="button"> <span class="sr-only">Toggle navigation</span>
		</a>

		<div class="navbar-custom-menu">
			<ul class="nav navbar-nav">
				<li class="dropdown user user-menu">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<img src="${pageContext.request.contextPath}/img/user8-128x128.jpg" class="user-image" alt="User Image">
						<span class="hidden-xs">
							<%--获取登录用户的姓名--%>
							<security:authentication property="principal.username"></security:authentication>
						</span>
					</a>
					<ul class="dropdown-menu" >
						<!-- User image -->
						<li class="user-header" style="background-color: #222D32">
							<img src="${pageContext.request.contextPath}/img/user8-128x128.jpg" class="img-circle" alt="User Image">
						</li>
						<!-- Menu Footer-->
						<li class="user-header" style="width: 100%;height: 20%;background-color: #222D32">
							<div class="pull-right-container">
								<a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-default btn-flat" style="background-color: #8aa4af;color: white">注销</a>
							</div>
						</li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</header>
<!-- 页面头部 /-->