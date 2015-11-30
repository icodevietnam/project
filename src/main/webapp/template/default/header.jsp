<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row border-bottom">
	<nav class="navbar navbar-static-top" role="navigation"
		style="margin-bottom: 0">
		<div class="navbar-header">
			<a class="navbar-minimalize minimalize-styl-2 btn btn-primary "
				href="#"><i class="fa fa-bars"></i> </a>
			<form role="search" class="navbar-form-custom"
				action="search_results.html">
				<div class="form-group">
					<input type="text" placeholder="Tìm kiếm..."
						class="form-control" name="top-search" id="top-search">
				</div>
			</form>
		</div>
		<ul class="nav navbar-top-links navbar-right">
			<li><span class="m-r-sm text-muted welcome-message">Hello,
					<strong><%= request.getUserPrincipal().getName() %>  </strong> ! </span></li>
			<li class="dropdown"><a class="count-info"
				href="<c:url value='/admin/viewNoti'/>"> <i class="fa fa-bell"></i> <span
					class="label label-primary">${countNav}</span>
			</a>
			</li>


			<li><a href="<c:url value='/j_spring_security_logout'/>"> <i
					class="fa fa-sign-out"></i> Log out
			</a></li>
		</ul>

	</nav>
</div>
<div class="row wrapper border-bottom white-bg page-heading">
	<div class="col-lg-10">
		<h2>${pageName}</h2>
		<ol class="breadcrumb">
			<li><a href="<c:url value='/admin/home'/>">Home</a></li>
			<li class="active"><strong>${pageName}</strong></li>
		</ol>
	</div>
	<div class="col-lg-2"></div>
</div>