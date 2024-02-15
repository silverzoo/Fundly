<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%--
  Created by IntelliJ IDEA.
  User: init
  Date: 2024-02-12
  Time: 오전 11:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title><tiles:insertAttribute name="title"/></title>
    </head>

    <body>
    <tiles:insertAttribute name="header"/>
        <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
    </body>
</html>