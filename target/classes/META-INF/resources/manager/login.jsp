<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" language="java" %>
<html>
<head>
    <title>登录界面</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath }/css/login.css" type=text/css rel=stylesheet>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webjars/jquery/3.4.0/jquery.min.js"></script>
</head>
<body>
<c:if test="${state!=null}">
    <script type="text/javascript">
        $(function () {
            var content = $(".content");
            content.html("${state}");
            var main = $(".main");
            main.fadeIn();
            $(".mainbox").delay(500).slideDown();
            main.keyup(function () {
                $(this).fadeOut();
            });
            $("body").click(function () {
                main.keyup();
            });
        });
    </script>
</c:if>
<div class="main">
    <div class="mainbox">
        <div class="content"></div>
    </div>
</div>

<form action="${pageContext.request.contextPath}/manager/loginHandle" method="post">
    <div>
        <div style="left: 0px; position: absolute; top: 0px; background-color: #0066ff"></div>
        <div style="left: 0px; position: absolute; top: 0px; background-color: #0066ff"></div>
        <div>&nbsp;&nbsp;</div>
        <div>
            <table cellspacing=0 cellpadding=0 width=900 align=center border=0>
                <tbody>
                <tr>
                    <td style="height: 105px">
                        <img src="${pageContext.request.contextPath }/images/login_1.gif" border=0>
                    </td>
                </tr>
                <tr>
                    <td background="${pageContext.request.contextPath }/images/login_user.jpg" height=300>
                        <table height=300 cellpadding=0 width=900 border=0>
                            <tbody>
                            <tr>
                                <td colspan=2 height=35></td>
                            </tr>
                            <tr>
                                <td width=360></td>
                                <td>
                                    <table cellspacing=0 cellpadding=2 border=0>
                                        <tbody>
                                        <tr>
                                            <td style="height: 28px" width=80>登 录 名：</td>
                                            <td style="height: 28px" width=150>
                                                <input style="width: 130px" name="user_name">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 28px">登录密码：</td>
                                            <td style="height: 28px" width=150>
                                                <input style="width: 130px" type="password" name="user_password">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 18px"></td>
                                            <td style="height: 18px"></td>
                                            <td style="height: 18px"></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <input style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px"
                                                       type="image"
                                                       src="${pageContext.request.contextPath }/images/login_button.gif">
                                                <img style="border-top-width: 0px; border-left-width: 0px; border-bottom-width: 0px; border-right-width: 0px"
                                                     onclick="window.location.href='../linkman/login.jsp'; "
                                                     src="${pageContext.request.contextPath }/images/login_btn1.jpg">
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td><img src="${pageContext.request.contextPath }/images/login_3.jpg" border=0></td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</form>
</body>
</html>
