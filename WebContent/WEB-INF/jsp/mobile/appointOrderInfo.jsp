<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.jiajiao.bean.Orders"%>
<%@page import="com.jiajiao.utils.ArrayHelper"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Teacher teacher = (Teacher)session.getAttribute("teacher");
if(teacher==null){
	response.sendRedirect(basePath+"mobile.action");
	return ;
}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<%
    	Orders order =  (Orders)request.getAttribute("order");
    	%>
        <title>
            <%=order.getArea() %><%=order.getContactName().substring(0,1)%><%if(order.getContactGender()==1){%>先生<%}else{%>女士<%}%>请<%=order.getCourseName() %>家教【云朵家教】
        </title>
		<meta name="keywords" content="莆田家教，莆田家教兼职，莆田兼职家教，家教">
		<meta name="description" content="云朵家教网是莆田家教行业权威上门和在线辅导平台,自2003年创立以来,已为莆田数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!150 - 6033 - 8989。">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">


        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/mobilecss.css">
        <link rel="stylesheet" type="text/css" href="<%=basePath %>static/mobile/css/css114.css">
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
        <meta content="yes" name="apple-mobile-web-app-capable">
        <meta content="black" name="apple-mobile-web-app-status-bar-style">
        <meta name="format-detection" content="telephone=no">
        <meta name="format-detection" content="email=no">
        <meta name="msapplication-tap-highlight" content="no">

        <script src="<%=basePath %>static/mobile/js/jquery-1.10.2.min.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/api">
        </script>
        <script type="text/javascript" src="<%=basePath %>static/mobile/js/getscript">
        </script>
	<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?20766a1a5bc02124297ce7be22ff84b1";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
	</script>
  </head>
  
  <body style="">
       
        <header>
			<h3>
				<a href="javascript:history.go(-1);" class="fh">
					返回
				</a>
				家教详情
			</h3>
		</header>
        
        <!--end header-->
        <!-- 中间 -->
        <!-- 一行 -->
        
        <div class="wpbox">
            <div class="boxmt">
                <div class="wbw">
                    <h3 class="ogtitle">
                        联系信息
                    </h3>
                </div>
            </div>
            <div class="showdlist">
            	<div class="dl">
                    <div class="dt">
                        联  系  人
                    </div>
                    <div class="dd">
                       <%=order.getContactName()%>
                    </div>
                </div>
                <div class="align dl">
                    <div class="dt">
                        性  别
                    </div>
                    <div class="dd">
                       <%if(order.getContactGender()==0){%>
               			 女
               			<%}else if(order.getContactGender()==1){ %>
               			男
               			<%} %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        联系电话
                    </div>
                    <div class="dd">
                    	<a href="tel:<%=order.getContactPhone()%>" style="color: #3ac779;"><strong><%=order.getContactPhone()%></strong>(点击联系)</a>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        微  信
                    </div>
                    <div class="dd">
                        <%=order.getWxNumber() %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                       订单金额
                    </div>
                    <div class="dd">
                        ¥<%=request.getAttribute("price") %>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="wpbox">
        	<div class="boxmt">
                <div class="wbw">
                    <h3 class="ogtitle">
                        家教信息
                    </h3>
                </div>
            </div>
            <div class="boxmt">
                <div class="wbw">
                    <div class="boxmtitle">
                        编号
                        <a href="javascript:void(0)" class="ogtxt">
                            <%=order.getOrderCode() %>
                        </a>
                    </div>
                </div>
                <span>
                    <i class="lastime_ntico ntico">
                    </i>
                    更新时间：<%=order.getPublicTime() %>
                </span>
            </div>
            <div class="showdlist">
                <div class="dl">
                    <div class="dt">
                        科  目
                    </div>
                    <div class="dd">
                        <%=order.getCourseName() %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        年  级
                    </div>
                    <div class="dd">
                    <%=order.getStudentGradeName() %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        性  别
                    </div>
                    <div class="dd">
                    <%if(order.getStudentGender()==1){%>
                    男
                    <%}else{ %>
                    女
                    <%} %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        学员状态
                    </div>
                    <div class="dd">
                    <%=order.getProfile() %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        授课时间
                    </div>
                    <table class="dd">
                        <thead>
                            <tr>
                                <th>
                                </th>
                                <th>
                                    周一
                                </th>
                                <th>
                                    周二
                                </th>
                                <th>
                                    周三
                                </th>
                                <th>
                                    周四
                                </th>
                                <th>
                                    周五
                                </th>
                                <th>
                                    周六
                                </th>
                                <th>
                                    周日
                                </th>
                            </tr>
                        </thead>
                        <tbody>
									<%
								    String[] teachingTimes = order.getTeachingTime().split(",");
								    %>
										 <tr>
								        <th>上午</th>
								        <%
								        if(ArrayHelper.inArray(teachingTimes,"33")){
								         %>
								        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="33"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"36")){
								         %>
								        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="36"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"39")){
								         %>
								        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="39"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"42")){
								         %>
								        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="42"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"45")){
								         %>
								        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="45"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"48")){
								         %>
								        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="48"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"51")){
								         %>
								        <td data-id="51"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="51"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								    </tr>
								    <tr>
								        <th>下午</th>
								         <%
								        if(ArrayHelper.inArray(teachingTimes,"34")){
								         %>
								        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="34"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"37")){
								         %>
								        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="37"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"40")){
								         %>
								        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="40"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"43")){
								         %>
								        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="43"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"46")){
								         %>
								        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="46"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"49")){
								         %>
								        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="49"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"52")){
								         %>
								        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="52"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								        
								    <tr>
								        <th>晚上</th>
								        
								         <%
								        if(ArrayHelper.inArray(teachingTimes,"35")){
								         %>
								        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="35"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"38")){
								         %>
								        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="38"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"41")){
								         %>
								        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="41"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"44")){
								         %>
								        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="44"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"47")){
								         %>
								        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="47"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"50")){
								         %>
								        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="50"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								         
								          <%
								        if(ArrayHelper.inArray(teachingTimes,"53")){
								         %>
								        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/ok.png" alt=""></a></td>
								         <%}else{ %>
								        <td data-id="53"><a href="javascript:void(0)"><img src="<%=basePath %>static/img/error.png" alt=""></a></td>
								         <%} %>
								        
								    </tr>
									</tbody>
                    </table>

                </div>
                <div class="dl">
                    <div class="dt">
                        薪  酬
                    </div>
                    <div class="dd">
                        <%
                            if(order.getCoursePrice()!=0){
                             %>
                            <%=order.getCoursePrice() %>元/小时
                          <%}else{ %>
                      		 参照云朵家教网标准
                           <%} %>
                    </div>
                </div>
                <div class="align dl">
                    <div class="dt">
                        地  址
                    </div>
                    <div class="dd">
                        <%=order.getAddress() %>
                    </div>
                    <a href="<%=basePath %>order/mMap.action?address=<%=order.getAddress() %>&lat=<%=order.getLat() %>&lng=<%=order.getLng() %>" class="oglinebtn">
                        <i class="ogsite_smico">
                        </i>
                        查看地图
                    </a>
                </div>
            </div>
        </div>
        <!-- end 一行 -->
        <!-- 一行 -->
        <div class="wpbox">
            <div class="boxmt">
                <div class="wbw">
                    <h3 class="ogtitle">
                        教员要求
                    </h3>
                </div>
            </div>
            <div class="showdlist">
                <div class="align dl">
                    <div class="dt">
                        性  别
                    </div>
                    <div class="dd">
                       <%if(order.getTeacherGender()==0){%>
               			 女
               			<%}else if(order.getTeacherGender()==1){ %>
               			男
               			<%}else if(order.getTeacherGender()==2){ %>
               			不限
               			<%} %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        身份要求
                    </div>
                    <div class="dd">
                       <%=order.getTeacherTypeName()%>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        授课方式
                    </div>
                    <div class="dd">
                        <%=order.getTeachingWayName() %>
                    </div>
                </div>
                <div class="dl">
                    <div class="dt">
                        其他要求
                    </div>
                    <div class="dd">
                    <%=order.getRequirements() %>
                    </div>
                </div>
            </div>
        </div>
        <!-- end 一行 -->
        <!-- 一行 -->

        <!-- 底部 -->
        
        <!-- end 底部 -->
 	<div class="fbottom">
            <div class="ftoolbar">
                <div class="ftoolbar_wbw">
                    <a href="tel:150-6033-8989" id="btnView" class="big_gnbtn">
                        联系客服
                    </a>
                </div>
                <div class="ftoolbar_wbw">
                    <a href="javascript:void(0)" onclick="$(&#39;#zfbpayPop&#39;).addClass(&#39;show&#39;);" class="big_ogbtn">
                        支付宝支付
                    </a>
                </div>
                <div class="ftoolbar_wbw">
                    <a href="javascript:void(0)" onclick="$(&#39;#payPop&#39;).addClass(&#39;show&#39;);" class="big_ogbtn">
                        微信支付
                    </a>
                </div>
            </div>
        </div>
        
        <div class="cpop" id="payPop">
            <div class="cpopcontent">
                <div class="ntpop">
                    <i class="hide-payPop cpop_close">
                    </i>
                    <div class="ntpop_head">
                    请选择支付方式
                    </div>
                    <div class="ntpop_content">
                        <img src="<%=basePath %>static/img/wxpay.jpg">
                        <br>
                        <span>
                            关注微信，优秀简历、优惠活动实时推送。
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="cpop" id="zfbpayPop">
            <div class="cpopcontent">
                <div class="ntpop">
                    <i class="hide-zfbpayPop cpop_close" onclick="$(&#39;#zfbpayPop&#39;).removeClass(&#39;show&#39;);">
                    </i>
                    <div class="ntpop_head">
                    请选择支付方式
                    </div>
                    <div class="ntpop_content">
                        <img src="<%=basePath %>static/img/zfbpay.jpg">
                        <br>
                        <span>
                            关注微信，优秀简历、优惠活动实时推送。
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <div class="cpop" id="imagePop">
            <div class="cpopcontent">
                <div class="ntpop">
                    <i class="hide-imagePop cpop_close">
                    </i>
                    <div class="ntpop_head">
                    长按识别图中二维码
                    </div>
                    <div class="ntpop_content">
                        <img src="<%=basePath %>static/img/wechat.jpg">
                        <br>
                        <span>
                            关注微信，优秀简历、优惠活动实时推送。
                        </span>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- end beditPop -->
        <!-- ntextpop -->
        <div class="ntextpop" id="messagebox">
            <span class="ntextpop_content">
            </span>
        </div>
        <!-- end ntextpop -->
        
        <script src="<%=basePath %>static/mobile/js/TouchSlide.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/tool.js">
        </script>
        <script src="<%=basePath %>static/mobile/js/geolocation.js">
        </script>
        
    </body>

</html>