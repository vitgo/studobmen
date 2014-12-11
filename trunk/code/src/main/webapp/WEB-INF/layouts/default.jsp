<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>			
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=8" />	
			
		<spring:message code="application_name" var="app_name" htmlEscape="false"/>
		<title><spring:message code="welcome_h3" arguments="${app_name}" /></title>
		
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/assets/styles/style.css" />
		
		<%-- <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-144-precomposed.png">
		<link rel="apple-touch-icon-precomposed" sizes="114x114" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-114-precomposed.png"> --%>
		<link rel="apple-touch-icon-precomposed" sizes="72x72" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-72-precomposed.png">
		<link rel="apple-touch-icon-precomposed" href="${pageContext.request.contextPath}/assets/ico/apple-touch-icon-57-precomposed.png">
		<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/ico/favicon.ico">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">

		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/libs.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/conspect.base.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	</head>
	
  	<body>
  		<script type="text/javascript">
  			var ROOT_PATH = "${pageContext.request.contextPath}";
  		</script>
  		
   		<div class="container">
   			<div class="row">
   				<div class="span4 header">
   					<tiles:insertAttribute name="header" />
   				</div>
   				<div class="span2 offset6 menu">
   					<tiles:insertAttribute name="menu" />
   				</div>
		    </div>
		    <div class="body">
	    		<tiles:insertAttribute name="body"/>
	    	</div>
		    <tiles:insertAttribute name="footer" />
		</div>
	</body>
</html>
