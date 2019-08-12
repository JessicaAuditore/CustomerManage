<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>客户拜访列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/visit/addOrEdit" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：客户拜访管理 &gt; 添加客户拜访</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table cellSpacing=0 cellPadding=5 border=0>
            <tr>
                <td>客户名称：</td>
                <td>
                    <select name="customer.id">
                        <option value="">--请选择--</option>
                        <c:forEach var="customer" items="${customerList}">
                            <option value="${customer.id}">${customer.name}</option>
                        </c:forEach>
                    </select>
                </td>
                <c:if test="${sessionScope.manager!=null}">
                <td>联系人名称：</td>
                <td>
                    <select name="linkman.id">
                        <option value="">--请选择--</option>
                        <c:forEach var="linkman" items="${linkmanList}">
                            <option value="${linkman.id}">${linkman.name}</option>
                        </c:forEach>
                    </select>
                </td>
                </c:if>
            </tr>
            <tr>
                <td>拜访目的：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="aim">
                </td>
                <td>拜访结果：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="result">
                </td>
            </tr>
            <tr>
                <td>拜访地址：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="address">
                </td>
            </tr>
            <tr>
                <td rowspan=2>
                    <input class=button type=submit value=" 保存 ">
                </td>
            </tr>
        </table>
    </td>
    <c:import url="../decoration/bottom.jsp"/>
</form>
</body>
</html>