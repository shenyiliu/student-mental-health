
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() +request.getContextPath()+"/";
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user8-128x128.jpg"
                     class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <%--获取当前用户姓名--%>
                    <security:authentication property="principal.username"></security:authentication>
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>
			<li id="admin-index">
                <a href="${pageContext.request.contextPath}/url/main">
                    <i class="fa fa-dashboard"></i>
                    <span>首页</span>
                </a>
            </li>
			<li class="treeview">
                <a href="#">
                    <i class="fa fa-cogs"></i>
                    <span>系统管理</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
			    </a>
				<ul class="treeview-menu">
					<li id="admin-user">
						 <security:authorize access="hasRole('MNUM_user_list')">
                            <%--只有ADMIN用户才能看到用户管理--%>
                            <a href="${pageContext.request.contextPath}/url/user-list">
                                <i class="fa fa-circle-o"></i> 用户管理
                            </a>
                        </security:authorize>
					</li>
					<li id="admin-role">
                        <security:authorize access="hasRole('MNUM_role_list')">
                            <a href="${pageContext.request.contextPath}/url/role-list">
                                <i class="fa fa-circle-o"></i>角色管理
                            </a>
                        </security:authorize>

                    </li>
					<li id="admin-permission">
                        <security:authorize access="hasRole('MNUM_permission_list')">
                        <a href="${pageContext.request.contextPath}/url/permission-list">
							<i class="fa fa-circle-o"></i>权限管理
					    </a>
                        </security:authorize>
                    </li>
                    <li id="permission_role">
                        <security:authorize access="hasRole('MNUM_product_list')">
                        <a href="${pageContext.request.contextPath}/url/product-list">
                            <i class="fa fa-circle-o"></i>授权管理
                        </a>
                        </security:authorize>
                    </li>
                    <li id="admin-syslog">
                        <a href="${pageContext.request.contextPath}/url/syslog-list">
                            <i class="fa fa-circle-o"></i>日志管理
                        </a>
                    </li>
				</ul>
            </li>
			<li class="treeview">
                <a href="#">
                    <i class="fa fa-cube"></i>
					<span>基础数据</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
				    </span>
			    </a>
				<ul class="treeview-menu">
<%--					<li id="admin-order">--%>
<%--                        <security:authorize access="hasRole('MNUM_order_list')">--%>
<%--                            <a href="${pageContext.request.contextPath}/url/order-list">--%>
<%--                                <i class="fa fa-circle-o"></i>订单管理--%>
<%--                            </a>--%>
<%--                        </security:authorize>--%>

<%--                    </li>--%>
                    <li id="admin-yj">
                        <security:authorize access="hasRole('MNUM_order_list')">
                            <a href="${pageContext.request.contextPath}/url/yj-list">
                                <i class="fa fa-circle-o"></i>预警管理
                            </a>
                        </security:authorize>
                    </li>
                    <li id="admin-fx">
                        <security:authorize access="hasRole('MNUM_order_list')">
                            <a href="${pageContext.request.contextPath}/url/tb-list">
                                <i class="fa fa-circle-o"></i>数据分析
                            </a>
                        </security:authorize>
                    </li>

                    <li id="admin-gg">
                        <security:authorize access="hasRole('MNUM_product_list')">
                            <a href="${pageContext.request.contextPath}/url/gg-list">
                                <i class="fa fa-circle-o"></i>公告管理
                            </a>
                        </security:authorize>
                    </li>
				</ul>
            </li>
		</ul>
	</section>
	<!-- /.sidebar -->
</aside>

