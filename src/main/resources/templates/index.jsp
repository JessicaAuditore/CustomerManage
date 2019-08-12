<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>客户关系管理系统</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
</head>
<frameset frameSpacing=0 rows=80,* frameBorder=0>
    <frame name=top src="${pageContext.request.contextPath }/top" frameBorder=0 noResize scrolling=no>
    <frameset frameSpacing=0 frameBorder=0 cols=220,*>
        <frame name=menu src="${pageContext.request.contextPath }/menu" frameBorder=0 noResize>
        <frame name=main src="${pageContext.request.contextPath }/welcome" frameBorder=0>
    </frameset>
    <noframes>
        <p>This page requires frames, but your browser does not support them.</p>
    </noframes>
</frameset>
</html>
