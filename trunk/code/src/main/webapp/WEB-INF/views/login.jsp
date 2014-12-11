<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<div>
  <spring:message code="security_login_title" var="title" htmlEscape="false" />
    <c:if test="${not empty param.login_error}">
      <div class="errors">
        <p>
          <spring:message code="security_login_unsuccessful" />
          <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
          .
        </p>
      </div>
    </c:if>
    <c:if test="${empty param.login_error}">
      <p>
        <spring:message code="security_login_message" />
      </p>
    </c:if>
    <spring:url value="/resources/j_spring_security_check" var="form_url" />
    <form name="f" action="${fn:escapeXml(form_url)}" method="POST">
      <div>
        <label for="j_username">
          <spring:message code="security_login_form_name" />
        </label>
        <input id="j_username" type='text' name='j_username' style="width:150px" />
        <spring:message code="security_login_form_name_message" var="name_msg" htmlEscape="false" />
      </div>
      <br />
      <div>
        <label for="j_password">
          <spring:message code="security_login_form_password" />
        </label>
        <input id="j_password" type='password' name='j_password' style="width:150px" />
        <spring:message code="security_login_form_password_message" var="pwd_msg" htmlEscape="false" />
      </div>
      <br />
      <div class="submit">
        <script type="text/javascript">Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'proceed', event:'onclick'}));</script>
        <spring:message code="button_submit" var="submit_label" htmlEscape="false" />
        <input id="proceed" type="submit" value="${fn:escapeXml(submit_label)}" />
        <spring:message code="button_reset" var="reset_label" htmlEscape="false" />
        <input id="reset" type="reset" value="${fn:escapeXml(reset_label)}" />
      </div>
    </form>
</div>

