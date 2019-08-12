<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>数据字典</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/Style.css" type=text/css rel=stylesheet>
    <link href="${pageContext.request.contextPath }/css/Manage.css" type=text/css rel=stylesheet>
</head>
<body>
<c:import url="../decoration/top.jsp"/>
<td vAlign=top width="100%" bgColor=#ffffff>
    <table cellSpacing=0 cellPadding=5 width="100%" border=0>
        <tr>
            <td class=manageHead>当前位置：系统管理 &gt; 数据字典</td>
        </tr>
        <tr>
            <td height=2></td>
        </tr>
    </table>
    <table borderColor=#cccccc cellSpacing=0 cellPadding=0 width="25%" border=0>
        <tbody>
        <tr>
            <td>
                <table style="table-layout:fixed;border-top-width: 0px; font-weight: normal; border-left-width: 0px; border-left-color: #cccccc; border-bottom-width: 0px; border-bottom-color: #cccccc; width: 100%; border-top-color: #cccccc; font-style: normal; background-color: #cccccc; border-right-width: 0px; text-decoration: none; border-right-color: #cccccc"
                       cellSpacing=1 cellPadding=2 rules=all border=0>
                    <tbody>
                    <tr style="font-weight: bold; font-style: normal; background-color: #eeeeee; text-decoration: none">
                        <td>客户级别</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${dictList }" var="dict">
                        <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none"
                            class="list">
                            <td>${dict.name }</td>
                            <td class="other">
                                <a id="${dict.id}" href="#" onclick="bClick(this)">保存</a>
                                <a href="${pageContext.request.contextPath}/customer/dict/delete/${dict.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none"
                        class="list">
                        <td></td>
                        <td class="other">
                            <a href="#" onclick="cClick(this)">添加</a>
                        </td>
                    </tr>
                    </tbody>
                </table>

                <table style="table-layout:fixed;border-top-width: 0px; font-weight: normal; border-left-width: 0px; border-left-color: #cccccc; border-bottom-width: 0px; border-bottom-color: #cccccc; width: 100%; border-top-color: #cccccc; font-style: normal; background-color: #cccccc; border-right-width: 0px; text-decoration: none; border-right-color: #cccccc"
                       cellSpacing=1 cellPadding=2 rules=all border=0>
                    <tbody>
                    <tr style="font-weight: bold; font-style: normal; background-color: #eeeeee; text-decoration: none">
                        <td>客户来源</td>
                        <td>操作</td>
                    </tr>
                    <c:forEach items="${sourceList }" var="source">
                        <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none"
                            class="list">
                            <td>${source.name }</td>
                            <td class="other">
                                <a id="${source.id}" href="#" onclick="dClick(this)">保存</a>
                                <a href="${pageContext.request.contextPath}/customer/source/delete/${source.id}">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr style="font-weight: normal; font-style: normal; background-color: white; text-decoration: none"
                        class="list">
                        <td></td>
                        <td class="other">
                            <a href="#" onclick="eClick(this)">添加</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        </tbody>
    </table>
</td>
<c:import url="../decoration/bottom.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.4.0/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/table.js"></script>
</body>
</html>
