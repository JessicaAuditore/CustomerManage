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
<form action="${pageContext.request.contextPath }/visit/find" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：客户拜访管理 &gt; 客户拜访列表</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>

        <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
            <tbody>
            <c:if test="${sessionScope.manager!=null}">
            <tr>
                <td height=25>
                    <table cellSpacing="0" cellPadding="2" border="0">
                        <tbody>
                        <tr>
                            <td>客户名称：</td>
                            <td>
                                <select name="customer.id">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${customerList }" var="customer">
                                        <option value="${customer.id }">${customer.name }</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>联系人名称：</td>
                            <td>
                                <select name="linkman.id">
                                    <option value="">--请选择--</option>
                                    <c:forEach items="${linkmanList }" var="linkman">
                                        <option value="${linkman.id }">${linkman.name }</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td><input class="button" type="submit" value=" 筛选 "></td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            </c:if>
            <tr>
                <td>
                    <table style="border-top-width: 0px; font-weight: normal; border-left-width: 0px; border-left-color: #cccccc; border-bottom-width: 0px; border-bottom-color: #cccccc; width: 100%; border-top-color: #cccccc; font-style: normal; background-color: #cccccc; border-right-width: 0px; text-decoration: none; border-right-color: #cccccc"
                           cellSpacing=1 cellPadding=2 rules=all border=0>
                        <tbody>
                        <tr style="font-weight: bold; font-style: normal; background-color: #eeeeee; text-decoration: none">
                            <td>客户名称</td>
                            <td>联系人名称</td>
                            <td>拜访地址</td>
                            <td>拜访目的</td>
                            <td>拜访结果</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${visitList }" var="visit">
                            <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none">
                                <td>${visit.customer.name }</td>
                                <td>${visit.linkman.name }</td>
                                <td>${visit.address }</td>
                                <td>${visit.aim }</td>
                                <td>${visit.result }</td>
                                <td>
                                    <c:if test="${sessionScope.manager.level=='管理员'||sessionScope.linkman!=null}">
                                        <a href="${pageContext.request.contextPath }/visit/showVisit/${visit.id }">修改</a>
                                        <a href="${pageContext.request.contextPath }/visit/delete/${visit.id }">删除</a>
                                    </c:if>
                                </td>
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
</form>
</body>
</html>