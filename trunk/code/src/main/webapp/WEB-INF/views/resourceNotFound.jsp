<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div>
	<spring:message var="title" code="error_resourcenotfound_title" htmlEscape="false" />
	<h2>${fn:escapeXml(title)}</h2>
	<p>
		<spring:message code="error_resourcenotfound_problemdescription" />
	</p>
	<c:if test="${not empty exception}">
		<p>
		<h4>
			<spring:message code="exception_details" />
		</h4>
		<spring:message var="message" code="exception_message"
			htmlEscape="false" />
		<c:out value="${exception.localizedMessage}" />
		<spring:message var="stacktrace" code="exception_stacktrace" htmlEscape="false" />
		<c:forEach items="${exception.stackTrace}" var="trace">
			<c:out value="${trace}" />
			<br />
		</c:forEach>
		</p>

	</c:if>
</div>