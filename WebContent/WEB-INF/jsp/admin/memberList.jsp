<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
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
									<th width="100">??????</th>
									<th width="80">?????????</th>
									<th width="100">??????</th>
									<th width="150">?????????</th>
									<th width="">??????</th>
									<th width="180">??????</th>
									<th width="120">???????????????</th>
									<th width="120">???????????????</th>
									<th width="100">????????????</th>
									<th width="70">??????</th>
									<th width="250">??????</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Member> memberList = (List<Member>)request.getAttribute("memberList");
							if(memberList!=null){
								for(int i=0;i<memberList.size();i++){
									Member member = memberList.get(i);							
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=member.getMemberId() %></td>
									<td><%=member.getName() %></td>
									<td><%=member.getPhone() %></td>
									<td>
									<%
									if(member.getGender()==1){
									%>
										???
									<%
									}else{
									%>
										???
									<%
									}
									%>
									</td>
									<td><%=member.getWxNumber() %></td>
									<td class="text-l"><%
									if(member.getDistrictId()==1){
									%>
									?????????
									<%}else if(member.getDistrictId()==2){%>
									?????????
									<%}else if(member.getDistrictId()==3){%>
									?????????
									<%}else if(member.getDistrictId()==4){%>
									?????????
									<%}else if(member.getDistrictId()==5){%>
									?????????
									<%} %></td>
									<td><%=member.getAddress() %></td>
									<td><%=member.getOrderNum() %></td>
									<td><%=member.getAppointNum()%></td>
									<td><%=member.getRegistTime()%></td>
									<td class="td-status">
									<%if(member.getIsUse()==1){ %>
										<span class="label label-success radius">?????????</span>
									<%}else{ %>
										<span class="label label-defaunt radius">?????????</span>
									<%} %>
										
									</td>
									<td class="td-manage">
									
										<%if(member.getIsUse()==1){ %>
											<a onClick="member_stop(this,<%=member.getMemberId() %>)" href="javascript:;" title="??????" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="member_start(this,<%=member.getMemberId() %>)" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="??????" onclick="member_edit(<%=member.getMemberId() %>)" href="javascript:;" class="btn btn-xs btn-info"><i class="icon-edit bigger-120"></i></a>
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
		<!--??????????????????-->
		<div class="add_menber" id="add_menber_style" style="display:none">
				<input value="" id="memberId"  type="hidden"  class="text_add"/>
			<ul class=" page-content">
				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input value="" id="name" name="??????" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???????????????</label><span class="add_name"><input name="????????????" id="phone" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label>
					<span class="add_name">
     					<label><input name="form-field-radio" value="1" id="gender" type="radio" checked="checked" class="ace"><span class="lbl">???</span></label>&nbsp;&nbsp;&nbsp;
						<label><input name="form-field-radio" value="0" id="gender" type="radio" class="ace"><span class="lbl">???</span></label>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???&nbsp;&nbsp;???&nbsp;&nbsp;??????</label><span class="add_name"><input name="?????????" id="wxNumber" type="text"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name">
						<select id="areaId"  name="??????" style=" width:170px">
							<option  value ="0">--?????????????????????--</option>
							<option  value ="1">?????????</option>
							<option  value ="2">?????????</option>
							<option  value ="3">?????????</option>
							<option  value ="4">?????????</option>
							<option  value ="5">?????????</option>
						</select>
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input name="??????" id="password" type="password"  class="text_add"/></span>
					<div class="prompt r_f"></div>
				</li>
				<li class="adderss"><label class="label_name">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????</label><span class="add_name"><input name="??????" id="address" type="text"  class="text_add" style=" width:350px"/></span>
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
						"aTargets": [0,2,3,4,5,6,7, 8, 9,12]
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
	function member_stop(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('stopMember.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
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
	function member_start(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('startMember.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
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
	/*??????-??????*/
	function member_edit(id) {
		layer.open({
			type: 1,
			title: '??????????????????',
			maxmin: true,
			shadeClose: false, //?????????????????????
			area: ['800px', ''],
			content: $('#add_menber_style'),
			btn: ['??????', '??????'],
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
	       
		        $.post('memberInfo.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#memberId').val(res.message.memberId);
		            	$('#name').val(res.message.name);
		            	$('#phone').val(res.message.phone);
		            	$('#address').val(res.message.address);
		            	$('#password').val(res.message.password);
		            	
		            	if(1==res.message.gender){
		            		$("input[name='form-field-radio']").get(0).checked=true;
		            	}else{
		            		$("input[name='form-field-radio']").get(1).checked=true;
		            	}
		            	
		            	$("#areaId").val(res.message.areaId);
		            	$("#wxNumber").val(res.message.wxNumber);
		            	$("#areaId").val(res.message.districtId);
		            } else {
		            	alert(res.message);
		            	
		            }
		        });

  			},
			yes: function(index, layero) {
				
				var d = {
			            IsAsync: true,
			            memberId:$('#memberId').val(),
			            name:$('#name').val(),
		            	phone:$('#phone').val(),
		            	password:$('#password').val(),
		            	districtId:$("#areaId").val(),
		            	gender:$("input[name='form-field-radio']:checked").val(),
		            	address:$("#address").val(),
			            wxNumber:$("#wxNumber").val()
		
			        };
			        $.post('updateMemberInfo.action', d, function (res) {
			        	
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