<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>layout 后台大布局 - Layui</title>
    <link rel="stylesheet" href="/static/admin/css/layui.css"/>
    <script type="text/javascript" src="/static/jquery/jquery-3.2.1.min.js"></script>
    <link rel="stylesheet" href="/static/editormd/css/editormd.min.css"/>
    <script type="text/javascript" src="/static/editormd/editormd.min.js"></script>


</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">Simple-Blog 管理后台</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-right">

            <li class="layui-nav-item"><a>欢迎您！<span>不荒</span></a></li>
            <li class="layui-nav-item"><a>当前时间: <span id="mytime"></span></a></li>
            <li class="layui-nav-item"><a href="/"><i class="layui-icon">&#xe609;</i>&nbsp;&nbsp;去首页</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="javascript:">Article 文章</a>
                    <dl class="layui-nav-child">
                        <dd><a href="/admin/content/1">文章列表</a></dd>
                        <dd class="layui-this"><a>添加文章</a></dd>
                        <dd><a href="/admin/content/garbage">回收站</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">目录和标签</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">目录</a></dd>
                        <dd><a href="javascript:;">标签</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a href="javascript:;">多说评论</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">评论列表</a></dd>
                        <dd><a href="javascript:;">功能管理</a></dd>
                        <dd><a href="">分析统计</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">插件管理</a></li>
                <li class="layui-nav-item">
                    <a href="javascript:">系统设置</a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;">静态数据</a></dd>
                        <dd><a href="javascript:;">账号设置</a></dd>
                        <dd><a href="">超链接</a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="">退出登录</a></li>
            </ul>
        </div>
    </div>


    <div class="layui-body" id="target_body" style="margin-left: 8px; margin-right: 8px;margin-top: 8px;">
        <form class="layui-form" action="">
            <div class="layui-form-item">
                <input type="text" name="title" required  lay-verify="required"
                       placeholder="请输入标题" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-item layui-form-text">
                <div id="test-editormd">
                    <textarea class="editormd-md-textarea" style="display:none;"></textarea>
                    <!-- 接受 html 格式数据-->
                    <textarea class="editormd-html-textarea"  name="html"></textarea>

                </div>
            </div>

            <div class="layui-form-item">
                <input type="text" name="title" required  lay-verify="required"
                       placeholder="文章访问标签，不带 / 标签" autocomplete="off" class="layui-input">
            </div>

            <div class="layui-form-item">
                <input type="text" name="title" required  lay-verify="required"
                       placeholder="文章关联的标签，用 、 隔开" autocomplete="off" class="layui-input">
            </div>

            <div class="layui-form-item">
                <input type="checkbox" name="like[write]" title="关于">
                <input type="checkbox" name="like[read]" title="好友">
                <input type="checkbox" name="like[dai]" title="分享">
                <input type="checkbox" name="like[dai]" title="推荐书单">
                <input type="checkbox" name="like[dai]" title="碎语">
                <input type="checkbox" name="like[dai]" title="文章列表" checked>
                <input type="checkbox" name="like[dai]" title="ISSUES">
            </div>

            <div class="layui-form-item">
                <button class="layui-btn layui-btn-normal">保存文章</button>
                <button class="layui-btn layui-btn-warm">存为草稿</button>
                <button class="layui-btn layui-btn-danger">预览文章</button>
            </div>
        </form>


    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        © lqwit.com - 码农全家桶管理后台
    </div>

    <script type="text/javascript">
        var testEditor;
        $(function() {
            testEditor = editormd("test-editormd", {
                width   : "100%",
                height  : 720,
                syncScrolling : "single",
                placeholder:"请开始你的表演...",
                path    : "/static/editormd/lib/",
                imageUpload : true,
                toolbarAutoFixed: false, //固定工具栏
                fontSize: "16px",
                imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                imageUploadURL : "./php/upload.php",
                toolbarIcons : function() {
                    return ["h1","h2","h3","h4","h5", "|","bold", "hr","|","image","code",
                        "|","table", "datetime","fullscreen","||", "watch", "preview"]
                },
                saveHTMLToTextarea : true
            });
        });

        </script>

    <script>
        layui.use('form', function(){
            var form = layui.form;
            form.render(); //不加这行代码 layui 可能导致复选框无法显示出来

        });
    </script>


    <script>
        function showTime(){
            nowtime=new Date();
            year=nowtime.getFullYear();
            month=nowtime.getMonth()+1;
            date=nowtime.getDate();
            document.getElementById("mytime").innerText=year+"年"+month+"月"+date+" "+nowtime.toLocaleTimeString();
        }
        setInterval("showTime()",1000);
    </script>
</div>

<script type="text/javascript" src="/static/admin/js/layui.all.js"></script>
</body>
</html>