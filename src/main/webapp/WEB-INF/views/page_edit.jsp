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

    <!-- highlight-within-textarea CSS/JS -->
    <link href="highlight/jquery.highlight-within-textarea.css" rel="stylesheet">
    <script src="highlight/jquery.highlight-within-textarea.js"></script>


    <style>
        a.insertStr{position:relative; top:10px;}
        textarea.leo-font-14{font-size:16px;}
    </style>

    <style>
        a.insertStr{position:relative; top:10px;}
        textarea.leo-font-14{font-size:16px;}
    </style>

    <style>
        .hwt-container {
            width: 100%;
            height: auto;
            background-color: #fbfbfb;
        }

        .hwt-content {
            width: 100%;
            height: auto;
            padding: 5px 9px;
            border: 1px solid #d5d5d5;
            color: #858585;
            font: 16px 'Droid Sans Mono', sans-serif;
        }

        .hwt-input:focus {
            outline-color: #495057;
        }

        .hwt-content mark {
            border-radius: 3px;
            background-color: #d0bfff;
        }

        .hwt-content mark.red {
            background-color: #ffc9c9;
        }

        .hwt-content mark.blue {
            background-color: #a3daff;
        }

        .hwt-content mark.yellow {
            background-color: #ffec99;
        }
    </style>
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
                        <small>
                            <i class="fa fa-angle-right"></i>
                            页码模式
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
                        <div class="well with-header">
                            <div class="header bordered-palegreen">插入/删除</div>

                            <div class="horizontal-space"></div>

                            <div class="row">
                                <div class="col-lg-2 col-sm-2 col-xs-2">

                                    <div class="spinbox spinbox-horizontal spinbox-two-sided">
                                        <div class="spinbox-buttons	btn-group spinbox-buttons-left">
                                            <button type="button" class="btn spinbox-down danger">
                                                <i class="fa fa-minus"></i>
                                            </button>
                                        </div>
                                        <input type="text" id="pageIndex" class="spinbox-input form-control" />
                                        <div class="spinbox-buttons	btn-group spinbox-buttons-right">
                                            <button type="button" class="btn spinbox-up blue">
                                                <i class="fa fa-plus"></i>
                                            </button>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-lg-2 col-sm-2 col-xs-2">
                                </div>

                            </div>
                            <br />

                            <button type="button" id="pageInsertBtn" class="btn btn-blue">页之后插入</button>
                            <button type="button" id="pageDeleteBtn" class="btn btn-danger">页删除</button>
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

    //点击插入多少页之后
    $(document).on("click", "#pageInsertBtn", function () {
        var pageIndex = $("#pageIndex").val();

        if (pageIndex < 0 || pageIndex > ${totalPage}) {
            layer.alert('请先选择合适的页码', {icon: 6});
            return;
        }

        //询问框
        var wnd = layer.confirm('将要在第'+ pageIndex +'页之后插入新的页码？', {
            btn: ['插入','取消'] //按钮
        }, function(index){
            $.post("insertPage",
                    {
                        path : '${path}',
                        pageIndex : pageIndex
                    },
                    function(data,status){
                        if (data.state == 1 || data.state == '1') {
                            window.location.reload();
                        } else {
                            layer.alert("删除页码出现系统问题，请稍后再试!");
                            layer.close(index);
                        }
                    });

        }, function(){

        });
    });

    //点击删除多少页
    $(document).on("click", "#pageDeleteBtn", function () {
        var pageIndex = $("#pageIndex").val();

        if (pageIndex < 1 || pageIndex > ${totalPage}) {
            layer.alert('请先选择合适的页码', {icon: 6});
            return;
        }

        if (107 == 1) {
            layer.alert('只有一页内容了，不可以被删除', {icon: 6});
            return;
        }

        //询问框
        var wnd = layer.confirm('执行以后将无法找回<br />确定要删除第'+ pageIndex +'页的全部内容？', {
            btn: ['继续删除','取消'] //按钮
        }, function(index){
            $.post("deletePage",
                    {
                        path : '${path}',
                        pageIndex : pageIndex
                    },
                    function(data,status){
                        if (data.state == 1 || data.state == '1') {
                            window.location.reload();
                        } else {
                            layer.alert("删除页码出现系统问题，请稍后再试!");
                            layer.close(index);
                        }
                    });

        }, function(){

        });
    });

    //绑定标注选中事件
    $(document).on("change", "#markIndex", function () {
        var index = $(this).val();
        if (index == 0 || index == '0') return;

        var selectText = "<string>"+ index +"</string>";
        var selectReg = new RegExp("<dict>(\\s*)<key>Index</key>(\\s*)"+ selectText +"([\\s\\S]*?)</dict>", "gim"); // re为/^\d+bl$/gim

        $('#content').highlightWithinTextarea({
            highlight: selectReg
        });
        //alert("index = " + index);
    });

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
