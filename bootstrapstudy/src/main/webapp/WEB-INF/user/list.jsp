<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/24
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="/common/script.jsp"></jsp:include>
</head>
<script>
    $(function () {
        initDateTable();
    })
    function queryList(){
        $("#example").dataTable().fnDraw(false);//点击事件触发table重新请求服务器
    }
    function initDateTable(){
        myTable =    $('#example').DataTable({
            "serverSide": true,
            // 是否允许检索
            "searching": false,
            "lengthMenu": [5, 10, 20,50],
            "ajax": {
                url: '<%=request.getContextPath()%>/user/queryList.do',
                type: 'POST',
                //用于处理服务器端返回的数据。 dataSrc是DataTable特有的
                dataSrc: function (result) {
                    if (result.status==200) {
                        result.draw = result.data.draw;
                        result.recordsTotal = result.data.recordsTotal;
                        result.recordsFiltered = result.data.recordsFiltered;
                        return result.data.data;
                    }else{
                        return "";
                    }

                }
            },
            "columns": [
                {"data":"id",render:function (data,type,row,meta) {
                        return '<input type="checkbox" value="'+data+'" name="ids">';
                    }},
                { "data": "userName" },
                { "data": "sex",
                    render:function (data,type,row,meta) {
                        return  data==1?"男":"女";
                    }},
                { "data": "salary" },
                { "data": "age" },
                { "data": "joinTime",
                    render:function (data,type,row,meta) {
                        return new Date(data).toLocaleDateString();
                    }},
                { "data": "phone" },
                { "data": "email" },
                { "data": "areaName" },
             /* { "data": "createDate",
                    render:function (data,type,row,meta) {
                        return new Date(data).toLocaleDateString();
                    }},*/
               /* { "data": "filePath",
                    render:function (data,type,row,meta) {
                        return "<img src='<%=request.getContextPath()%>/"+data+"' width='50px' >";
                    }},*/
                {"data":"id",render:function(data,type,row,meta){
                        return ' <div class="btn-group" role="group" aria-label="...">'+
                            '<button type="button" class="btn btn-info '+btn_update+'" onclick="toUpdate('+data+')"><i class="glyphicon glyphicon-wrench"></i>修改</button>'+
                            '<button type="button" class="btn btn-danger '+btn_delete+'" onclick="deleteProduct('+data+')"><i class="glyphicon glyphicon-remove"></i>删除</button>'+
                            '</div>';
                    }}

            ],
            "initComplete":function (setting,json) {

            },
            "drawCallback": function( settings ) {
               /* console.log(idList);
                if(idList.length>0){
                    $("[name='ids']").each(function () {
                        if(idList.indexOf(this.value)!=-1){
                            this.checked=true;
                            $(this).parent().parent().css("background-color","#66afe9");
                        }
                    })
                }*/

            },
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



    function insertUser(){
        bootbox.dialog({
            message: $("#showAddDiv").html(),
            title: "添加",
            size:"large",
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
                            var param={};
                            param.userName=$("#add_userName").val();
                            param.passWord=$("#add_passWord").val();
                            param.sex=$("[name=sex]:checked").val();
                            param.salary=$("#add_salary").val();
                            param.age=$("#add_age").val();
                            param.joinTime=$("#add_joinTime").val();
                            param.phone=$("#add_phone").val();
                            param.email=$("#add_email").val();

                            param.area1=$("#add_category1").val()==-1?null:$("#add_category1").val();
                            param.area2=$("#add_category2").val()==-1?null:$("#add_category2").val();
                            param.area3=$("#add_category3").val()==-1?null:$("#add_category3").val();
                            param.area4=$("#add_category4").val()==-1?null:$("#add_category4").val();
                           var roleAdd=[]

                        $("[name='addRole']:checked").each(function(){
                            roleAdd.push(this.value)
                        })
                        param.roleAdd=roleAdd;
                            $.post(
                                "<%=request.getContextPath()%>/user/addUserBy.do",
                                param,
                                function (data) {
                                    if(data.status==200){
                                        queryList();
                                    }else{
                                        bootbox.alert("操作失败！,请联系管理员",function(){

                                        })
                                    }
                                }
                            )
                    }
                }
            }
        });
        //初始化分类
        showCategory(0,null,1);
        //初始化日期插件
        initAddDate();
        //初始化文件插件
        //initAddFileInput();
        //加载表单验证
        //initFormValidator()
        //添加角色
        initAddRole();
    }
    function initAddRole() {
        alert("1223123")
        $.post(
            "<%=request.getContextPath()%>/role/queryAllList.do",
            function(data){
                 if(data.status==200){
                    var list=data.data;
                    var str="";
                    for (var i = 0; i < list.length; i++) {
                        str+='<input type="checkbox" name="addRole" value='+list[i].id+'>'+list[i].roleName;
                    }
                    $("#showRole").html(str);
                }
        })
    }

    function  showCategory(pid,obj,a) {
        //清除当前节点的父节点 之后的节点
        $(obj).parent().nextAll().remove();
        $.post(
            "<%=request.getContextPath()%>/user/areaAddByPid.do",
            {"pid":pid},
            function(result){
                if(result.status==200 && result.data.length>0){
                    var data= result.data;
                    var str =" <div class=\"col-sm-2\" >\n" +
                        " <select class=\"form-control\" id=\"add_category"+(a++)+"\" onchange=\"showCategory(this.value,this,"+a+")\">\n" +
                        "<option value=\"-1\">==请选择==</option>\n" ;
                    for (var i = 0; i < data.length; i++) {
                        str +=  '<option value="'+data[i].id+'">'+data[i].cityname+'</option>'
                    }
                    str +="</select></div>"
                    $("#areaDiv").append(str);
                }
            }
        )

    }
    /*日期*/
    function initAddDate(){
        $('#add_joinTime').datetimepicker({
            format:"YYYY-MM-DD",
            showClear: true
        });
    }
</script>

<body>
<jsp:include page="/common/nav.jsp"></jsp:include>
<div class="container-fluid">
    <div class="row">

        <div class="col-md-9">



            <div class="panel panel-primary" >
                <!-- Default panel contents -->

                <div class="panel-heading" style="text-align: left">
                    <button type="button" class="btn btn-success" onclick="insertUser()"><i class="glyphicon glyphicon-plus"></i>添加用户</button>
                    <button type="button" class="btn btn-danger" onclick="deleteBatch()"><i class="glyphicon glyphicon-trash"></i>批量删除</button>
                </div>

                <div  class="panel-body">
                    <!-- Table -->
                    <table id="example" class="table table-striped table-bordered" style="width:100%">
                        <thead>
                        <tr >

                            <th><input type="checkbox" onclick="xuan()">选择</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>薪资</th>
                            <th>年龄</th>
                            <th>工作时间</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>地址</th>


                            <th>操作</th>

                        </tr>
                        </thead>

                        <tfoot>
                        <tr>
                            <th><input type="checkbox" onclick="xuan()">全选</th>
                            <th>用户名</th>
                            <th>性别</th>
                            <th>薪资</th>
                            <th>年龄</th>
                            <th>工作时间</th>
                            <th>电话</th>
                            <th>邮箱</th>
                            <th>地址</th>

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
<script type="text/html" id="showAddDiv">
    <div  >
        <form class="form-horizontal" id="formApp" >
            <div class="form-group">
                <label  class="col-sm-2 control-label">账号</label>
                <div class="col-sm-4">
                    <input type="text" name="userName" class="form-control" id="add_userName" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">密码</label>
                <div class="col-sm-4">
                    <input type="text" name="passWord" class="form-control" id="add_passWord" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">性别</label>
                <div class="col-sm-4">
                    <input type="radio" name="sex"  value="1">男
                    <input type="radio" name="sex"  value="2">女
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">薪资</label>
                <div class="col-sm-4">
                    <input type="text" name="salary" class="form-control" id="add_salary" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">年龄</label>
                <div class="col-sm-4">
                    <input type="text" name="age" class="form-control" id="add_age" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">时间</label>
                <div class="col-sm-4">
                    <input type="text" name="joinTime" class="form-control" id="add_joinTime" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">电话</label>
                <div class="col-sm-4">
                    <input type="text" name="phone" class="form-control" id="add_phone" >
                </div>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">邮箱</label>
                <div class="col-sm-4">
                    <input type="text" name="email" class="form-control" id="add_email" >
                </div>
            </div>
            <div class="form-group" id="areaDiv">
                <label  class="col-sm-2 control-label">地区</label>
            </div>
            <div class="form-group">
                <label  class="col-sm-2 control-label">角色:</label>
                <div class="col-sm-4" id="showRole">

                </div>
            </div>

        </form>
    </div>


</script>


</html>
