<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>顶部</title>
    <meta http-equiv=Content-Type content="text/html; charset=utf-8">
    <style type=text/css>
        body {
            PADDING-RIGHT: 0px;
            PADDING-LEFT: 0px;
            PADDING-BOTTOM: 0px;
            MARGIN: 0px;
            PADDING-TOP: 0px;
            BACKGROUND-COLOR: #2a8dc8
        }

        body {
            FONT-SIZE: 12px;
            COLOR: #003366;
            FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
        }

        td {
            FONT-SIZE: 12px;
            COLOR: #003366;
            FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
        }

        DIV {
            FONT-SIZE: 12px;
            COLOR: #003366;
            FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
        }

        P {
            FONT-SIZE: 12px;
            COLOR: #003366;
            FONT-FAMILY: Verdana, Arial, Helvetica, sans-serif
        }
    </style>
</head>
<body>
<form id=form1 name=form1 action="" method=post>
    <table cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tbody>
        <tr>
            <td width=10><img src="${pageContext.request.contextPath }/images/new_001.jpg" border=0></td>
            <td background="${pageContext.request.contextPath }/images/new_002.jpg"><font size=5><b>客户关系管理系统</b></font>
            </td>
            <td background="${pageContext.request.contextPath }/images/new_002.jpg">
                <table cellSpacing=0 cellPadding=0 width="100%" border=0>
                    <tbody>
                    <tr>
                        <td align=right height=35></td>
                    </tr>
                    <tr>
                        <td height=35 align="right">
                            <c:if test="${sessionScope.manager!=null}">
                                当前经理：${sessionScope.manager.realname}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                等级：${sessionScope.manager.level}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/manager/toModifyPage" target=main>
                                    <font color=red>修改密码</font>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/manager/exit" target=_top>
                                    <font color=red>安全退出</font>
                                </a>
                            </c:if>
                            <c:if test="${sessionScope.linkman!=null}">
                                当前联系人：${sessionScope.linkman.name}
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/linkman/toModifyPage" target=main>
                                    <font color=red>修改密码</font>
                                </a>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/linkman/exit" target=_top>
                                    <font color=red>安全退出</font>
                                </a>
                            </c:if>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </td>
            <td width=10><img src="${pageContext.request.contextPath }/images/new_003.jpg" border=0></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>
