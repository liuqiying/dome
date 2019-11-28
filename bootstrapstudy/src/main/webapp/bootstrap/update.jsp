<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/16
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="<%=request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="<%=request.getContextPath() %>/js/bootstrap3/js/bootstrap.min.js"></script>

    <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/moment-with-locales.js"></script>
    <script src="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap3/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css">
</head>
<script>
    $(function () {
        initBrandList();
        initDate();
    })

    function  initBrandList() {
        var brandId=${product.brandId};

        $.post(
            "<%=request.getContextPath()%>/getBrandList.do",
            function(data){
                var str="";
                for (var i = 0; i < data.length; i++) {
                    if(brandId==data[i].id){
                      str +=    '<option value="'+data[i].id+'" selected>'+data[i].name+'</option>'
                    }else{
                       str +=   '<option value="'+data[i].id+'" >'+data[i].name+'</option>'
                      }

                }
                $("#brand").append(str)
            }
        )

    }
    function initDate(){
        $('#createDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear:true


        });

    }
</script>
<body>
<div class="container-fluid" style="margin-top: 5%">
    <form class="form-horizontal" action="<%=request.getContextPath()%>/updataProductForm.do" method="post">
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="name" value="${product.name}">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品价格</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="price" value="${product.price}">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品品牌</label>
            <div class="col-sm-2">
                <select class="form-control" name="brandId" id="brand">
                    <option value="-1">==请选择==</option>

                </select>
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">生产日期</label>
            <div class="col-sm-2">
                <input type="text" name="createDate" id="createDate" class="form-control " value="<fmt:formatDate value='${product.createDate}'/>" >
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"></i>提交</button>
                <button type="reset" class="btn btn-default"><i class="glyphicon glyphicon-repeat"></i>重置</button>
            </div>
        </div>
    </form>

</div>

</body>
</html>