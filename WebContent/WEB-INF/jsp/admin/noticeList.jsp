<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Paper"%>
<%@page import="com.jiajiao.bean.News"%>
<%@page import="com.jiajiao.bean.Notice"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link href="../static/back/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="../static/back/css/style.css" />
		<link href="../static/back/assets/css/codemirror.css" rel="stylesheet">
		<link rel="stylesheet" href="../static/back/assets/css/ace.min.css" />
		<link rel="stylesheet" href="../static/back/assets/css/font-awesome.min.css" />
		<!--[if IE 7]>
		  <link rel="stylesheet" href="../static/back/assets/css/font-awesome-ie7.min.css" />
		<![endif]-->
		<!--[if lte IE 8]>
		  <link rel="stylesheet" href="../static/back/assets/css/ace-ie.min.css" />
		<![endif]-->
		<script src="../static/back/assets/js/jquery.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

		<!--[if !IE]> -->

		<script type="text/javascript">
			window.jQuery || document.write("<script src='../static/back/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
		</script>

		<!-- <![endif]-->

		<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../static/back/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='../static/back/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="../static/back/assets/js/bootstrap.min.js"></script>
		<script src="../static/back/assets/js/typeahead-bs2.min.js"></script>
		<!-- page specific plugin scripts -->
		<script src="../static/back/assets/js/jquery.dataTables.min.js"></script>
		<script src="../static/back/assets/js/jquery.dataTables.bootstrap.js"></script>
		<script type="text/javascript" src="../static/back/js/H-ui.js"></script>
		<script type="text/javascript" src="../static/back/js/H-ui.admin.js"></script>
		<script src="../static/back/assets/layer/layer.js" type="text/javascript"></script>
		<script src="../static/back/assets/laydate/laydate.js" type="text/javascript"></script>
		<title>????????????</title>
	</head>

	<body>
		<div class="page-content clearfix">
			<div id="Member_Ratings">
				<div class="d_Confirm_Order_style">
					
					<div class="table_menu_list">
						<table class="table table-striped table-bordered table-hover" id="sample-table">
							<thead>
								<tr>
									<th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
									<th width="80">ID</th>
									<th width="150">??????</th>
									<th width="100">????????????</th>
									<th width="100">??????</th>
									<th width="100">?????????</th>
									<th width="100">??????</th>
									<th width="140">????????????</th>
									<th width="100">??????</th>
									<th width="200">??????</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
							if(noticeList!=null){
								for(int i=0;i<noticeList.size();i++){
									Notice notice = noticeList.get(i);							
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=notice.getnId() %></td>
									<td><a href="../notice/noticeInfo.action?nId=<%=notice.getnId() %>" target="_blank"><%=notice.getTitle() %></a></td>
									<td>
									<%
									if(notice.getType()==1){
									%>	
									????????????
									<%	
									}else if (notice.getType()==2){
									%>
									????????????
									<%
									}else if(notice.getType()==3){
									%>
									????????????
									<%}%>
									</td>
									<td><%=notice.getSource()%></td>
									<td><%=notice.getViewNum()%></td>
									<td><%=notice.getSort() %></td>
									<td><%=notice.getPubTime() %></td>
									<td class="td-status">
									<%if(notice.getDisplay()==1){ %>
										<span class="label label-success radius">?????????</span>
									<%}else{ %>
										<span class="label label-defaunt radius">?????????</span>
									<%} %>
										
									</td>
									<td class="td-manage">
									
										<%if(notice.getDisplay()==1){ %>
											<a onClick="notice_stop(this,<%=notice.getnId() %>)" href="javascript:;" title="??????" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="notice_start(this,<%=notice.getnId() %>)" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="????????????" href="../notice/preUpdateNoticePage.action?nId=<%=notice.getnId() %>" class="btn btn-xs btn-info Refund_detailed">??????</a>
									</td>
								</tr>
							<%
								}
							}
							%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
	</body>

</html>
<script>
	jQuery(function($) {
			var oTable1 = $('#sample-table').dataTable({
				"aaSorting": [
					[1, "desc"]
				], //?????????????????????
				"bStateSave": true, //????????????
				"aoColumnDefs": [
					//{"bVisible": false, "aTargets": [ 3 ]} //????????????????????????
					{
						"orderable": false,
						"aTargets": [0,2,7,8,9]
					} // ????????????????????????
				]
			});

			$('table th input:checkbox').on('click', function() {
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function() {
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});

			});

			$('[data-rel="tooltip"]').tooltip({
				placement: tooltip_placement
			});

			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if(parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
				return 'left';
			}
		})
	
	/*??????-??????*/
	function notice_stop(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			$.post('stopNotice.action', d, function (res) {
		        	
	            if (res.success) {
	            	
	            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="notice_start(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">?????????</span>');
					$(obj).remove();
					layer.msg('?????????!', {
						icon: 5,
						time: 1000
					});
	            	
	            } else {
	            	layer.msg('????????????????????????', {
						icon: 5,
						time: 1000
					});
	            }
		    });
			
		});
	}

	/*??????-??????*/
	function notice_start(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('startNotice.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="notice_stop(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">?????????</span>');
						$(obj).remove();
						layer.msg('?????????!', {
							icon: 6,
							time: 1000
						});
		            	
		            } else {
	            		layer.msg('?????????!', {
							icon: 6,
							time: 1000
						});
		            }
		    });
			
		});
	}

	laydate({
		elem: '#start',
		event: 'focus'
	});
	

</script>