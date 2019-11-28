<%--
  Created by IntelliJ IDEA.
  User: gy
  Date: 2019/10/16
  Time: 14:08
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
        initBrandList();
        initDate();
        initFileInput();
        showCategory(0,null,1);
        initFormValidator();
    })

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
        $('#createDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: 'zh-CN',
            showClear:true

        });

    }
    function initFileInput() {

       $("#input-id").fileinput({
            language: 'zh', //设置语言
            uploadUrl: "<%=request.getContextPath()%>/photoUpload.do", //上传的地址
            allowedFileExtensions: ['jpg', 'gif', 'png','exe'],//接收的文件后缀
            //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
            uploadAsync: true, //默认异步上传
            showUpload: true, //是否显示上传按钮
            showRemove : true, //显示移除按钮
            showPreview : true, //是否显示预览
            showCaption: false,//是否显示标题
            browseClass: "btn btn-primary", //按钮样式
            //dropZoneEnabled: true,//是否显示拖拽区域
            //minImageWidth: 50, //图片的最小宽度
            //minImageHeight: 50,//图片的最小高度
            //maxImageWidth: 1000,//图片的最大宽度
            //maxImageHeight: 1000,//图片的最大高度
            //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
            //minFileCount: 0,
            maxFileCount: 10, //表示允许同时上传的最大文件个数
            enctype: 'multipart/form-data',
            validateInitialCount:true,
            previewFileIcon: "<i class='glyphicon glyphicon-cloud'></i>",
            msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
            layoutTemplates :{
                //actionDelete:'', //去除上传预览的缩略图中的删除图标
                //actionUpload:'',//去除上传预览缩略图中的上传图片；
                //actionZoom:''   //去除上传预览缩略图中的查看详情预览的缩略图标。
            }
        }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
            console.log('文件上传成功！');
            console.log(data);
           $("#filePath").val(data.response.filePath);

        })
    }

    function  showCategory(pid,obj,a) {
        //清除当前节点的父节点 之后的节点
        $(obj).parent().nextAll().remove();
        $.post(
            "<%=request.getContextPath()%>/category/queryListByPid.do",
            {"pid":pid},
            function(data){
                if(data.length>0){
                    var str =" <div class=\"col-sm-2\" >\n" +
                        " <select class=\"form-control\" name=\"category"+(a++)+"\" id=\"category\" onchange=\"showCategory(this.value,this,"+a+")\">\n" +
                        "<option value=\"-1\">==请选择==</option>\n" ;
                    for (var i = 0; i < data.length; i++) {
                          str +=  '<option value="'+data[i].id+'">'+data[i].categoryName+'</option>'
                    }
                    str +="</select></div>"
                    $("#categoryDiv").append(str);
                }
            }
        )

    }

    function initFormValidator(){
        $('#formApp').bootstrapValidator({
            // 默认的提示消息
            message: 'This value is not valid',
            // 表单框里右侧的icon
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '商品名验证失败',
                    validators: {
                        notEmpty: {
                            message: '商品名不能为空'
                        }
                    }
                },
                price: {
                    validators: {
                        notEmpty: {
                            message: '价格不能为空'
                        }
                    }
                }
            }
        });
    }
</script>
<body>
<div class="container-fluid" style="margin-top: 10px">
    <form class="form-horizontal" id="formApp" action="<%=request.getContextPath()%>/addProductForm.do" method="post">
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品名称</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="name" placeholder="商品名称">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品价格</label>
            <div class="col-sm-2">
                <input type="text" class="form-control" name="price" placeholder="商品价格">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品品牌</label>
            <div class="col-sm-2" >
                <select class="form-control" name="brandId" id="brand">
                    <option value="-1">==请选择==</option>
                </select>
            </div>
        </div>


        <div class="form-group" id="categoryDiv">
            <label  class="col-sm-2 control-label">商品分类</label>
        </div>



        <div class="form-group">
            <label  class="col-sm-2 control-label">生产日期</label>
            <div class="col-sm-2">
                <input type="text" name="createDate" id="createDate" class="form-control" placeholder="" aria-describedby="basic-addon1">
            </div>
        </div>
        <div class="form-group">
            <label  class="col-sm-2 control-label">商品图片</label>
            <div class="col-sm-5" style="height: 300px">
                <input id="input-id" name="file" multiple type="file" data-show-caption="true">
                <input type="text" name="filePath" id="filePath">
            </div>
        </div>

        <div class="form-group" style="margin-top: 200px">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"></i>提交</button>
                <button type="reset" class="btn btn-default"><i class="glyphicon glyphicon-repeat"></i>重置</button>
            </div>
        </div>
    </form>

</div>

</body>
</html>
