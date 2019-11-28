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

    <script src="<%=request.getContextPath()%>/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath()%>/js/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/moment-with-locales.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootbox/bootbox.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
</head>
<script>
    $(function(){
        initDateTable();
        initBrandList();
        initDate();


    })
    function deleteProduct(id){
      /*  bootbox.alert("确认删除", function () {
                            var strResult = "";
                    })*/
      /*  bootbox.confirm("确认删除", function (result) {
            if(result) {
                alert('点击了确认按钮');
            } else {
                alert('点击了取消按钮');
            }
        });*/

        bootbox.dialog({
            message: "确认删除",
            title: "提示信息",
            buttons: {
                Cancel: {
                    label: "取消",
                    className: "btn-default",
                    callback: function () {

                    }
                }
                , OK: {
                    label: "确认",
                    className: "btn-danger",
                    callback: function () {
                        $.post(
                            "<%=request.getContextPath()%>/deleteProduct.do",
                            {"id":id},
                            function(data){
                                if(data.status==200){
                                    queryList();
                                }else{
                                    bootbox.alert("系统异常，请联系管理员！", function () {

                                    })
                                }
                            }
                        )
                    }
                }
            }
        });



    }
    function toUpdate(id){

        location.href="<%=request.getContextPath()%>/toUpdate.do?id="+id;

    }
    function initDateTable(){
        $('#example').DataTable({
            "serverSide": true,
            // 是否允许检索
            "searching": false,
            "lengthMenu": [5, 10, 20,50],
            "ajax": {
                url: '<%=request.getContextPath()%>/queryMapList.do',
                type: 'POST',
                "data": function(d){
                    //添加额外的参数传给服务器
                    d.productName = $("#productName").val();
                    d.brandId = $("#brand").val();
                    d.minPrice = $("#minPrice").val();
                    d.maxPrice = $("#maxPrice").val();
                    d.minDate = $("#minDate").val();
                    d.maxDate = $("#maxDate").val();
                }
            },
            "columns": [
                {"data":"id",render:function (data,type,row,meta) {
                    return '<input type="checkbox" value="'+data+'" name="ids">';
                }},
                { "data": "name" },
                { "data": "price" },
                { "data": "brandName" },
                { "data": "createDate",
                    render:function (data,type,row,meta) {
                        return new Date(data).toLocaleDateString();
                    }},
                {"data":"id",render:function(data,type,row,meta){
                 return ' <div class="btn-group" role="group" aria-label="...">'+
                     '<button type="button" class="btn btn-info" onclick="toUpdate('+data+')"><i class="glyphicon glyphicon-wrench"></i>修改</button>'+
                        '<button type="button" class="btn btn-danger" onclick="deleteProduct('+data+')"><i class="glyphicon glyphicon-remove"></i>删除</button>'+
                        '</div>';
                }}

            ],
            "language": {
                "sProcessing":   "处理中...",
                "sLengthMenu":   "_MENU_ 记录/页",
                "sZeroRecords":  "没有匹配的记录",
                "sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
                "sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项记录过滤)",
                "sInfoPostFix":  "",
                "sSearch":       "过滤:",
                "sUrl":          "",
                "oPaginate": {
                    "sFirst":    "首页",
                    "sPrevious": "上页",
                    "sNext":     "下页",
                    "sLast":     "末页"
                }
            }
        });
    }


    function  initBrandList() {
        $.post(
            "<%=request.getContextPath()%>/getBrandList.do",
            function(data){
                if(data.length>0){
                    for (var i = 0; i < data.length; i++) {
                       $("#brand").append(
                           '<option value="'+data[i].id+'">'+data[i].name+'</option>'
                       )
                        
                    }

                }
            }
        )

    }
    function initDate(){
        $('#minDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN'

        });
        $('#maxDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear:true
        });


    }
    function queryList(){
        $("#example").dataTable().fnDraw(false);//点击事件触发table重新请求服务器

    }

</script>
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
                    <label for="brand" class="col-sm-2 control-label">商品品牌</label>
                    <div class="col-sm-3">
                        <select class="form-control" id="brand">
                            <option value="-1">==请选择==</option>

                        </select>
                    </div>
                    <div class="col-md-2"></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">价格</label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" id="minPrice" class="form-control" placeholder="0.00" aria-describedby="basic-addon1">
                            <span class="input-group-addon" id="basic-addon1"><i class="glyphicon glyphicon-resize-horizontal"></i></span>
                            <input type="text"  id="maxPrice" class="form-control" placeholder="0.00" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <label  class="col-sm-2 control-label">创建日期</label>
                    <div class="col-sm-3">
                        <div class="input-group">
                            <input type="text" id="minDate" class="form-control" placeholder="" aria-describedby="basic-addon1">
                            <span class="input-group-addon" id="basic-addon2"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input type="text" id="maxDate" class="form-control" placeholder="" aria-describedby="basic-addon1">
                        </div>
                    </div>
                    <div class="col-md-2"></div>
                </div>


                    <div style="text-align: center">
                        <button type="button" onclick="queryList()" class="btn btn-primary "><i class="glyphicon glyphicon-ok"></i>Submit</button>&nbsp;&nbsp;&nbsp;
                        <button type="reset" class="btn btn-default"><i class="glyphicon glyphicon-repeat"></i>Reset</button>
                    </div>

            </form>


            <div class="panel panel-primary" >
                <!-- Default panel contents -->
                <div class="panel-heading">用户列表</div>
               <div  class="panel-body">
                <!-- Table -->
                   <table id="example" class="table table-striped table-bordered" style="width:100%">
                       <thead>
                       <tr>

                           <th><input type="checkbox" onclick="xuan()">全选</th>
                           <th>商品名称</th>
                           <th>商品价格</th>
                           <th>商品品牌</th>
                           <th>生产时间</th>
                           <th>操作</th>

                       </tr>
                       </thead>

                       <tfoot>
                       <tr>
                           <th><input type="checkbox" onclick="xuan()">全选</th>
                           <th>商品名称</th>
                           <th>商品价格</th>
                           <th>商品品牌</th>
                           <th>生产时间</th>
                           <th>操作</th>
                       </tr>
                       </tfoot>
                   </table>
               </div>
            </div>





        </div>

    </div>


</div>
</body>
</html>
