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

</head>
<body>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">飞狐教育</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">万元高薪 <span class="sr-only">dgrsr</span></a></li>
                <li><a href="#">实战教学</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">java课程 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">大数据</a></li>
                        <li><a href="#">云计算</a></li>
                        <li><a href="#">云服务</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">测试</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">人工智能</a></li>
                    </ul>
                </li>
            </ul>


        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseOne">
                               产品管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne2343245">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked nav-tabs">
                                <li role="presentation" ><a href="#home" data-toggle="tab"><span class="glyphicon glyphicon-th-list"></span>产品列表</a></li>
                                <li role="presentation"><a href="#add" data-toggle="tab"><i class="glyphicon glyphicon-plus"></i>增加产品</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>


        </div>
        <div class="col-md-9">
            <div class="tab-content">
                <div id="home" class="tab-pane fade ">
                    <div class="panel panel-primary" >
                        <!-- Default panel contents -->
                        <div class="panel-heading">用户列表</div>

                        <!-- Table -->
                        <table class="table table-bordered  table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Username</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">1</th>
                                <td>Mark</td>
                                <td>Otto</td>
                                <td>@mdo</td>
                            </tr>
                            <tr>
                                <th scope="row">2</th>
                                <td>Jacob</td>
                                <td>Thornton</td>
                                <td>@fat</td>
                            </tr>
                            <tr>
                                <th scope="row">3</th>
                                <td>Larry</td>
                                <td>the Bird</td>
                                <td>@twitter</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div id="add" class="tab-pane fade ">

                        <form class="form-horizontal">
                            <div class="form-group">
                                <label for="productName" class="col-md-2 control-label">商品名称</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="productName" placeholder="name">
                                </div>


                                <label for="brandName" class="col-md-2 control-label">商品品牌</label>
                                <div class="col-md-4">
                                    <input type="password" class="form-control" id="brandName" placeholder="Password">
                                </div>
                            </div>
                            <div class="form-group">
                                <label  class="col-md-2 control-label">商品价格</label>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                                    <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-minus"></i></span>
                                    <input type="text" class="form-control" placeholder="Username" aria-describedby="basic-addon1">
                                    </div>
                                </div>


                                <label for="inputPassword3" class="col-md-2 control-label">商品品牌</label>
                                <div class="col-md-4">
                                    <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                                </div>
                            </div>
                            <div style="text-align: center">

                                    <button type="button" class="btn btn-primary">Submit</button>
                                    <button type="reset" class="btn btn-default">Reset</button>

                            </div>
                        </form>


            </div>






        </div>

    </div>


</div>
</body>
</html>
