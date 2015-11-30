<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="hot-food col-lg-12">
				<img width="1000px" src="<c:url value='/resources/default/img/hot-dishes.png'/>" />
			</div>
			<br/>
			<div class="district col-lg-12">
				<img width="1000px" src="<c:url value='/resources/default/img/district.png'/>" />
			</div>
		</div>
		<script src="<c:url value='/resources/default/js/page/homeIndex.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

