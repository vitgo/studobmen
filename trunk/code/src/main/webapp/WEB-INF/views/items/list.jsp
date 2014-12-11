<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="row">
	<div class="span12">
		<table class="table">
			<caption>${term} <small>(<a href="${pageContext.request.contextPath}/"><spring:message code="items_change_term" /></a>)</small></caption>
			<tbody>
				<tr class="font-light">
					<td><spring:message code="item_discipline" /></td>
					<td><spring:message code="items_list_type" /></td>
					<td><spring:message code="item_ei" /></td>
					<td><spring:message code="item_teacher" /></td>
					<td><spring:message code="item_is_electronic" /></td>
					<td></td>
				</tr>
				<c:forEach items="${items}" var="item">
					<tr>
						<td>${item.discipline}</td>
						<td>${item.type}</td>
						<td>${item.ei}</td>
						<td>${item.teacher}</td>
						<td>
							<c:choose>
								<c:when test="${item.isElectronic}">
									<img class="ico" src="${pageContext.request.contextPath}/assets/images/yes-icon.png" />	
								</c:when>
								<c:otherwise>
									<img class="ico" src="${pageContext.request.contextPath}/assets/images/no-icon.png" />
								</c:otherwise>
							</c:choose>
						</td>
						<td><a class="btn btn-mini btn-success showItemBtn" href="#showItemForm" data-toggle="modal"><spring:message code="items_get" /></a></td>
						<td class="hide itemId">${item.id}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div id="showItemForm" class="modal hide fade in">
		<form method="POST" action="${pageContext.request.contextPath}/items/get" class="non-margined">
			<input type="hidden" name="id" id="ItemId" />
			<div class="modal-header">
				<button type='button' class='close' data-dismiss='modal'>×</button>
				<h3><span id="ItemType">Report</span></h3>
			</div>
			<div class="modal-body form-horizontal">
				<div class="control-group">
					<label class="control-label"><spring:message code="item_discipline" />:</label>
					<div class="controls">
						<span id="ItemDiscipline">Discipline</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><spring:message code="item_ei" />:</label>
					<div class="controls">
						<span id="ItemEi">University</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><spring:message code="item_teacher" />:</label>
					<div class="controls">
						<span id="ItemTeacher">Teacher</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><spring:message code="item_is_electronic" />:</label>
					<div class="controls">
						<span id="ItemIsElectronic">
							<img class="ico yes-icon" src="${pageContext.request.contextPath}/assets/images/yes-icon.png" />
							<img class="ico no-icon" src="${pageContext.request.contextPath}/assets/images/no-icon.png" />
						</span>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label"><spring:message code="items_list_price" />:</label>
					<div class="controls">
						<span id="ItemPrice">Some offer</span>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<input id="ItemGetBtn" class="btn btn-success" type="submit" value="<spring:message code="items_get" />" />
			</div>
		</form>
	</div>
</div>
