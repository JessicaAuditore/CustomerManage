<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>联系人列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="/css/Style.css" type=text/css rel=stylesheet>
    <LINK href="/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/linkman/find" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：联系人管理 &gt; 联系人列表</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
            <tbody>
            <tr>
                <td height=25>
                    <table cellSpacing=0 cellPadding=2 border=0>
                        <tbody>
                        <tr>
                            <td>联系人名称：</td>
                            <td><input class=textbox style="WIDTH: 80px" maxLength=50 name="name"></td>
                            <td><input class=button type=submit value=" 筛选 "></td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="BORDER-TOP-WIDTH: 0px; FONT-WEIGHT: normal; BORDER-LEFT-WIDTH: 0px; BORDER-LEFT-COLOR: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                           cellSpacing=1 cellPadding=2 rules=all border=0>
                        <tbody>
                        <tr style="font-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
                            <td>联系人名称</td>
                            <td>联系人性别</td>
                            <td>联系人地址</td>
                            <td>联系人电话</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${linkmanList }" var="linkman">
                            <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none">
                                <td>${linkman.name }</td>
                                <td>${linkman.gender }</td>
                                <td>${linkman.address }</td>
                                <td>${linkman.telephone }</td>
                                <td>
                                    <c:if test="${sessionScope.manager.level=='管理员'}">
                                        <a href="${pageContext.request.contextPath}/linkman/showLinkman/${linkman.id}">修改</a>
                                        <a href="${pageContext.request.contextPath}/linkman/delete/${linkman.id}">删除</a>
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
