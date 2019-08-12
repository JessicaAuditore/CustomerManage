<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/linkman/modify" method=post>
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：修改联系人密码</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table cellSpacing=0 cellPadding=5 border=0>
            <tr>
                <td>原密码：</td>
                <td colspan="3"><input type="text" name="oldPassword" style="WIDTH: 180px"/></td>
            </tr>
            <tr>
                <td>新密码：</td>
                <td colspan="3"><input type="password" name="newPassword" style="WIDTH: 180px"/></td>
            </tr>
            <tr>
                <td>重复新密码：</td>
                <td colspan="3"><input type="password" name="repeatPassword" style="WIDTH: 180px"/></td>
            </tr>
            <tr>
                <td rowspan=2>
                    <input class=button type=submit value="保存">
                </td>
            </tr>
        </table>
    </td>
    <c:import url="../decoration/bottom.jsp"/>
</form>
</body>
</html>
