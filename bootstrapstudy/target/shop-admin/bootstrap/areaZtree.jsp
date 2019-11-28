<%--
  Created by IntelliJ IDEA.
  User: 柒柒柒
  Date: 2019/11/7
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>地区管理</title>
    <jsp:include page="/common/script.jsp"></jsp:include>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/ztree/js/jquery.ztree.core.min.js"></script>
    <link href="<%=request.getContextPath()%>/js/ztree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
    var zTreeObj;
    var setting = {
        callback: {
            onClick: zTreeOnClick
        },
        data: {
            key:{
                name: "cityname"
            },
            simpleData: {
                //enable:true   采用简单数据模式 (Array)
                enable: true,
                idKey: "id",
                pIdKey: "pid",
                rootPId: 0
            }
        }
    };
    //pId:父节点的id
    function zTreeOnClick(event, treeId, treeNode){
       // alert(treeNode.id+"-----------"+treeNode.name);
        $("#caozuo").css("display","");
    }
    $(document).ready(function(){
        //zTree 初始化方法
        //zTreeNodes  zTree 的节点数据，
        $.post(
            "<%=request.getContextPath()%>/area/queryAreaList.do",
            function(data){
                // data = eval("("+data.aa+")");
                alert(data);
                zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, data);
            }
        )
    });
    function expandTree() {
        var tree = $.fn.zTree.getZTreeObj('treeDemo');
        tree.expandAll(tree);
    }

    function closeTree() {
        var tree = $.fn.zTree.getZTreeObj('treeDemo');
        //获取 zTree 的全部节点数据将节点数据转换为简单 Array 格式
        var nodes = tree.transformToArray(tree.getNodes());
        for (var i = 0; i < nodes.length; i++) {
            if (nodes[i].level == 0) {
                console.log(nodes[i].name);
                //根节点展开
                tree.expandNode(nodes[i], true, true, false)
            } else {
                tree.expandNode(nodes[i], false, true, false)
            }
        }
    }

</script>
</head>
<body>
<%--导航S--%>
<jsp:include page="/common/nav.jsp"></jsp:include>
<button   onclick="closeTree()" class="btn btn-primary">合并</button>
<button  onclick="expandTree()" class="btn btn-primary">展开</button>
<ul id="treeDemo" class="ztree" ></ul>
</body>
</html>
