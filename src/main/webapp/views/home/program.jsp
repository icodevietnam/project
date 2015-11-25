<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<tiles:insertDefinition name="homeTemplate">
	<tiles:putAttribute name="body">
		<div class="row">
			<div class="col-lg-11">
				<div class="panel-group" id="accordion" role="tablist"
					aria-multiselectable="true">
					<c:forEach var="program" items="${listPrograms}">
						<fmt:parseNumber var="programScore" type="number"
							value="${program.typeOfGrade}" />
						<div class="panel panel-primary">
							<div class="panel-heading" role="tab" id="${program.code}">
								<h4 class="panel-title">
									<a role="button" data-toggle="collapse"
										data-parent="#accordion" href="#collapse${program.code}"
										aria-expanded="true" aria-controls="#collapse${program.code}">
										${program.code} - ${program.name}</a>
								</h4>
							</div>
							<div id="#collapse${program.code}"
								class="panel-collapse collapse in" role="tabpanel"
								aria-labelledby="${program.code}">
								<div class="panel-body">
									${program.name} <br />
									<div class="col-lg-7">
										<ul class="list-group">
											<li class="list-group-item">Grade :
												${program.typeOfGrade}</li>
											<li class="list-group-item">Conduct :
												${program.typeOfConduct}</li>
											<li class="list-group-item">Year :
												${program.academicYear}</li>
											<li class="list-group-item">Programer Leader:
												${program.pl.fullName}</li>
											<li class="list-group-item">External Examiner:
												${program.ee.fullName}</li>
										</ul>
									</div>
									<br />
								</div>
								<c:if test=""></c:if>
								<c:if
									test="${average >= programScore && student.certificated.conduct == program.typeOfConduct}">
									<button style="margin-left: 15px; margin-bottom: 15px;"
										id="btnSubmitReport" class="btn btn-primary"
										onclick="joinProgram(${student.id},'${program.code}')">Join
										Program</button>
								</c:if>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<script
			src="<c:url value='/resources/default/js/page/programHome.js'/>"></script>
	</tiles:putAttribute>
</tiles:insertDefinition>

