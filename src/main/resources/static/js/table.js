$(function () {
    var tds = $(".list").children("td");
    //给所有的td节点增加点击事件
    tds.click(tdClick);
});

//例子
function tdClick() {
    var td = $(this);
    if (td.is('.other')) {
        return;
    }
    //1 取出当前td中的文本内容保存起来
    var text = td.text();
    //2 清空td里面的内容
    td.empty();
    //3 建立一个文本框，也就是input的元素节点
    var input = $("<input>");
    //4 设置文本框的值是保存起来的文本内容
    input.attr("value", text);
    input.attr("style", "background-color:transparent;border:0;width: 100%;outline:none");
    // 让文本框可以响应键盘按下并弹起的事件，主要用于处理回车确认
    // input.keyup(function (event) {
    //     //0 获取当前用户按下的键值
    //     //解决不同浏览器获取事件对象的差异
    //     var myEvent = event || window.event;
    //     var kcode = myEvent.keyCode;
    //     //1 判断回车键按下
    //     if (kcode === 13) {
    //         var inputNode = $(this);
    //         //2 获取当前文本框的内容
    //         var inputText = inputNode.val();
    //         //3 清空td里面的内容
    //         var tdNode = inputNode.parent();
    //         //4 将保存的文本框的内容填充到td中
    //         tdNode.html(inputText);
    //         //5 让td重新拥有点击事件
    //         tdNode.click(tdClick);
    //     }
    // });

    input.mouseout(function (event) {
        var inputNode = $(this);
        //2 获取当前文本框的内容
        var inputText = inputNode.val();
        //3 清空td里面的内容
        var tdNode = inputNode.parent();
        //4 将保存的文本框的内容填充到td中
        tdNode.html(inputText);
        //5 让td重新拥有点击事件
        tdNode.click(tdClick);
    });
    //5 将文本框加到td中
    td.append(input);//也可以用input.appendTo(td);

    //全选文本框中的蚊子
    var inputdom = input.get(0);
    inputdom.select();

    //6 需要移除td上的点击事件
    td.unbind("click");
}

//经理管理
function aClick(obj) {
    var form = $('<form></form>');
    // 设置属性
    form.attr('style', 'display: none');
    var tds = $(obj).parent().parent().children();
    // 创建Input
    var idInput = $('<input type="text" name="id" />').attr('value', $(obj).attr('id'));
    var nameInput = $('<input type="text" name="name" />').attr('value', tds.html());
    var passwordInput = $('<input type="text" name="password" />').attr('value', tds.next().html());
    var realnameInput = $('<input type="text" name="realname" />').attr('value', tds.next().next().html());
    var addressInput = $('<input type="text" name="address" />').attr('value', tds.next().next().next().html());
    var levelInput = $('<input type="text" name="level" />').attr('value', tds.next().next().next().next().html());
    // 附加到Form
    form.append(idInput);
    form.append(nameInput);
    form.append(passwordInput);
    form.append(realnameInput);
    form.append(addressInput);
    form.append(levelInput);
    $("body").append(form);
    $.ajax({
        type: "post",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/manager/edit",
        data: form.serialize(),
        error: function () {
            alert("异常！");
        }
    });
    return false;
}

//数据字典
function bClick(obj) {
    var form = $('<form></form>');
    // 设置属性
    form.attr('style', 'display: none');
    var tds = $(obj).parent().parent().children();
    // 创建Input
    var idInput = $('<input type="text" name="id" />').attr('value', $(obj).attr('id'));
    var nameInput = $('<input type="text" name="name" />').attr('value', tds.html());
    // 附加到Form
    form.append(idInput);
    form.append(nameInput);
    $("body").append(form);
    $.ajax({
        type: "post",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/customer/dict/edit",
        data: form.serialize(),
        error: function () {
            alert("异常！");
        }
    });
    return false;
}

function cClick(obj) {
    var form = $('<form></form>');
    // 设置属性
    form.attr('style', 'display: none');
    form.attr('method', 'post');
    form.attr('action', '/customer/dict/add');
    var tds = $(obj).parent().parent().children();
    // 创建Input
    var nameInput = $('<input type="text" name="name" />').attr('value', tds.html());
    // 附加到Form
    form.append(nameInput);
    $("body").append(form);
    form.submit();
    return false;
}

function dClick(obj) {
    var form = $('<form></form>');
    // 设置属性
    form.attr('style', 'display: none');
    var tds = $(obj).parent().parent().children();
    // 创建Input
    var idInput = $('<input type="text" name="id" />').attr('value', $(obj).attr('id'));
    var nameInput = $('<input type="text" name="name" />').attr('value', tds.html());
    // 附加到Form
    form.append(idInput);
    form.append(nameInput);
    $("body").append(form);
    $.ajax({
        type: "post",//方法类型
        dataType: "json",//预期服务器返回的数据类型
        url: "/customer/source/edit",
        data: form.serialize(),
        error: function () {
            alert("异常！");
        }
    });
    return false;
}

function eClick(obj) {
    var form = $('<form></form>');
    // 设置属性
    form.attr('style', 'display: none');
    form.attr('method', 'post');
    form.attr('action', '/customer/source/add');
    var tds = $(obj).parent().parent().children();
    // 创建Input
    var nameInput = $('<input type="text" name="name" />').attr('value', tds.html());
    // 附加到Form
    form.append(nameInput);
    $("body").append(form);
    form.submit();
    return false;
}