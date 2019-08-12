<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>客户级别统计</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<c:import url="../decoration/top.jsp"/>
<td vAlign=top width="100%" bgColor=#ffffff>
    <table cellSpacing=0 cellPadding=5 width="100%" border=0>
        <tr>
            <td class=manageHead>当前位置：统计分析 &gt; 客户级别统计</td>
        </tr>
        <tr>
            <td height=2></td>
        </tr>
    </table>
    <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="50%" border=0>
        <tbody>
        <tr>
            <td>
                <table style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                       cellSpacing=1 cellPadding=2 rules=all border=0>
                    <tbody>
                    <tr style="font-weight: bold; font-style: normal; background-color: #eeeeee; text-decoration: none">
                        <td>客户级别</td>
                        <td>客户数量</td>
                    </tr>
                    <c:forEach items="${list }" var="map">
                        <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none">
                            <td>${map[0].name }</td>
                            <td>${map[1] }</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
</td>
<c:import url="../decoration/bottom.jsp"/>
</body>
</html>
