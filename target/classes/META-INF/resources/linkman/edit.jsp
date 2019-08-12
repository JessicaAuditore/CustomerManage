<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>编辑联系人</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/linkman/addOrEdit" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：联系人管理 &gt; 修改联系人</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table cellSpacing=0 cellPadding=5 border=0>
            <TR>
                <input type="hidden" name="id" value="${linkman.id }"/>
                <td>联系人名称：</td>
                <td>
                    <input class=textbox style="width: 180px" maxLength=50 name="name" value="${linkman.name }">
                </td>
                <td>联系人性别 ：</td>
                <td>
                    <input type="radio" value="男" name="gender"
                           <c:if test="${linkman.gender=='男' }">checked</c:if>>男
                    <input type="radio" value="女" name="gender"
                           <c:if test="${linkman.gender=='女' }">checked</c:if>>女
                </td>
            </TR>
            <tr>
                <td>联系人地址：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="address" value="${linkman.address }">
                </td>
                <td>联系人电话 ：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="telephone"
                           value="${linkman.telephone }">
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