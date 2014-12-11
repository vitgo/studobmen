<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="row">
	<div class="span6 offset2">
			<form:form commandName="item" method="POST" class="form-horizontal" action="${pageContext.request.contextPath}/items">
				<form:hidden path="status" />
				<form:hidden path="publishDate" />
				<form:hidden path="owner.id" />
				<div id="ItemDisciplineInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_discipline" />
					</label>
					<div class="controls">
						<spring:message code='create_discipline' var="discipline_info"/>
						<form:input path="discipline" class="input-xlarge" placeholder="${discipline_info}" />
					</div>
				</div>
				<div id="ItemEiInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_ei" />
					</label>
					<div class="controls">
						<spring:message code='create_ei' var="ei_info"/>
						<form:input path="ei" class="input-xlarge"  placeholder="${ei_info}"/>
					</div>
				</div>
				<div id="ItemTeacherInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_teacher" />
					</label>
					<div class="controls">
						<spring:message code='create_teacher' var="teacher_info" />
						<form:input path="teacher" class="input-xlarge"  placeholder="${teacher_info}" />
					</div>
				</div>
				<div id="ItemTypeInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_type" />
					</label>
					<div class="controls">
						<spring:message code='create_type' var="type_info" />
						<form:input path="type" class="input-xlarge" placeholder="${type_info}" />
					</div>
				</div>
				<div id="ItemDescriptionInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_description" />
					</label>
					<div class="controls">
						<spring:message code='create_description' var="description_info" />						
						<form:textarea path="description" class="input-xlarge"  placeholder="${description_info}" />
					</div>
				</div>
				<div id="ItemIsElectronicInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_is_electronic" />
					</label>
					<div class="controls">
						<form:checkbox path="isElectronic" />
					</div>
				</div>
				<div id="ItemEmailInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_owner_email" />
					</label>
					<div class="controls">
						<spring:message code='create_email' var="email_info"/>
						<form:input path="owner.email" class="input-xlarge" placeholder="${email_info}" /> 
					</div>
				</div>
				<div id="ItemPriceInput" class="control-group">
					<label class="control-label">
						<spring:message code="item_price" />
					</label>
					<div class="controls">
						<spring:message code='create_price' var="price_info" />
						<form:input path="price" class="input-xlarge" placeholder="${price_info}" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<input type="submit" id="ItemSubmitBtn" class="btn btn-success" value='<spring:message code="add_item" />' />
					</div> 
				</div>
			</form:form>
	</div>
</div>
