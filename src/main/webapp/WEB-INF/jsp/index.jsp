<%--
  Created by IntelliJ IDEA.
  Date: 2018/2/8
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="common/head.jsp"%>
    <title>共享单车系统首页</title>
    <style type="text/css">
        ui{
            line-height: 30px;
        }
        *{
            text-decoration:none;
        }
        a:link {color: #1e2c09
        }		/* 未访问的链接 */
        a:visited {color: rgba(255, 65, 41, 0.98);
        }	/* 已访问的链接 */
        a:hover {color: #9fecff
        }	/* 鼠标移动到链接上 */
        a:active {color: #9fecff
        }
        /* 正在被点击的链接 */
        @font-face {
            font-family: 'MyNewFont';   /*字体名称*/
            src: url('fonts/樱花字体.ttf');       /*字体源文件*/
        }
    </style>

</head>
<body class="easyui-layout">
<!--导航栏-->
<div data-options="region:'north',split:true" style="height:95px;">
    <div style="margin: 0px 50px;" >
        <img  src="images/login/bike.png" height="80px">
    </div>
    <div style="position:absolute; left: 35%;top: 10px">
        <p  style="font-family: MyNewFont"><font color="#" size="7px">&nbsp;共享单车管理系统</font></p>
    </div>
    <div style="position:absolute; right: 30px;top: 25px">

        <a href="admin/logout">[退出登陆]</a>
    </div>
    <div style="position: absolute;right:30px; top:50px;">


    </div>
</div>

<!--左边菜单-->
<div data-options="region:'west',title:'功能区',split:true" style="width:200px;">
    <div id="aa" class="easyui-accordion" style="width:193px" data-options="multiple:true,border:0">

        <c:if test="${sessionScope.admin.aRole eq '管理员' }">
            <div title="管理员面板" data-options="iconCls:'',selected:true " style="overflow:auto;padding:10px;">
                <ui>
                    <li><a href="javascript:void(0);" pageUrl="admin/adminManage" >用户权限管理</a></li>
                    <li><a href="javascript:void(0);" pageUrl="place/placeManage" >服务点管理</a></li>
                </ui>
            </div>
            <div title="信息统计" data-options="iconCls:''" style="padding:10px;">
                <ui>
                    <li><a href="javascript:void(0);" pageUrl="total/totalManage"  >汇总</a></li>
                </ui>
            </div>
            <div title="学生信息管理" data-options="iconCls:''" style="padding:10px;">
                <ui>
                    <li><a href="javascript:void(0);" pageUrl="student/studentManage">管理录入的学生</a></li>
                </ui>
            </div>

        </c:if>
        <div title="单车信息管理" data-options="iconCls:''" style="overflow:auto;padding:10px;">
            <ui>
                <li><a href="javascript:void(0);" pageUrl="bike/bikeManage" >单车列表</a></li>
                <li><a href="javascript:void(0);" pageUrl="category/categoryManage" >分类管理</a></li>
            </ui>
        </div>

        <div title="租赁订单信息" data-options="iconCls:'',selected:true" style="padding:10px;">
            <ui>
                <li><a href="javascript:void(0);" pageUrl="orders/ordersManage"  >单车租赁</a></li>
            </ui>
        </div>


    </div>
</div>
<!--内容-->
<div data-options="region:'center',title:'详情页'" style="padding:5px;background:#eee;">
    <div id="tt" class="easyui-tabs"  data-options="fit:true">
        <div title="欢迎页" style="padding:20px;display:none;">
            欢迎登陆共享单车管理系统！
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    //左边菜单点击事件
    $(function () {

        $("a[pageUrl]").click(function () {
            var pageUrl = $(this).attr("pageUrl");
            var title = $(this).html();
            //判断选项卡标题，是否有左边菜单标题
            var isExist = $('#tt').tabs("exists",title);
            if(!isExist){
                $('#tt').tabs('add',{
                    title:title,
                    content:"<iframe  frameborder ='0' width = '100%' height= '99%' src='"+pageUrl+"'></iframe>",
                    closable:true,
                    fit:true,
                    tools:[{
                        iconCls:'icon-mini-refresh',
                        handler:function(){
                            alert('refresh');
                        }
                    }]
                });
            }else{//存在这个标题选项卡，则选择这个卡
                $("#tt").tabs("select",title);
            }
        });

        //改变风格Menu   使用easyui menu方法
        $("#changeTheme").menu({
            onClick:function(item){
                var themeName = item.text;
                var href = $("#styleId").attr("href");
                href =  href.substring(0,href.indexOf("themes"))+"themes/"+themeName+"/easyui.css";
                $("#styleId").attr("href",href);
            }

        });

    });


</script>


</html>
