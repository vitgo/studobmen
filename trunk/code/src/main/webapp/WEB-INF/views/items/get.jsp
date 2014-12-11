<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="row">
	<div class="span8 offset2 center-text">
		<form method="POST" action="${pageContext.request.contextPath}/items/congradulations">
			<input type="hidden" name="itemId" value="${itemId}" />
			<h2><spring:message code="get_last_step" /></h2>
			<p><spring:message code="get_instructions" arguments="${itemType}" /></p>
			<p class="control-group"><input type="text" id="userEmailInput" name="userEmail" /></p>
			<p><input type="submit" class="btn btn-success" id="submitUserEmailBtn" value="<spring:message code='items_get' />" /></p>
		</form>
	</div>
</div>