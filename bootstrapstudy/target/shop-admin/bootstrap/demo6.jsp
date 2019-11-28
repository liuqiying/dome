<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/14
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/js/DataTables/DataTables-1.10.18/js/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath()%>/js/DataTables/DataTables-1.10.18/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.min.css">
</head>
<script>
    $(document).ready(function() {
        $('#example').DataTable({
            "serverSide": true,
            "ajax": {
                url: '<%=request.getContextPath()%>/queryMapList.do',
                type: 'POST'
            },
            "columns": [
                { "data": "name" },
                { "data": "price" },
                { "data": "brandId" },
                { "data": "createDate",
                render:function (data,type,row,meta) {
                    return new Date(data).toLocaleDateString();
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
    } );

</script>
<body>
<table id="example" class="table table-striped table-bordered" style="width:100%">
    <thead>
    <tr>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>商品品牌</th>
        <th>生产时间</th>

    </tr>
    </thead>

    <tfoot>
    <tr>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>商品品牌</th>
        <th>生产时间</th>

    </tr>
    </tfoot>
</table>
</body>
</html>
