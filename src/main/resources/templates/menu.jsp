<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>导航</title>
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

        BODY {
            FONT-SIZE: 11px;
            COLOR: #003366;
            FONT-FAMILY: Verdana
        }

        TD {
            FONT-SIZE: 11px;
            COLOR: #003366;
            FONT-FAMILY: Verdana
        }

        DIV {
            FONT-SIZE: 11px;
            COLOR: #003366;
            FONT-FAMILY: Verdana
        }

        P {
            FONT-SIZE: 11px;
            COLOR: #003366;
            FONT-FAMILY: Verdana
        }

        .mainMenu {
            FONT-WEIGHT: bold;
            FONT-SIZE: 14px;
            cursor: pointer;
            COLOR: #000000
        }

        A.style2:link {
            PADDING-LEFT: 4px;
            COLOR: #0055bb;
            TEXT-DECORATION: none
        }

        A.style2:visited {
            PADDING-LEFT: 4px;
            COLOR: #0055bb;
            TEXT-DECORATION: none
        }

        A.style2:hover {
            PADDING-LEFT: 4px;
            COLOR: #ff0000;
            TEXT-DECORATION: none
        }

        A.active {
            PADDING-LEFT: 4px;
            COLOR: #ff0000;
            TEXT-DECORATION: none
        }

        .span {
            COLOR: #ff0000;
        }
    </style>
    <script type="text/javascript">
        function MenuDisplay(obj_id) {
            var obj;
            for (var i = 1; i <= 9; i++) {
                obj = document.getElementById('table_' + i);
                if (obj) {
                    document.getElementById('table_' + i).style.display = 'none';
                    document.getElementById('table_' + i + 'Span').innerText = '＋';
                }
            }
            obj = document.getElementById(obj_id);
            if (obj) {
                if (obj.style.display === 'none') {
                    obj.style.display = 'block';
                    document.getElementById(obj_id + 'Span').innerText = '－';
                } else {
                    obj.style.display = 'none';
                    document.getElementById(obj_id + 'Span').innerText = '＋';
                }
            }

        }
    </script>
</head>
<body>
<table cellSpacing=0 cellPadding=0 width=210 align=center border=0>
    <tbody>
    <tr>
        <td width=15><img src="${pageContext.request.contextPath }/images/new_005.jpg" border=0></td>
        <td align=middle width=180 background="${pageContext.request.contextPath }/images/new_006.jpg" height=35>
            <b>功能菜单</b></td>
        <td width=15><img src="${pageContext.request.contextPath }/images/new_007.jpg" border=0></td>
    </tr>
    </tbody>
</table>
<table cellSpacing=0 cellPadding=0 width=210 align=center border=0>
    <tbody>
    <tr>
        <td width=15 background="${pageContext.request.contextPath }/images/new_008.jpg"></td>
        <td vAlign=top width=180 bgColor=#ffffff>
            <table cellSpacing=0 cellPadding=3 width=165 align=center border=0>
                <tbody>
                <tr>
                    <td class=mainMenu onClick="MenuDisplay('table_1');"><span class=span id=table_1Span>＋</span> 客户管理
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id=table_1 style="DISPLAY: none" cellSpacing=0 cellPadding=2 width=155 align=center
                               border=0>
                            <tbody>
                            <tr>
                                <td class=menuSmall>
                                    <a class=style2 href="${pageContext.request.contextPath }/customer/toAddPage"
                                       target=main>－ 新增客户</a>
                                </td>
                            </tr>
                            <tr>
                                <td class=menuSmall>
                                    <a class=style2 href="${pageContext.request.contextPath }/customer/list"
                                       target=main>－ 客户列表</a>
                                </td>
                            </tr>
                            <c:if test="${sessionScope.manager!=null}">
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2
                                           href="${pageContext.request.contextPath }/customer/listPage?currentPage=1"
                                           target=main>－ 分页客户列表</a>
                                    </td>
                                </tr>
                            </c:if>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <c:if test="${sessionScope.manager!=null}">
                    <tr>
                        <td background="${pageContext.request.contextPath }/images/new_027.jpg" height=1></td>
                    </tr>
                    <tr>
                        <td class=mainMenu onClick="MenuDisplay('table_2');"><span class=span id=table_2Span>＋</span>
                            联系人管理
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id=table_2 style="DISPLAY: none" cellSpacing=0
                                   cellPadding=2 width=155 align=center border=0>
                                <tbody>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/linkman/toAddPage"
                                           target=main>－ 新增联系人</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/linkman/list"
                                           target=main>－ 联系人列表</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td background="${pageContext.request.contextPath }/images/new_027.jpg" height=1></td>
                </tr>
                <tr>
                    <td class=mainMenu onClick="MenuDisplay('table_5');">
                        <span class=span id=table_5Span>＋</span> 客户拜访管理
                    </td>
                </tr>
                <tr>
                    <td>
                        <table id=table_5 style="display: none" cellSpacing=0 cellPadding=2 width=155 align=center
                               border=0>
                            <tbody>
                            <tr>
                                <td class=menuSmall>
                                    <a class=style2 href="${pageContext.request.contextPath }/visit/toAddPage"
                                       target=main>－ 新增客户拜访</a>
                                </td>
                            </tr>
                            <tr>
                                <td class=menuSmall>
                                    <a class=style2 href="${pageContext.request.contextPath }/visit/list" target=main>－
                                        客户拜访列表</a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>

                <c:if test="${sessionScope.manager!=null}">
                    <tr>
                        <td background="${pageContext.request.contextPath }/images/new_027.jpg" height=1></td>
                    </tr>
                    <tr>
                        <td class=mainMenu onClick="MenuDisplay('table_3');"><span class=span id=table_3Span>＋</span>
                            综合查询
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id=table_3 style="DISPLAY: none" cellSpacing=0
                                   cellPadding=2 width=155 align=center border=0>
                                <tbody>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/customer/toQueryPage"
                                           target=main>－ 客户信息查询</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/linkman/toQueryPage"
                                           target=main>－ 联系人信息查询</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/visit/toQueryPage"
                                           target=main>－ 客户拜访记录查询</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td background="${pageContext.request.contextPath }/images/new_027.jpg" height=1"></td>
                    </tr>
                    <tr>
                        <td class=mainMenu onClick="MenuDisplay('table_4');"><span class=span id=table_4Span>＋</span>
                            统计分析
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id=table_4 style="DISPLAY: none" cellSpacing=0 cellPadding=2 width=155 align=center
                                   border=0>
                                <tbody>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/customer/countLevel"
                                           target=main>－ 客户级别统计</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/customer/countSource"
                                           target=main>－ 客户来源统计</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td background="${pageContext.request.contextPath }/images/new_027.jpg" height=1></td>
                    </tr>
                    <tr>
                        <td class=mainMenu onClick="MenuDisplay('table_6');"><span class=span id=table_6Span>＋</span>
                            系统管理
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table id=table_6 style="DISPLAY: none" cellSpacing=0 cellPadding=2 width=155 align=center
                                   border=0>
                                <tbody>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2 href="${pageContext.request.contextPath }/manager/list"
                                           target=main>－
                                            经理管理</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class=menuSmall>
                                        <a class=style2
                                           href="${pageContext.request.contextPath }/customer/dataDirectory"
                                           target=main>－ 数据字典</a>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </td>
        <td width=15 background="${pageContext.request.contextPath }/images/new_009.jpg"></td>
    </tr>
    </tbody>
</table>
<table cellSpacing=0 cellPadding=0 width=210 align=center border=0>
    <tbody>
    <tr>
        <td width=15><img src="${pageContext.request.contextPath }/images/new_010.jpg" border=0></td>
        <td align=middle width=180 background="${pageContext.request.contextPath }/images/new_011.jpg"
            height=15></td>
        <td width=15><img src="${pageContext.request.contextPath }/images/new_012.jpg" border=0></td>
    </tr>
    </tbody>
</table>
</body>
</html>
