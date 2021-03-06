<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.MemberOrderTeacher"%>
<%@page import="com.jiajiao.bean.FastOrderTeacher"%>
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
									<th width="100">????????????</th>
									<th width="120">????????????</th>
									<th width="100">?????????</th>
									<th width="100">????????????</th>
									<th width="50">????????????</th>
									<th width="100">????????????</th>
									<th width="70">??????</th>
									<th width="200">??????</th>
									<th width="80">??????</th>
									<th width="70">??????</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<FastOrderTeacher> fastOrderTeacherList = (List<FastOrderTeacher>)request.getAttribute("fastOrderTeacherList");
							if(fastOrderTeacherList!=null){
								for(int i=0;i < fastOrderTeacherList.size();i++){
									FastOrderTeacher fastOrderTeacher = fastOrderTeacherList.get(i);
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=fastOrderTeacher.getFotId() %></td>
									<td><%=fastOrderTeacher.getName() %></td>
									<td><%=fastOrderTeacher.getPhone() %></td>
									<td><%=fastOrderTeacher.getWxNumber() %></td>
									<td><%=fastOrderTeacher.getTeachingCourseName()%></td>
									<td><u style="cursor:pointer" class="text-primary" onclick="teacher_show('<%=fastOrderTeacher.getTeacherName() %>','teacherShow.action','<%=fastOrderTeacher.getTeacherId()%>','600','600')"><%=fastOrderTeacher.getTeacherName() %></u></td>
									<td><%=fastOrderTeacher.getPublicTime()%></td>
									<td>
									<%
										int state = fastOrderTeacher.getState();
										if(state==1){ 
										%>
										?????????
										<%}else if(state==2){ %>
										???????????????
										<%}else if(state==3){ %>
										???????????????
										<%}else if(state==4){ %>
										????????????
										<%}else if(state==5){ %>
										?????????
										<%}else if(state==6){ %>
										???????????????
										<%}else if(state==7){ %>
										 ?????????
										<%} %>
									</td>
									<td class="td-status"><%=fastOrderTeacher.getRemark() %></td>
									<td class="td-price"><%=fastOrderTeacher.getOrderPrice() %></td>
									<td class="td-manage">
										<a title="??????" onclick="member_edit('<%=fastOrderTeacher.getFotId() %>')" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
		<div style="font-size: 15px;">
		?????????<br/>
		1) ?????????????????????????????????????????????????????????????????????????????????<br/>
		2) ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????<font color="red">?????????????????????????????????????????????</font><br/>
		3) ?????????????????????<font color="red">?????????????????????????????????????????????????????????</font><br/>
		4) ??????????????????????????????????????????????????????????????????<font color="red">??????????????????????????????</font><br/>
		</div>
		<!--??????????????????-->
		<div class="add_menber" id="add_menber_style" style="display:none">
					
			<ul class=" page-content">
				<li><label class="label_name">???????????????</label><span class="add_name"><input id="name" value="" name="????????????" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???????????????</label><span class="add_name"><input id="teacherId" name="????????????" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input id="phone" name="??????" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???????????????</label><span class="add_name"><input id="price" name="????????????" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input id="wxNumber" name="??????" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???????????????</label>
					<span class="add_name">
						<select id="state"  name="????????????" style=" width:170px">
							<option  value ="1">?????????</option>
							<option  value ="2">???????????????</option>
							<option  value ="3">???????????????</option>
							<option  value ="4">?????????</option>
							<option  value ="5">?????????</option>
							<option  value ="6">????????????</option>
							<option  value ="7">?????????</option>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li class="adderss"><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><textarea id="remark" name="??????" style="width: 600px;height: 100px;"></textarea></span>
					<div class="prompt r_f"></div>
				</li>
				
			</ul>
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
						"aTargets": [0,2,3,4,5,6,7,8,9]
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
	$('#member_add').on('click', function() {
		layer.open({
			type: 1,
			title: '????????????',
			maxmin: true,
			shadeClose: true, //?????????????????????
			area: ['800px', '500px'],
			content: $('#add_menber_style'),
			btn: ['??????', '??????'],
			yes: function(index, layero) {
				var num = 0;
				var str = "";
				$(".add_menber input[type$='text']").each(function(n) {
					if($(this).val() == "") {

						layer.alert(str += "" + $(this).attr("name") + "???????????????\r\n", {
							title: '?????????',
							icon: 0,
						});
						num++;
						return false;
					}
				});
				if(num > 0) {
					return false;
				} else {
					layer.alert('???????????????', {
						title: '?????????',
						icon: 1,
					});
					layer.close(index);
				}
			}
		});
	});
	/*????????????-??????*/
	function member_show(title, url, id, w, h) {
		layer_show(title, url + '?id=' + id, w, h);
	}


	/*????????????-??????*/
	function teacher_show(title, url, id, w, h) {
		layer_show(title, url + '?id=' + id, w, h);
	}


	/*??????-??????*/
	function member_edit(id) {
		layer.open({
			type: 1,
			title: '???????????????????????????',
			maxmin: true,
			shadeClose: false, //?????????????????????
			area: ['800px', '500px'],
			content: $('#add_menber_style'),
			btn: ['??????', '??????'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
		       
		        $.post('fastOrderTeacherInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#name').val(res.message.name);
		            	$('#phone').val(res.message.phone);
		            	$('#wxNumber').val(res.message.wxNumber);
		            	$('#teacherId').val(res.message.teacherId);
		            	$('#price').val(res.message.orderPrice);
		            	$('#remark').val(res.message.remark);
		            	$("#state").val(res.message.state);
		            	
		            } else {
		            	alert(res.message);
		            	
		            }
		        });


  			},
			yes: function(index, layero) {
				var num = 0;
				var str = "";
				
				var d = {
		            IsAsync: true,
		            fotId: id,
		            name:$('#name').val(),
		            phone:$('#phone').val(),
		            wxNumber:$('#wxNumber').val(),
		            teacherId:$('#teacherId').val(),
		            orderPrice:$('#price').val(),
		            state:$("#state").val(),
		            remark:$("#remark").val(),
		        };
		        
		        $.post('updateFastOrderTeacherInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	layer.alert(res.message, {
							title: '?????????',
							icon: 1,
						});
						layer.close(index);
						
						 var _body = window.parent;
			            var _iframe1=_body.document.getElementById('iframe');
			            _iframe1.contentWindow.location.reload(true);
		            	
		            } else {
		            	layer.alert(res.message, {
							title: '?????????',
							icon: 0,
						});
						layer.close(index);
		            }
		        });
					
			}
		});
	}
	
	laydate({
		elem: '#start',
		event: 'focus'
	});
</script>
