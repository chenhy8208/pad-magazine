<%@ page language="java" import="java.text.SimpleDateFormat,java.util.Date" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Head -->
<head>
    <jsp:include page="inc/key.jsp" flush="true">
        <jsp:param name="pageTitle" value="首页"/>
    </jsp:include>
    <script src="assets/js/jquery-2.0.3.min.js"></script>
    <link rel="stylesheet" href="/css/layui.css"  media="all">
    <script src="/layui.js" charset="utf-8"></script>
    <script src="/jquery.format.js"></script>
    <style>
        a.insertStr{position:relative; top:10px;}
        textarea.leo-font-14{font-size:16px;}
    </style>

    <script>
        function loadFiles() {
            $("#fileDataTbody").html("加载中...");
            $.ajax({
                type:'GET',
                url:"/fileList",
                data:{path:'<c:out value="${path}" escapeXml="false" />'},
                //async:false,
                success:function(msg)
                {
                    $("#fileDataTbody").html(msg.data);
                }
            })
        }

        $(function(){
            loadFiles();
        });
    </script>
    <script type="text/javascript" src="clipboard.min.js"></script>
</head>
<!-- /Head -->
<!-- Body -->
<body>
<%@ include file="inc/header.jsp" %>


<!-- Main Container -->
<div class="main-container container-fluid">
    <!-- Page Container -->
    <div class="page-container">
        <%@ include file="inc/left.jsp" %>

        <!-- Chat Bar -->
        <div id="chatbar" class="page-chatbar">
            <div class="chatbar-contacts">
                <div class="contacts-search">
                    <input type="text" class="searchinput" placeholder="Search Contacts" />
                    <i class="searchicon fa fa-search"></i>
                    <div class="searchhelper">Search Your Contacts and Chat History</div>
                </div>
                <ul class="contacts-list">
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/divyia.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Divyia Philips</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                last week
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/Nicolai-Larson.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Adam Johnson</div>
                            <div class="contact-status">
                                <div class="offline"></div>
                                <div class="status">left 4 mins ago</div>
                            </div>
                            <div class="last-chat-time">
                                today
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/John-Smith.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">John Smith</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                1:57 am
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/Osvaldus-Valutis.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Osvaldus Valutis</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                today
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/Javi-Jimenez.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Javi Jimenez</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                today
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/Stephanie-Walter.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Stephanie Walter</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                yesterday
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/Sergey-Azovskiy.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Sergey Azovskiy</div>
                            <div class="contact-status">
                                <div class="offline"></div>
                                <div class="status">offline since oct 24</div>
                            </div>
                            <div class="last-chat-time">
                                22 oct
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/Lee-Munroe.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Lee Munroe</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                today
                            </div>
                        </div>
                    </li>
                    <li class="contact">
                        <div class="contact-avatar">
                            <img src="assets/img/avatars/divyia.jpg" />
                        </div>
                        <div class="contact-info">
                            <div class="contact-name">Divyia Philips</div>
                            <div class="contact-status">
                                <div class="online"></div>
                                <div class="status">online</div>
                            </div>
                            <div class="last-chat-time">
                                last week
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="chatbar-messages" style="display: none;">
                <div class="messages-contact">
                    <div class="contact-avatar">
                        <img src="assets/img/avatars/divyia.jpg" />
                    </div>
                    <div class="contact-info">
                        <div class="contact-name">Divyia Philips</div>
                        <div class="contact-status">
                            <div class="online"></div>
                            <div class="status">online</div>
                        </div>
                        <div class="last-chat-time">
                            a moment ago
                        </div>
                        <div class="back">
                            <i class="fa fa-arrow-circle-left"></i>
                        </div>
                    </div>
                </div>
                <ul class="messages-list">
                    <li class="message">
                        <div class="message-info">
                            <div class="bullet"></div>
                            <div class="contact-name">Me</div>
                            <div class="message-time">10:14 AM, Today</div>
                        </div>
                        <div class="message-body">
                            Hi, Hope all is good. Are we meeting today?
                        </div>
                    </li>
                    <li class="message reply">
                        <div class="message-info">
                            <div class="bullet"></div>
                            <div class="contact-name">Divyia</div>
                            <div class="message-time">10:15 AM, Today</div>
                        </div>
                        <div class="message-body">
                            Hi, Hope all is good. Are we meeting today?
                        </div>
                    </li>
                    <li class="message">
                        <div class="message-info">
                            <div class="bullet"></div>
                            <div class="contact-name">Me</div>
                            <div class="message-time">10:14 AM, Today</div>
                        </div>
                        <div class="message-body">
                            Hi, Hope all is good. Are we meeting today?
                        </div>
                    </li>
                    <li class="message reply">
                        <div class="message-info">
                            <div class="bullet"></div>
                            <div class="contact-name">Divyia</div>
                            <div class="message-time">10:15 AM, Today</div>
                        </div>
                        <div class="message-body">
                            Hi, Hope all is good. Are we meeting today?
                        </div>
                    </li>
                    <li class="message">
                        <div class="message-info">
                            <div class="bullet"></div>
                            <div class="contact-name">Me</div>
                            <div class="message-time">10:14 AM, Today</div>
                        </div>
                        <div class="message-body">
                            Hi, Hope all is good. Are we meeting today?
                        </div>
                    </li>
                    <li class="message reply">
                        <div class="message-info">
                            <div class="bullet"></div>
                            <div class="contact-name">Divyia</div>
                            <div class="message-time">10:15 AM, Today</div>
                        </div>
                        <div class="message-body">
                            Hi, Hope all is good. Are we meeting today?
                        </div>
                    </li>
                </ul>
                <div class="send-message">
                        <span class="input-icon icon-right">
                            <textarea rows="4" class="form-control" placeholder="Type your message"></textarea>
                            <i class="fa fa-camera themeprimary"></i>
                        </span>
                </div>
            </div>
        </div>
        <!-- /Chat Bar -->
        <!-- Page Content -->
        <div class="page-content">
            <!-- Page Breadcrumb -->
            <div class="page-breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="fa fa-home"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Magazine</li>
                </ul>
            </div>
            <!-- /Page Breadcrumb -->
            <!-- Page Header -->
            <div class="page-header position-relative">
                <div class="header-title">
                    <h1>
                        Pad 杂志
                        <small>
                            <i class="fa fa-angle-right"></i>
                            编辑
                        </small>
                    </h1>
                </div>
                <!--Header Buttons-->
                <div class="header-buttons">
                    <a class="sidebar-toggler" href="#">
                        <i class="fa fa-arrows-h"></i>
                    </a>
                    <a class="refresh" id="refresh-toggler" href="">
                        <i class="glyphicon glyphicon-refresh"></i>
                    </a>
                    <a class="fullscreen" id="fullscreen-toggler" href="#">
                        <i class="glyphicon glyphicon-fullscreen"></i>
                    </a>
                </div>
                <!--Header Buttons End-->
            </div>
            <!-- /Page Header -->
            <!-- Page Body -->
            <div class="page-body">



                <div class="row">

                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="widget">
                            <div class="widget-header bordered-bottom bordered-sky">
                                <span class="widget-caption">选用图片</span>
                            </div><!--Widget Header-->
                            <div class="widget-body" style="height:203px; overflow:scroll;">
                                <table lay-filter="demo" class="layui-table">
                                    <thead>
                                    <tr>
                                        <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                                        <th lay-data="{field:'username', width:80}">预览</th>
                                        <th lay-data="{field:'sex', width:80, sort: true}">文件名(点击复制)</th>
                                    </tr>
                                    </thead>
                                    <tbody id="fileDataTbody">
                                    </tbody>
                                </table>
                            </div><!--Widget Body-->
                        </div><!--Widget-->
                    </div>

                    <div class="col-lg-6 col-sm-6 col-xs-12">
                        <div class="widget">
                            <div class="widget-header bordered-bottom bordered-sky">
                                <span class="widget-caption">上传文件</span>
                            </div><!--Widget Header-->
                            <div class="widget-body" style="text-align:center; height:202px;">
                                <div class="layui-upload-drag" id="test10" style="width:370px; position:relative; top:20px;">
                                    <i class="layui-icon"></i>
                                    <p>点击上传，或将文件拖拽到此处</p>
                                </div>
                            </div><!--Widget Body-->
                        </div><!--Widget-->
                    </div>

                    <script>
                        layui.use('upload', function(){
                            var upload = layui.upload;

                            //执行实例
                            var uploadInst = upload.render({
                                elem: '#test10' //绑定元素
                                ,url: '/upload/' //上传接口
                                ,accept:'file'
                                ,data:{path:'<c:out value="${path}" escapeXml="false" />'}
                                ,done: function(res){
                                    //上传完毕回调
                                    console.log(res);
                                    if(res.state == '0') {
                                        loadFiles();
                                        //window.location.reload();
                                    } else {
                                        layer.alert(res.msg);
                                    }
                                }
                                ,error: function(){
                                    //请求异常回调
                                    layer.alert("上传失败~");
                                }
                            });
                        });
                    </script>

                    <div class="col-lg-12 col-sm-12 col-xs-12">
                        <div class="widget flat radius-bordered">
                            <div class="widget-header bg-themeprimary">
                                <span class="widget-caption">效果集</span>
                            </div>

                            <div class="widget-body">
                                <div class="widget-main ">
                                    <div class="tabbable">
                                        <ul class="nav nav-tabs tabs-flat" id="myTab11">
                                            <li class="active">
                                                <a data-toggle="tab" href="#home11" aria-expanded="true">
                                                    必填项
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home12" aria-expanded="false">
                                                    菜单
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home25" aria-expanded="false">
                                                    导航
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home26" aria-expanded="false">
                                                    视频动画
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home13" aria-expanded="false">
                                                    pageEnble
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home14" aria-expanded="false">
                                                    目录跳转
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home15" aria-expanded="false">
                                                    文字段落
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home16" aria-expanded="false">
                                                    视频
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home17" aria-expanded="false">
                                                    透明度动画
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home18" aria-expanded="false">
                                                    移动透明度动画
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home19" aria-expanded="false">
                                                    链接点
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home20" aria-expanded="false">
                                                    图集
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home21" aria-expanded="false">
                                                    音频
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home22" aria-expanded="false">
                                                    焦点图
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home23" aria-expanded="false">
                                                    自动切换图集
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home24" aria-expanded="false">
                                                    蒙版
                                                </a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#home27" aria-expanded="false">
                                                    滑块
                                                </a>
                                            </li>
                                        </ul>
                                        <div class="tab-content tabs-flat">
                                            <div id="home11" class="tab-pane active">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="8"><!--必须放到一开头最开始的位置,必须有-->
<key>totalPage</key>
<string>100</string>
<!--开始视频,没有填nil-->
<key>welcomeMedia</key>
<string>nil</string>
<!--这个位置可以插入菜单段落-->
<key>APlus</key>
<array>
<!--这里是页面开始-->
</array></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home12" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><key>menu</key>
<array>
<dict>
    <key>Title</key>
    <string>话题 FEATURE</string>
    <key>SubTitle</key>
    <string>关爱她的家具渴望</string>
    <key>Icon</key>
    <string>icon.jpg</string>
    <key>ShowMusicIcon</key>
    <!--0无1有-->
    <string>0</string>
    <key>ShowVideoIcon</key>
    <!--0无1有-->
    <string>0</string>
    <key>Go</key>
    <!--跳到第几页-->
    <string>1</string>
</dict>
</array></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>



                                            <div id="home25" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><key>nav</key>
<array>
<dict>
    <key>Index</key>
    <string>1</string>
    <key>Title</key>
    <string>话题 FEATURE</string>
    <key>SubTitle</key>
    <string>关爱她的家具渴望</string>
</dict>
<dict>
    <key>Index</key>
    <string>2</string>
    <key>Title</key>
    <string>话题 FEATURE</string>
    <key>SubTitle</key>
    <string>关爱她的家具渴望</string>
</dict>
</array></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home26" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>mediaAnimation</string>
			<key>Content</key>
			<dict>
                <key>Pos</key>
				<string>0,0,768,1024</string>
                <!--支持mp4格式-->
				<key>name</key>
				<string>nil</string>
			</dict>
		</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>


                                            <div id="home13" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>property</string>
			<key>Content</key>
			<dict>
				<!--是否按页翻页效果，0是NO，1是YES-->
				<key>PageEnble</key>
				<string>1</string>
			</dict>
		</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home14" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>menu</string>
			<key>Content</key>
			<dict>
				<!--内容,跳转到第几页,页码从1开始-->
				<key>Go</key>
				<string>6</string>
                <!--所在的位置（x,y,width,height）-->
				<key>Pos</key>
				<string>0,600,200,50</string>
                <!--是否显示边框帮助定位，0是不显示，1是显示-->
				<key>ShowBorder</key>
				<string>1</string>
			</dict>
		</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home15" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<!--在张图片上面添加特殊效果（索引从1开始一直到最后一张的位置）-->
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>webView</string>
			<key>Content</key>
			<dict>
				<!--内容HTML5代码-->
				<key>Content</key>
				<string><![CDATA[<p style='background:transparent;'>Hello，Hello<br/>Hello，Hello<br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/><br/>Hello，Hello<br/></p>]]></string>
                                                <!--所在的位置（x,y,width,height）-->
                                                <key>Pos</key>
                                                <string>250,300,400,150</string>
                                                <key>stay</key>
                                                <!--0不停留，1停留-->
                                                <string>0</string>
                                                </dict>
                                                </dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home16" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<!--在张图片上面添加特殊效果（索引从1开始一直到最后一张的位置）-->
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>media</string>
			<key>Content</key>
			<dict>
			  <!--视频类型(目前可选有［mp4/mov］)-->
			  <key>ContentType</key>
				<string>mp4</string>
                <!--内容就要填视频名称-->
				<key>Content</key>
				<string><![CDATA[welcome]]></string>
                <!--所在的位置（x,y,width,height）-->
				<key>Pos</key>
				<string>250,200,400,300</string>
                <!--下边条的高度-->
				<key>BarHeight</key>
				<string>40</string>
                <!--SeekRate设置开始播放的时间点(Float类型)-->
				<key>SeekRate</key>
				<string>0</string>
                <!--是否开始播放 0 停止，1是播放-->
				<key>Play</key>
				<string>1</string>
			</dict>
		</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home17" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>alpha</string>
			<key>Content</key>
			<dict>
				<!--内容（webView/image）-->
				<key>ContentType</key>
				<string>image</string>
                <!--如果上面选的image，这个内容就要填图片名称-->
				<key>Content</key>
				<string><![CDATA[6.png]]></string>
                <!--开始的位置（x,y,width,height）-->
				<key>Frame</key>
				<string>768,0,200,200</string>
                <key>stay</key>
                <!--0不停留，1停留-->
                <string>0</string>
                <!--结束的位置（x,y,width,height）-->
				<key>StartAlpha</key>
				<string>0</string>
                <key>OverAlpha</key>
				<string>1</string>
                <!--动画时间长度-->
				<key>dur</key>
				<string>.3</string>
                <!--延迟几秒执行-->
				<key>delay</key>
				<string>0</string>
			</dict>
		</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home18" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<!--在张图片上面添加特殊效果（索引从1开始一直到最后一张的位置）-->
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>move</string>
			<key>Content</key>
			<dict>
				<!--内容（webView/image）-->
				<key>ContentType</key>
				<string>image</string>
                <!--如果上面选的image，这个内容就要填图片名称-->
				<key>Content</key>
				<string><![CDATA[a.jpg]]></string>
                                                <!--开始透明度-->
                                                <key>StartAlpha</key>
                                                <string>1</string>
                                                <!--结束透明度-->
                                                <key>OverAlpha</key>
                                                <string>1</string>
                                                <!--开始的位置（x,y,width,height）-->
                                                <key>StartPos</key>
                                                <string>-200,0,200,200</string>
                                                <!--结束的位置（x,y,width,height）-->
                                                <key>OverPos</key>
                                                <array>
                                                    <string>568,0,200,200</string>
                                                    <string>268,0,200,200</string>
                                                </array>
                                                <key>stay</key>
                                                <!--0不停留，1停留-->
                                                <string>0</string>
                                                <!--如果不是nil，将建出一个scrollview出来-->
                                                <key>contentSize</key>
                                                <string>nil</string>
                                                <!--动画时间长度-->
                                                <key>dur</key>
                                                <string>2</string>
                                                <!--延迟几秒执行-->
                                                <key>delay</key>
                                                <string>1</string>
                                                </dict>
                                                </dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home19" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>anchor</string>
			<key>Content</key>
            <array>
                <dict>
                    <key>Img</key>
                    <string><![CDATA[6.png]]></string>
                    <key>Pos</key>
                    <string>768,0,200,200</string>
                    <key>Center</key>
                    <!--中心点(10,10)-->
                    <string>nil</string>
                    <key>stay</key>
                    <!--0不停留，1停留-->
                    <string>0</string>
                    <key>Animate</key>
                    <!--0是关闭,1会有呼吸一样的动画-->
                    <string>0</string>
                    <key>Link</key>
                    <string><![CDATA[http://www.baidu.com]]></string>
                    <key>media</key>
                    <string>nil</string>
                    <!--0表示关闭点击大图,1表示点击展开大图-->
                    <key>IsBigPic</key>
                    <string>0</string>
                    <key>BigPicPos</key>
                    <string>768,0,200,200</string>
                    <key>BigPic</key>
                    <array>
                        <dict>
                            <key>Img</key>
                            <string><![CDATA[6.png]]></string>
                        </dict>
                    </array>
                    <!--动画时间长度-->
                    <key>dur</key>
                    <string>0</string>
                    <!--延迟几秒执行-->
                    <key>delay</key>
                    <string>0</string>
                </dict>
            </array>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home20" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>gallery</string>
			<key>BigPicPos</key>
			<string>768,0,200,200</string>
			<key>BigCenter</key>
			<!--中心点(10,10)-->
			<string>nil</string>
			<key>Direction</key>
			<!--0是横着,1是竖着-->
			<string>0</string>
			<key>miniPicScrollViewPos</key>
			<string>768,0,200,200</string>
			<key>MiniCenter</key>
			<!--中心点(10,10)-->
			<string>nil</string>
			<key>miniPicSize</key>
			<string>10,10</string>
			<key>miniPicSizePadding</key>
			<string>10</string>
			<key>Content</key>
			<array>
			<dict>
				<key>Img</key>
				<string><![CDATA[6.png]]></string>
				<key>Thumbnail</key>
				<string><![CDATA[6.png]]></string>
				<key>Link</key>
				<!--<![CDATA[http://www.baidu.com]]>-->
				<string>nil</string>
			</dict>
			</array>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home21" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>audio</string>
			<key>file</key>
			<string>nil</string>
			<!--0.0-1.0之间-->
			<key>volume</key>
			<string>0.5</string>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home22" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>focus</string>
			<key>Pos</key>
            <string>768,0,200,200</string>
            <key>Direction</key>
            <!--0是横着,1是竖着-->
            <string>0</string>
            <key>Content</key>
            <array>
			<dict>
				<key>Img</key>
				<string><![CDATA[6.png]]></string>
				<key>Title</key>
				<string>nil</string>
				<key>Pos</key>
				<string>nil</string>
				<key>size</key>
				<string>nil</string>
			</dict>
            </array>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home23" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>autoChangeGalley</string>
			<key>pos</key>
			<string>768,0,200,200</string>
			<key>center</key>
			<!--中心点(10,10)-->
			<string>nil</string>
            <key>stay</key>
            <!--0不停留，1停留-->
            <string>0</string>
			<!--延迟多长时间开始自动切换-->
			<key>delay</key>
			<string>0</string>
			<!--多长时间切换一次-->
			<key>time</key>
			<string>0.6</string>
			<!--切换动画的时长-->
			<key>durtion</key>
			<string>0.6</string>
			<key>Content</key>
			<array>
			<dict>
				<key>Img</key>
				<string><![CDATA[1.png]]></string>
				<key>Link</key>
                <!--<![CDATA[http://www.baidu.com]]>-->
				<string>nil</string>
			</dict>
			</array>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>

                                            <div id="home24" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
	<key>Index</key>
	<string>1</string>
	<key>AType</key>
	<string>mask</string>
	<key>Content</key>
	<dict>
		<key>Content</key>
		<string><![CDATA[6.png]]></string>
        <!--元素开始的位置（x,y,width,height）-->
		<key>pos</key>
		<string>768,0,200,200</string>
        <!--元素结束的位置（x,y,width,height）-->
		<key>pos_end</key>
		<string>768,0,200,200</string>
        <key>stay</key>
        <!--0不停留，1停留-->
        <string>0</string>
        <!--蒙版开始的位置（x,y,width,height）-->
		<key>StartPos</key>
		<string>768,0,200,200</string>
        <!--蒙版结束的位置（x,y,width,height）-->
		<key>OverPos</key>
		<string>568,0,200,200</string>
        <!--动画时间长度-->
		<key>dur</key>
		<string>.3</string>
        <!--延迟几秒执行-->
		<key>delay</key>
		<string>0</string>
	</dict>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>


                                            <div id="home27" class="tab-pane">
                                                <p>
                                                    <textarea class="form-control leo-font-14" rows="20"><dict>
			<key>Index</key>
			<string>1</string>
			<key>AType</key>
			<string>slide</string>
			<key>Content</key>
            <array>
                <dict>
                    <key>Img</key>
                    <string><![CDATA[6.png]]></string>
                    <key>BtnPos</key>
                    <string>768,0,200,200</string>
                    <key>Animate</key>
                    <!--0是关闭,1会有呼吸一样的动画-->
                    <string>0</string>
                    <!--整个画面的frame-->
                    <key>Pos</key>
                    <string>768,0,200,200</string>
                    <!--左边显示多少-->
                    <key>FirstPageScale</key>
                    <string>.5</string>
                    <key>BigPic</key>
                    <array>
                        <dict>
                            <key>Img</key>
                            <string><![CDATA[6.png]]></string>
                        </dict>
                        <dict>
                            <key>Img</key>
                            <string><![CDATA[6.png]]></string>
                        </dict>
                    </array>
                </dict>
            </array>
</dict></textarea>
                                                </p>
                                                <a class="insertStr btn btn-default purple" href="javascript:void(0);"><i class="fa fa-plus"></i> 插入片段</a>
                                            </div>



                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="col-xs-12 col-md-12">
                        <div class="widget">
                            <div class="widget-header  with-footer bordered-bottom bordered-pink">
                                <span class="widget-caption"><span class="widget-caption">编辑位置: <c:out value="${realpath}" escapeXml="false" /></span></span>
                                <div class="widget-buttons">
                                    <a href="#" data-toggle="maximize">
                                        <i class="fa fa-expand"></i>
                                    </a>
                                    <a href="#" data-toggle="collapse">
                                        <i class="fa fa-minus"></i>
                                    </a>
                                    <a href="#" data-toggle="dispose">
                                        <i class="fa fa-times"></i>
                                    </a>
                                </div>
                            </div>
                            <div class="widget-body" style="height: auto;">
                                <form method="post" action="editSave" class="form-horizontal" role="form">

                                    <textarea class="form-control leo-font-14" rows="15" placeholder="content" name="content"><c:out value="${content}" escapeXml="false" /></textarea>
                                    <input type="hidden" name="path" value="<c:out value="${path}" escapeXml="false" />" />
                                    <div class="horizontal-space"></div>
                                    <div>
                                        <button type="button" onclick="window.location.href='index'" class="btn btn-default">返回列表</button>
                                            <button type="submit" class="btn btn-default">保存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>



            </div>
            <!-- /Page Body -->
        </div>
        <!-- /Page Content -->
    </div>
    <!-- /Page Container -->
    <!-- Main Container -->

</div>

<!--Basic Scripts-->

<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/slimscroll/jquery.slimscroll.min.js"></script>

<!--Beyond Scripts-->
<script src="assets/js/beyond.min.js"></script>

<!--Page Related Scripts-->
<script src="assets/js/fuelux/wizard/wizard-custom.js"></script>
<script src="assets/js/toastr/toastr.js"></script>
<script src="assets/js/jquery.form.js"></script>

<!--Page Related Scripts-->
<!--Jquery Select2-->
<script src="assets/js/select2/select2.js"></script>
<!--Bootstrap Tags Input-->
<script src="assets/js/tagsinput/bootstrap-tagsinput.js"></script>

<!--Bootstrap Date Picker-->
<script src="assets/js/datetime/bootstrap-datepicker.js"></script>

<!--Bootstrap Time Picker-->
<script src="assets/js/datetime/bootstrap-timepicker.js"></script>

<!--Bootstrap Date Range Picker-->
<script src="assets/js/datetime/moment.js"></script>
<script src="assets/js/datetime/daterangepicker.js"></script>

<!--Jquery Autosize-->
<script src="assets/js/textarea/jquery.autosize.js"></script>

<!--Fuelux Spinbox-->
<script src="assets/js/fuelux/spinbox/fuelux.spinbox.min.js"></script>

<!--jQUery MiniColors-->
<script src="assets/js/colorpicker/jquery.minicolors.js"></script>

<!--jQUery Knob-->
<script src="assets/js/knob/jquery.knob.js"></script>

<!--noUiSlider-->
<script src="assets/js/slider/jquery.nouislider.js"></script>

<!--jQRangeSlider-->
<script src="assets/js/jquery-ui-1.10.4.custom.js"></script>
<script src="assets/js/slider/jQRangeSlider/jQAllRangeSliders-withRuler-min.js"></script>


<script>
    //--Jquery Select2--
    $("#e1").select2();
    $("#e2").select2({
        placeholder: "Select a State",
        allowClear: true
    });

    //--Bootstrap Date Picker--
    $('.date-picker').datepicker();

    //--Bootstrap Time Picker--
    $('#timepicker1').timepicker();

    //--Bootstrap Date Range Picker--
    $('#reservation').daterangepicker();

    //--JQuery Autosize--
    $('#textareaanimated').autosize({ append: "\n" });

    //--Fuelux Spinbox--
    $('.spinbox').spinbox();


    //--jQuery MiniColors--
    $('.colorpicker').each(function () {
        $(this).minicolors({
            control: $(this).attr('data-control') || 'hue',
            defaultValue: $(this).attr('data-defaultValue') || '',
            inline: $(this).attr('data-inline') === 'true',
            letterCase: $(this).attr('data-letterCase') || 'lowercase',
            opacity: $(this).attr('data-opacity'),
            position: $(this).attr('data-position') || 'bottom left',
            change: function (hex, opacity) {
                if (!hex) return;
                if (opacity) hex += ', ' + opacity;
                try {
                    console.log(hex);
                } catch (e) { }
            },
            theme: 'bootstrap'
        });

    });


    //---Jquery Knob--
    $(".knob").knob();


    //---noUiSlider--
    $("#sample-minimal").noUiSlider({
        range: [0, 100],
        start: [20, 80],
        connect: true,
        serialization: {
            mark: ',',
            resolution: 0.1,
            to: [[$("#minimal-label1"), 'html'],
                [$('#minimal-label2'), 'html']]
        }
    });

    $("#sample-onehandle").noUiSlider({
        range: [20, 100],
        start: 40,
        step: 20,
        handles: 1,
        connect: "lower",
        serialization: {
            to: [$("#low"), 'html']
        }
    });
    $("#sample-onehandle-upper").noUiSlider({
        range: [20, 100],
        start: 70,
        step: 20,
        handles: 1,
        connect: "upper",
        serialization: {
            to: [$("#low"), 'html']
        }
    });
    $('.slider').noUiSlider({
        range: [0, 255],
        start: 127,
        handles: 1,
        connect: "lower",
        orientation: "vertical",
        serialization: {
            resolution: 1
        }
        , slide: function () {

            var color = 'rgb(' + $("#red").val()
                    + ',' + $("#green").val()
                    + ',' + $("#blue").val()
                    + ')';

            $(".result").css({
                background: color
                , color: color
            });
        }
    });

    $(".sized-slider").noUiSlider({
        range: [0, 100],
        start: 50,
        handles: 1,
        connect: "lower",
        serialization: {
            to: [$("#low"), 'html']
        }
    });

    $(".colored-slider").noUiSlider({
        range: [0, 100],
        start: 30,
        handles: 1,
        connect: "lower",
        serialization: {
            to: [$("#low"), 'html']
        }
    });

    //--jQRangeSlider--
    $(".sized-rangeslider").rangeSlider();
    $(".colored-rangeslider").rangeSlider();
    $("#rangeslider").rangeSlider();
    $("#editrangeslider").editRangeSlider();
    $("#daterangeslider").dateRangeSlider();
    $("#noarrowsrangeslider").rangeSlider({ arrows: false });
    $("#boundsrangeslider").rangeSlider({ bounds: { min: 10, max: 90 } });
    $("#dvrangeslider").rangeSlider({ defaultValues: { min: 13, max: 66 } });
    $("#delayrangeslider").rangeSlider({ valueLabels: "change", delayOut: 4000 });
    $("#durationrangeslider").rangeSlider({ valueLabels: "change", durationIn: 1000, durationOut: 1000 });
    $("#disabledrangeslider").rangeSlider({ enabled: false });
    $("#steprangeslider").rangeSlider({ step: 10 });
    $("#labelsrangeslider").rangeSlider({ valueLabels: "hide" });
    $("#simlescalesrangeslider").rangeSlider({
        scales: [
            // Primary scale
            {
                first: function (val) { return val; },
                next: function (val) { return val + 10; },
                stop: function (val) { return false; },
                label: function (val) { return val; },
                format: function (tickContainer, tickStart, tickEnd) {
                    tickContainer.addClass("myCustomClass");
                }
            },
            // Secondary scale
            {
                first: function (val) { return val; },
                next: function (val) {
                    if (val % 10 === 9) {
                        return val + 2;
                    }
                    return val + 1;
                },
                stop: function (val) { return false; },
                label: function () { return null; }
            }]
    });
    var months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
    $("#dateRulersExample").dateRangeSlider({
        bounds: { min: new Date(2012, 0, 1), max: new Date(2012, 11, 31, 12, 59, 59) },
        defaultValues: { min: new Date(2012, 1, 10), max: new Date(2012, 4, 22) },
        scales: [{
            first: function (value) { return value; },
            end: function (value) { return value; },
            next: function (value) {
                var next = new Date(value);
                return new Date(next.setMonth(value.getMonth() + 1));
            },
            label: function (value) {
                return months[value.getMonth()];
            },
            format: function (tickContainer, tickStart, tickEnd) {
                tickContainer.addClass("myCustomClass");
            }
        }]
    });

    $(function() {
        /*  在textarea处插入文本--Start */
        (function($) {
            $.fn
                    .extend({
                        insertContent : function(myValue, t) {
                            var $t = $(this)[0];
                            if (document.selection) { // ie
                                this.focus();
                                var sel = document.selection.createRange();
                                sel.text = myValue;
                                this.focus();
                                sel.moveStart('character', -l);
                                var wee = sel.text.length;
                                if (arguments.length == 2) {
                                    var l = $t.value.length;
                                    sel.moveEnd("character", wee + t);
                                    t <= 0 ? sel.moveStart("character", wee - 2 * t
                                            - myValue.length) : sel.moveStart(
                                            "character", wee - t - myValue.length);
                                    sel.select();
                                }
                            } else if ($t.selectionStart
                                    || $t.selectionStart == '0') {
                                var startPos = $t.selectionStart;
                                var endPos = $t.selectionEnd;
                                var scrollTop = $t.scrollTop;
                                $t.value = $t.value.substring(0, startPos)
                                        + myValue
                                        + $t.value.substring(endPos,
                                                $t.value.length);
                                this.focus();
                                $t.selectionStart = startPos + myValue.length;
                                $t.selectionEnd = startPos + myValue.length;
                                $t.scrollTop = scrollTop;
                                if (arguments.length == 2) {
                                    $t.setSelectionRange(startPos - t,
                                            $t.selectionEnd + t);
                                    this.focus();
                                }
                            } else {
                                this.value += myValue;
                                this.focus();
                            }
                        }
                    })
        })(jQuery);
        /* 在textarea处插入文本--Ending */
    });

    //复制选择图片
    $(function(){
        new Clipboard('tr.selectPicTr');
    });

    //插入代码端
    $(document).on("click", "a.insertStr", function(){
        var str = $(this).prev().find("textarea").val();
        console.log("str = " + str);
        $("textarea[name='content']").insertContent(str);
    });

    //格式化
    $(document).on("click", "#xmlFormat", function(){
        var str =  $("textarea[name='content']").val();
        console.log("str = " + str);
        $("textarea[name='content']").format({method: 'xml'});
    });


</script>

</body>
<!--  /Body -->
</html>
