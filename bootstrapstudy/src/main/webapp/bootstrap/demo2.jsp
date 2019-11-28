<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/13
  Time: 14:41
  To change this tempqueryMapListlate use File | Settings | File Templates.
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
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" ><a href="#"><span class="glyphicon glyphicon-th-list"></span>产品列表</a></li>
                                <li role="presentation"><a href="#"><i class="glyphicon glyphicon-plus"></i>增加产品</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-primary">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                               用户管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" ><a href="#"><span class="glyphicon glyphicon-user"></span>用户列表</a></li>
                                <li role="presentation"><a href="#"><i class="glyphicon glyphicon-plus"></i>增加用户</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingThree">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                               菜单管理
                            </a>
                        </h4>
                    </div>
                    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                        <div class="panel-body">
                            <ul class="nav nav-pills nav-stacked">
                                <li role="presentation" ><a href="#"><span class="glyphicon glyphicon-tree-deciduous"></span>权限树</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="col-md-9">
            <form class="form-horizontal">
                <div class="form-group">
                    <label for="productName" class="col-sm-2 control-label">商品名称</label>
                    <div class="col-sm-3">
                        <input type="email" class="form-control" id="productName" placeholder="商品名称">
                    </div>
                    <label for="brandName" class="col-sm-2 control-label">商品品牌</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="brandName">
                            <option>==请选择==</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-resize-horizontal"></i></span>
                            <input type="text" class="form-control" placeholder="0.00" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <label  class="col-sm-2 control-label">创建日期</label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
                            <span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input type="text" class="form-control" placeholder="" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>


                    <div style="text-align: center">
                        <button type="button" class="btn btn-primary btn-lg"><i class="glyphicon glyphicon-ok"></i>Submit</button>&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-default btn-lg"><i class="glyphicon glyphicon-repeat"></i>Reset</button>
                    </div>

            </form>


            <div class="panel panel-primary" >
                <!-- Default panel contents -->
                <div class="panel-heading">用户列表</div>
               <div  class="panel-body">
                <!-- Table -->
                <table class="table table-bordered  table-hover">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th scope="row">1</th>
                        <td>Mark</td>
                        <td>Otto</td>
                        <td>@mdo</td>
                        <td>
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-info"><i class="glyphicon glyphicon-wrench"></i>修改</button>
                                <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i>删除</button>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>Jacob</td>
                        <td>Thornton</td>
                        <td>@fat</td>
                        <td>
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-info"><i class="glyphicon glyphicon-wrench"></i>修改</button>
                                <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i>删除</button>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>Larry</td>
                        <td>the Bird</td>
                        <td>@twitter</td>
                        <td>
                            <div class="btn-group" role="group" aria-label="...">
                                <button type="button" class="btn btn-info"><i class="glyphicon glyphicon-wrench"></i>修改</button>
                                <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i>删除</button>
                            </div>

                        </td>
                    </tr>
                    </tbody>
                </table>
               </div>
            </div>
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li>
                        <a href="#" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li>
                        <a href="#" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>




        </div>

    </div>


</div>
</body>
</html>
