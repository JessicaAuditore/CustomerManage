<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>添加客户</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/customer/addOrEdit" method=post>
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：客户管理 &gt; 添加客户</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table cellSpacing=0 cellPadding=5 border=0>
            <tr>
                <td>客户名称：</td>
                <td>
                    <input class=textbox style="width: 180px" maxLength=50 name="name">
                </td>
                <td>客户级别：</td>
                <td>
                    <select name="dict.id">
                        <option value="">--请选择--</option>
                        <c:forEach items="${dictList }" var="dict">
                            <option value="${dict.id }">${dict.name }</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>客户地址：</td>
                <td>
                    <input class=textbox style="width: 180px" maxLength=50 name="address">
                </td>
                <td>客户电话：</td>
                <td>
                    <input class=textbox style="width: 180px" maxLength=50 name="telephone">
                </td>
            </tr>
            <tr>
                <td>客户来源：</td>
                <td>
                    <select name="source.id">
                        <option value="">--请选择--</option>
                        <c:forEach items="${sourceList }" var="source">
                            <option value="${source.id }">${source.name }</option>
                        </c:forEach>
                    </select>
                </td>
                <c:if test="${sessionScope.manager!=null}">
                    <td>联系人：</td>
                    <td>
                        <select name="linkman.id">
                            <option value="">--请选择--</option>
                            <c:forEach items="${linkmanList }" var="linkman">
                                <option value="${linkman.id }">${linkman.name }</option>
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
