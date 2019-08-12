<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<c:import url="../../decoration/top.jsp"/>
<td align="center" bgColor=#ffffff>
    <table width="100%" height=200 border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td align="center" style="font-size: 14px;">
                <img src="${pageContext.request.contextPath }/images/info.png" align="middle" height="30" width="30"/>
                <span style="vertical-align: middle">您的操作失败！${error}</span>
            </td>
        </tr>
    </table>
</td>
<c:import url="../../decoration/bottom.jsp"/>
</body>
</html>
