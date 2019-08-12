<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>经理列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<form action="${pageContext.request.contextPath }/manager/find" method="post">
    <c:import url="../decoration/top.jsp"/>
    <td vAlign=top width="100%" bgColor=#ffffff>
        <table cellSpacing=0 cellPadding=5 width="100%" border=0>
            <tr>
                <td class=manageHead>当前位置：系统管理 &gt; 经理列表</td>
            </tr>
            <tr>
                <td height=2></td>
            </tr>
        </table>
        <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
            <tbody>
            <tr>
                <td height=25>
                    <table cellSpacing="0" cellPadding="2" border="0">
                        <tbody>
                        <tr>
                            <td>用户真实姓名：</td>
                            <td><input class="textbox" style="width: 80px" maxLength=50 name="realname"></td>
                            <td>用户级别：</td>
                            <td>
                                <select name="level">
                                    <option value="">--请选择--</option>
                                    <option value="普通">普通</option>
                                    <option value="管理员">管理员</option>
                                </select>
                            </td>
                            <td><input class="button" type="submit" value=" 筛选 "></td>
                        </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table style="table-layout:fixed;border-top-width: 0px; font-weight: normal; border-left-width: 0px; border-left-color: #cccccc; BORDER-BOTTOM-WIDTH: 0px; BORDER-BOTTOM-COLOR: #cccccc; WIDTH: 100%; BORDER-TOP-COLOR: #cccccc; FONT-STYLE: normal; BACKGROUND-COLOR: #cccccc; BORDER-RIGHT-WIDTH: 0px; TEXT-DECORATION: none; BORDER-RIGHT-COLOR: #cccccc"
                           cellSpacing=1 cellPadding=2 rules=all border=0>
                        <tbody>
                        <tr style="font-weight: bold; font-style: normal; background-color: #eeeeee; text-decoration: none">
                            <td>用户用户名</td>
                            <td>用户密码</td>
                            <td>用户真实姓名</td>
                            <td>用户地址</td>
                            <td>用户级别</td>
                            <td>操作</td>
                        </tr>
                        <c:forEach items="${managerList }" var="manager">
                            <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none"
                                class="list">
                                <td>${manager.name }</td>
                                <td>${manager.password }</td>
                                <td>${manager.realname }</td>
                                <td>${manager.address }</td>
                                <td>${manager.level }</td>
                                <td class="other">
                                    <a id="${manager.id}" onclick="aClick(this)" href="#">保存</a>
                                    <a href="${pageContext.request.contextPath}/manager/delete/${manager.id}">删除</a>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/table.js"></script>
</body>
</html>
