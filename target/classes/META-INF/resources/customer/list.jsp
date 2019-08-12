<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>客户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/customer/find" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：客户管理 &gt; 客户列表</td>
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
                                <td><input class="textbox" style="width: 80px" maxLength=50 name="name"></td>
                                <td>客户级别：</td>
                                <td>
                                    <select name="dict.id">
                                        <option value="">--请选择--</option>
                                        <c:forEach items="${dictList }" var="dict">
                                            <option value="${dict.id }">${dict.name }</option>
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
                    <table style="border-top-width: 0px; font-weight: normal; border-left-width: 0px; border-left-color: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                           cellSpacing=1 cellPadding=2 rules=all border=0>
                        <tbody>
                        <tr style="font-weight: bold; font-style: normal; background-color: #eeeeee; text-decoration: none">
                            <td>客户名称</td>
                            <td>客户级别</td>
                            <td>客户地址</td>
                            <td>客户代表人</td>
                            <td>客户代表人电话</td>
                            <td>客户来源</td>
                            <td>联系人</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${customerList }" var="customer">
                            <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none">
                                <td>${customer.name }</td>
                                <td>${customer.dict.name }</td>
                                <td>${customer.address }</td>
                                <td>${customer.representative }</td>
                                <td>${customer.telephone }</td>
                                <td>${customer.source.name }</td>
                                <td>${customer.linkman.name }</td>
                                <td>
                                    <a href="${pageContext.request.contextPath}/customer/showCustomer/${customer.id}">修改</a>
                                    <a href="${pageContext.request.contextPath}/customer/delete/${customer.id}">删除</a>
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
