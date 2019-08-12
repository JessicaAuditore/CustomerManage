<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>编辑客户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/customer/addOrEdit" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：客户管理 &gt; 修改客户</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table cellSpacing=0 cellPadding=5 border=0>
            <tr>
                <input type="hidden" name="id" value="${customer.id }"/>
                <td>客户名称：</td>
                <td>
                    <input class=textbox style="width: 180px" maxLength=50 name="name" value="${customer.name }">
                </td>
                <td>客户级别 ：</td>
                <td>
                    <select name="dict.id">
                        <c:forEach var="dict" items="${dictList}">
                            <c:if test="${dict.id==customer.dict.id}">
                                <option value="${dict.id}" selected>${dict.name}</option>
                            </c:if>
                            <c:if test="${dict.id!=customer.dict.id}">
                                <option value="${dict.id}">${dict.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>客户地址：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="address" value="${customer.address }">
                </td>
                <td>客户电话 ：</td>
                <td>
                    <input class=textbox style="WIDTH: 180px" maxLength=50 name="telephone"
                           value="${customer.telephone }">
                </td>
            </tr>
            <tr>
                <td>客户来源 ：</td>
                <td>
                    <input class=textbox style="width: 180px" maxLength=50 name="source" value="${customer.source }">
                </td>
                <c:if test="${sessionScope.manager!=null}">
                <td>联系人：</td>
                <td>
                    <select name="linkman.id">
                        <c:forEach items="${linkmanList }" var="linkman">
                            <c:if test="${linkman.id==customer.linkman.id}">
                                <option value="${linkman.id}" selected>${linkman.name}</option>
                            </c:if>
                            <c:if test="${linkman.id!=customer.linkman.id}">
                                <option value="${linkman.id}">${linkman.name}</option>
                            </c:if>
                        </c:forEach>
                    </select>
                </td>
                </c:if>
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