<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/24
  Time: 11:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>找回密码</title>
    <jsp:include page="common/script.jsp"></jsp:include>
</head>
<body>
<center>
    <H1>找密页面</H1>
    <br>
    <form class="form-horizontal">
        <div class="control-group">
            <div class="controls">
                <label class="control-label" >手机号</label>
                <input type="text" id="phone" placeholder="请输入手机号">
                <button type="button" class="btn btn-info " onclick="sendCode()">
                    获取验证码
                </button>
            </div>
        </div>
        <br>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" >验证码</label>
                <input type="password" id="code" placeholder="请输入验证码">
            </div>
        </div><br>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="passWord">新密码</label>
                <input type="password" id="passWord" placeholder="密码">
            </div>
        </div><br>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="passWord">确定密码</label>
                <input type="password" id="passWord2" placeholder="密码">
            </div>
        </div><br>
        <div>
            <button type="button" class="btn btn-danger " onclick="saveButton()">
              确定
            </button>
        </div>
    </form>
</center>
</body>
<script>
    function sendCode(){
        var phone = $("#phone").val();
        $.post(
            "/user/sendCode.do",
            {"phone":phone,},
            function (result){
                 if(result.status==200){
                    var res=result.data;
                    if(res==2){
                    bootbox.alert("验证码发送失败")
                    }else if(res==3){
                        bootbox.alert("手机号不能为空")
                    }
                 }else{
                     bootbox.alert("发送失败！");
                 }
            }
        )

    }
    function saveButton(){
        var phone = $("#phone").val();
        var code = $("#code").val();
        var password = $("#passWord").val();
        var password2 = $("#passWord2").val();
        if(password!=null && password==password2) {
            $.post(
                "/user/saveButton.do",
                {"phone": phone,"code":code,"password":password,},
                function (result) {
                    if (result.status == 200) {
                        location.href="/login.jsp"

                    }else if(result.status == 1001){
                        bootbox.alert("验证码错误！");
                    } else {
                        bootbox.alert("操作失败！");
                    }
                }
            )
        }else{
            bootbox.alert("两次密码不一致")
        }
    }


</script>

</html>
