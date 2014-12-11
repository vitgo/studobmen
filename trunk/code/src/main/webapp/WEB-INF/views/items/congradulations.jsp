<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div class="row">
	<div class="span12">
		<div class="hero-unit">
			<h1><spring:message code="congradulations" /></h1>
			<p><spring:message code="change_instruction" arguments="${item.type},${item.price},${userEmail}" /></p>
		</div>
	</div>
</div>