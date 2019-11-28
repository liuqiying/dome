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
    <title>注册</title>
    <jsp:include page="common/script.jsp"></jsp:include>
</head>
<body>
<style type="text/css">
    body{
        background: url("${pageContext.request.contextPath}/img/DDD (2).jpg");
        animation-name:myfirst;
        animation-duration:12s;
        /*变换时间*/
        animation-delay:3s;
        /*动画开始时间*/
        animation-iteration-count:infinite;
        /*下一周期循环播放*/
        animation-play-state:running;
        /*动画开始运行*/
    }
    @keyframes myfirst
    {
        0%   {background:url("${pageContext.request.contextPath}/img/21312.jpg");}
        34%  {background:url("${pageContext.request.contextPath}/img/fff.jpg");}
        67%  {background:url("${pageContext.request.contextPath}/img/333.jpg");}
        100% {background:url("${pageContext.request.contextPath}/img/DDD (2).jpg");}
    }
    .form{background: rgba(255,255,255,0.2);width:400px;margin:120px auto;}
    /*阴影*/
    .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
    input[type="text"],input[type="password"]{padding-left:26px;}
    .checkbox{padding-left:21px;}
</style>
<center>
    <H1>登录页面</H1>
    <br>
    <form class="form-horizontal">
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="userName">用户名</label>
                <input type="text" id="userName" placeholder="用户名">
            </div>
        </div>
        <br>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="passWord">密码</label>
                <input type="password" id="passWord" placeholder="密码">
            </div>
        </div><br>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="passWord">记住密码</label>
                <input type="checkbox" name="rememberMe" >
            </div>
        </div><br>
        <div class="control-group">
            <div class="controls">
                <label class="control-label" for="passWord">忘记密码</label>
                <a href="/forget.jsp">找回密码</a>
            </div>
        </div><br>
        <div>
            <button type="button" class="btn btn-danger " onclick="login()">
              登录
            </button>&nbsp;&nbsp;&nbsp;
            <button type="button" class="btn btn-primary " onclick="zhuce()">
                注册
            </button>
        </div>
    </form>
</center>
</body>
<script>
    function login(){
        var userName = $("#userName").val();
        var passWord = $("#passWord").val();
       var rememberMe = 0 ;
       if($("[name='rememberMe']").prop("checked")){
           rememberMe=1;
       }

        $.post(
            "/user/login.do",
            {"userName":userName,"passWord":passWord,"rememberMe":rememberMe},
            function (result){
                 if(result.status==200){
                     var flag = result.data;
                     if(flag==1){
                         bootbox.alert("用户名不存在！");
                     }else if(flag==2){
                         bootbox.alert("密码错误！");
                     }else{
                         location.href="index.jsp"
                     }
                 }else{
                     bootbox.alert("登陆失败！");
                 }
            }
        )

    }

  function  zhuce(){
      location.href="/register.jsp"
  }


</script>

</html>
