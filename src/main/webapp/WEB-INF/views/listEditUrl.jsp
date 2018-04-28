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
            });
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
                        <small>
                            <i class="fa fa-angle-right"></i>
                            普通模式
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
                    <div class="col-xs-12 col-md-12">
                        <div class="well with-header  with-footer">
                            <div class="header bg-warning">
                                总共${totalPage}页
                            </div>
                            <table class="table table-hover">
                                <thead class="bordered-darkorange">
                                <tr>
                                    <th>
                                        #
                                    </th>
                                    <th>
                                        预览图
                                    </th>
                                    <th>
                                        路径
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach var="i" begin="1" end="${totalPage}" step="1">
                                    <tr>
                                        <td>
                                            <c:out value="${i}" />
                                        </td>
                                        <td>
                                            <a href="<c:out value="${url}" />/page_<c:out value="${i}" />.jpg" target="_blank">
                                                <img style="border:2px solid #666" height="80" src="<c:out value="${url}" />/page_<c:out value="${i}" />.jpg" />
                                            </a>
                                        </td>
                                        <td>
                                            第<c:out value="${i}" escapeXml="false" />页
                                        </td>
                                        <td>
                                            <a href="/edit?path=${encodePath}&page=<c:out value="${i}" escapeXml="false" />" class="btn btn-success shiny">编辑</a>
                                        </td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>

                            <div class="footer">
                                <code>by Leo Chen</code>
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

</script>

</body>
<!--  /Body -->
</html>
