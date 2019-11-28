<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/13
  Time: 14:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=request.getContextPath() %>/js/bootstrap3/js/bootstrap.min.js"></script>
                                                                                     <link href="<%=request.getContextPath() %>/js/bootstrap3/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .show-grid [class ^="col-"] {
            padding-top: 10px;
            padding-bottom: 10px;
            background-color:yellow;
            border: 1px solid #ddd;
            background-color: rgba(86, 61, 124, .15);
            border: 1px solid rgba(86, 61, 124, .2);
        }
    </style>

</head>
<body>
<div class="container-fluid show-grid">
    <div class="row">
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
        <div class="col-md-1">.col-md-1</div>
    </div>
    <div class="row">
        <div class="col-md-8">.col-md-8</div>
        <div class="col-md-4">.col-md-4</div>
    </div>
    <div class="row">

        <div class="col-md-8 col-sm-6">.col-md-8</div>
        <div class="col-md-4 col-sm-6">.col-md-4</div>
    </div>
    <div class="row">
        <div class="col-md-6">.col-md-6</div>
        <div class="col-md-6">.col-md-6</div>
    </div>

</div>
</body>
</html>
