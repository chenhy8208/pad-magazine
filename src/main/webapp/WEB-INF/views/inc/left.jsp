<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Page Sidebar -->
<div class="page-sidebar" id="sidebar">
    <!-- Page Sidebar Header-->
    <div class="sidebar-header-wrapper">
        <input type="text" class="searchinput" />
        <i class="searchicon fa fa-search"></i>
        <div class="searchhelper">全局搜索</div>
    </div>
    <!-- /Page Sidebar Header -->
    <!-- Sidebar Menu -->
    <ul class="nav sidebar-menu">
        <!--Dashboard-->
        <c:if test="${empty normalPattern}">
        <li>
            <a href="index.jsp">
                <i class="menu-icon glyphicon glyphicon-home"></i>
                <span class="menu-text"> 杂志编辑 </span>
            </a>
        </li>
        </c:if>

        <c:if test="${not empty normalPattern}">
            <li>
                <a href="/">
                    <i class="menu-icon glyphicon glyphicon-home"></i>
                    <span class="menu-text"> 返回 </span>
                </a>
            </li>
            <li>
                <a href="${normalPattern}">
                    <i class="menu-icon fa fa-pencil-square-o"></i>
                    <span class="menu-text"> 普通模式 </span>
                </a>
            </li>
        </c:if>

        <c:if test="${not empty pagePattern}">
            <li>
                <a target="_blank" href="${pagePattern}">
                    <i class="menu-icon fa fa-th"></i>
                    <span class="menu-text"> 页码模式 </span>
                </a>
            </li>
        </c:if>
    </ul>
    <!-- /Sidebar Menu -->
</div>
<!-- /Page Sidebar -->