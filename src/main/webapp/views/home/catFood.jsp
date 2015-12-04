<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<c:if test="${fn:length(listFoods) eq 0}">
			<h3>No restaurant</h3>
		</c:if>
		<div class="row" style="width: 980px;margin-left: 3px;">
			<h4 style="margin-left: 5px; font-size: 13px;font-weight: bold;">Food</h4>
			<c:forEach var="food" items="${listFoods}">
				<div class='col-lg-3'>
					<a href="<c:url value='/food/${food.id}'/>" ><img style="margin-top: 10px;" width="150px" src="${food.image.absolutelyPath}"> </a> 
					<span class="district-title" style="display:block;color:blue;font-weight: bold;font-size: 11px;">${food.name}</span>
				</div>
			</c:forEach>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/districtHome.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

