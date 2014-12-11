<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="row">
	<div class="span12">
		<table class="indexLayout">
			<tbody>
				<tr>
					<td>
						<input id="SearchInput" class="indexInput input-xxlarge" placeholder="<spring:message code='index_input_placeholder' />" type="text">
						<a id="SearchButton" class="btn" href="${pageContext.request.contextPath}/items/search/"><spring:message code="search_button" /></a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>