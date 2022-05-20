<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.GradePrice"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
<%@page import="com.jiajiao.bean.Notice"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=1200">
	<%
		News news = (News) request.getAttribute("news");
	%>
	<title>【云朵家教网】<%=news.getTitle() %></title>
	<meta name="keywords" content="试卷，莆田家教，莆田家教兼职，莆田兼职家教，家教">
	<meta name="description" content="云朵家教网是莆田家教行业权威上门和在线辅导平台,自2003年创立以来,已为莆田数万学员提供一对一上门家教服务和中小学全科在线学习辅导。免费试课!150 - 6033 - 8989。">

	<link rel="shortcut icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">
    <link rel="icon" href="<%=basePath%>static/img/favicon.ico" type="image/x-icon">

	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/css.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/code.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/base.css" >
	<link rel="stylesheet" type="text/css" href="<%=basePath%>static/css/brief.css">

	<script type="text/javascript" src="<%=basePath%>static/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/jquery-ui.js"></script>
	<script type="text/javascript" src="<%=basePath%>static/js/tool.js"></script>
	 <link href="<%=basePath%>static/css/home2.css" rel="stylesheet">
	
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
  
  <body>
  
		<div class="header min_1200">
			<div class="w_1200">
				<h1 class="logo fl png_img"><a href="#"><img src="<%=basePath%>static/img/logo2.png" alt="云朵家教"></a></h1>
				<h3 class="h_city fl">
            <span class="png city_arrow">莆田</span>
            <p>
				<a href="#" class="round_s city_btn" rel="nofollow">切换城市</a>
			</p>
        </h3>
        <img alt="" src="<%=basePath%>static/img/logo_contact.png">
				
				<div class="header_r fr">
					<span class="font_16">客服微信：</span>
					<img src="<%=basePath%>static/img/wechat.jpg" class="wechat_img" alt="云朵家教客服微信" width="80" height="80">

					<%
						Teacher teacher = (Teacher) session.getAttribute("teacher");
						Member member = (Member) session.getAttribute("member");
						if (member == null && teacher == null) {
					%>
					<span class="font_13">
                    <b class="orange_link">
                        <a href="<%=basePath%>loginPage.action" class="heada"> 登录</a>
                    </b>
                    <em class="china"></em>
                    <b class="orange_link">
                        <a href="<%=basePath%>registerPage.action" class="heada">注册</a>
                    </b>
                    </span>
					 
					<%
 						} else {
 					%>
					 <span class="font_13">
                    <b class="orange_link">
                        <a href="<%=basePath%>logout.action" class="heada"> 退出</a>
                    </b>
                    <em class="china"></em>
                    <b class="orange_link">
                        <%
                        	if (member != null) {
                        %>
	                       <a href="<%=basePath%>member/index.action" class="heada">我的</a>
	                   	<%
	                   		} else if (teacher != null) {
	                   	%>
	                       <a href="<%=basePath%>teacher/index.action" class="heada">我的</a>
	                   	<%
	                   		}
	                   	%>
                    </b>
                    </span>
					
					<%
							}
					%>
					
				</div>
				<!--end头文件右-->
			</div>
		</div>
		<!--end头文件-->
		<div class="nav min_1200">
			<div class="tnav w_1200" id="slideNav">
				<span><a href="<%=basePath%>" >家教首页</a></span>
				<span><a href="<%=basePath%>costPage.action" >资费标准</a></span>
				<span><a href="<%=basePath%>teacher/teachersPage.action">找老师</a></span>
				<span><a href="<%=basePath%>member/ordersPage.action">最新家教</a></span>
				<span><a href="<%=basePath%>institution/institutionPage.action">辅导机构</a></span>
				<span><a href="<%=basePath %>paper/paperPage.action" class="current_nav">云朵课堂</a></span>
				<i class="tavline" id="slideNavLine" style="width: 202px; left: 0px;"></i>
			</div>
		</div>
		<!-- end nav -->

		<dl class="site_th w_1200">
			<dd>当前位置：
				<a href="<%=basePath%>">首页</a> 
				<span class="china">&gt;</span>云朵课堂</dd>
		</dl>

		
		<div id="content" style="width: 1200px;">
	    	<div  style="width: 900px;border: 1px solid #DDDDDD;float: left;">

				<div style="height: 148px;  margin: 40px 40px 40px 40px;border-bottom: 1px solid #DDDDDD; text-shadow: 0 0 black;">
					<img src="<%=basePath%>static/img/word.png" style="float: left;">

					<div class="tt-h2" 
						style="float: left;  margin-left: 30px;">
						<h2 id="_title" title="<%=news.getTitle() %>">
							<%=news.getTitle() %>
						</h2>
						<p style="padding-top: 10px;">
							<span style="padding-right: 40px;">资源编号：<%=news.getnId() %></span>
							<span style="padding-right: 40px;">时间：<%=news.getPubTime().substring(0,10) %></span>
							<span style="padding-right: 40px;">浏览量：<%=news.getViewNum() %></span>
						</p>
						
						<div id="downPaper">
							<!--<a href=""  target="_blank" style="background-color: #15b358;float: right;width: 120px;height: 40px;line-height:40px;text-align: center;font-size: 18px;color: white;">下载试题</a>-->
						</div>
					</div>
				</div>
				<div id="paperContent" style=" margin: 40px 40px 40px 40px;border-bottom: 1px solid #DDDDDD; text-shadow: 0 0 black;">
				<%=news.getContent() %>
				</div>
			</div>
	    	<div id="other" style="width: 270px;float: right;">
	      		<div id="problem" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				常见问题
      				</div>
      				
      				<div class="hot-list">
		                <ul>
		                <%
	      				List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
	      				if(noticeList!=null){
	      					for(int i = 0; i < noticeList.size(); i++){
	      						Notice notice = noticeList.get(i);
	      				%>
	      					<li>
			                    <a href="<%=basePath %>notice/noticeInfo.action?nId=<%=notice.getnId() %>" title="<%=notice.getTitle() %>">
			                      <span >
			                        <%=i+1 %>、
			                      </span>
			                      <%=notice.getTitle() %>
			                    </a>
							</li>
	      				<%
	      					}
	      				}
	      				%>
		               </ul>
	              </div>
	    		</div>
	    		<div id="problem" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				关注微信
      				</div>

					<div style="padding:15px 15px 40px 15px;font-size:16px;">
						<p style="margin-bottom: 20px;">
							扫一扫关注<span style="color: red;"><strong>“云朵家教网&nbsp;——&nbsp;一对一辅导”</strong></span>微信公众号，方便获得家教信息、考试试题、教育文章精选。
						</p>
						<img alt="云朵家教二维码" src="<%=basePath %>static/img/wechat.jpg" width="220px;" height="220px;">
					</div>

	    		</div>
	    		<div id="paper" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				最新试题
      				</div>
      				
      				<div class="hot-list">
		                <ul>
		                <%
		                List<Paper> topTenPaperList = (List<Paper>)request.getAttribute("topTenPaperList");
		                if(topTenPaperList!=null){
		                	for(int i = 0; i < topTenPaperList.size(); i++){
		                		Paper paper = topTenPaperList.get(i);
		                %>
		                <li>
		                	<a href="<%=basePath %>paper/paperInfo.action?pId=<%=paper.getpId() %>" title="<%=paper.getTitle() %>">
		                    	<span ><%=i+1 %>、</span>
								<%=paper.getTitle() %>
		                    </a>
		                 </li>
		                <%
		                	}
		                }
		                %>
		               </ul>
	              </div>
      				
	    		</div>
	    		<div id="paper" style="width: 270px;border: 1px solid #DDDDDD;margin-bottom: 20px;">
	      				
      				<div style="height: 45px;text-align: center;border: 1px solid #DDDDDD;background-color: #3ac779;font-size: 22px;color: white;">
      				最新资讯
      				</div>
      				
      				<div class="hot-list">
		                <ul>
		                <%
		                List<News> newsList = (List<News>)request.getAttribute("newsList");
		                if(newsList!=null){
		                	for(int i = 0; i < newsList.size(); i++){
		                		News n = newsList.get(i);
		                %>
		                <li>
		                	<a href="<%=basePath %>news/newsInfo.action?nId=<%=n.getnId() %>" title="<%=n.getTitle() %>">
		                    	<span ><%=i+1 %>、</span>
								<%=n.getTitle() %>
		                    </a>
		                 </li>
		                <%
		                	}
		                }
		                %>
		               </ul>
	              </div>
	    		</div>
	    	</div>
	    </div>
	    <div style="clear: both;padding-bottom: 30px;"></div>
	<jsp:include page="footer.jsp"></jsp:include>
