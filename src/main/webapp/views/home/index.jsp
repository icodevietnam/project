<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="home col-lg-11">
				<div class="title">External examining</div>
				<div class="content">The HEA’s External examining handbook is a reference
					source for external examiners and brings together the outcomes from
					research and development in the field. The guidance is supported by
					evidence derived from the collective experience of practising
					examiners – staff who support the process, research studies and
					publications. Case studies are used to illustrate issues that can
					arise in external examiner practice. In collaboration with the QAA,
					the HEA has published a research report on external examiners’
					understanding and use of academic standards. The research aims to
					help the sector understand how external examiners comprehend
					academic standards and how they use that understanding to give
					advice and recommendations to their institution. For more
					information around external examining, join the JISC mailing list
					or see the archives. - See more at:
					https://www.heacademy.ac.uk/enhancement/themes/assessment-and-feedback/external-examining#sthash.cxqsYguc.dpuf
				</div>
			</div>
		</div>
		<script src="<c:url value='/resources/default/js/page/homeIndex.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

