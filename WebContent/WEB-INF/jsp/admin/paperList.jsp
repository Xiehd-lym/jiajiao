<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Member"%>
<%@page import="com.jiajiao.bean.Teacher"%>
<%@page import="com.jiajiao.bean.Paper"%>
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
		
		
		<script type="text/javascript" charset="utf-8" src="../static/back/Widget/ueditor/ueditor.config.js"></script>
	    <script type="text/javascript" charset="utf-8" src="../static/back/Widget/ueditor/ueditor.all.min.js"> </script>
	    <!--????????????????????????????????????ie????????????????????????????????????????????????????????????-->
	    <!--??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????-->
	    <script type="text/javascript" charset="utf-8" src="../static/back/Widget/ueditor/lang/zh-cn/zh-cn.js"></script>
		
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
									<th width="100">??????</th>
									<th width="100">??????</th>
									<th width="100">?????????</th>
									<th width="100">?????????</th>
									<th width="100">??????</th>
									<th width="140">????????????</th>
									<th width="100">??????</th>
									<th width="200">??????</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Paper> paperList = (List<Paper>)request.getAttribute("paperList");
							if(paperList!=null){
								for(int i=0;i<paperList.size();i++){
									Paper paper = paperList.get(i);							
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=paper.getpId() %></td>
									<td><a href="../paper/paperInfo.action?pId=<%=paper.getpId() %>" target="_blank"><%=paper.getTitle() %></a></td>
									<td>
									<%
									int grade = paper.getGrade();
									if(grade==1){
									%>
									?????????
									<%
									}else if(grade==2){
									%>
									?????????
									<%
									}else if(grade==3){
									%>
									?????????
									<%
									}else if(grade==4){
									%>
									?????????
									<%
									}else if(grade==5){
									%>
									?????????
									<%
									}else if(grade==6){
									%>
									?????????
									<%
									}else if(grade==7){
									%>
									??????
									<%
									}else if(grade==8){
									%>
									??????
									<%
									} else if(grade==9){
									%>
									??????
									<%
									} else if(grade==10){
									%>
									??????
									<%
									} else if(grade==11){
									%>
									??????
									<%
									} else if(grade==12){
									%>
									??????
									<%
									}    
									%> 
									</td>
									<td>
									<%
									int course =paper.getCourse();
										if(course==1){
									%>
									??????
									<%
									}else if(course==2){
									%>
									??????
									<%
									}else if(course==3){
									%>
									??????
									<%
									}else if(course==4){
									%>
									??????
									<%
									}else if(course==5){
									%>
									??????
									<%
									}else if(course==6){
									%>
									??????
									<%
									}else if(course==7){
									%>
									??????
									<%
									}else if(course==8){
									%>
									??????
									<%
									} else if(course==9){
									%>
									??????
									<%
									} else if(course==10){
									%>
									??????
									<%
									} else if(course==11){
									%>
									??????
									<%
									}   
									%> 
									</td>
									<td><%=paper.getView() %></td>
									<td><%=paper.getDownNum()%></td>
									<td><%=paper.getSort() %></td>
									<td><%=paper.getPubTime() %></td>
									<td class="td-status">
									<%if(paper.getDisplay()==1){ %>
										<span class="label label-success radius">?????????</span>
									<%}else{ %>
										<span class="label label-defaunt radius">?????????</span>
									<%} %>
										
									</td>
									<td class="td-manage">
									
										<%if(paper.getDisplay()==1){ %>
											<a onClick="paper_stop(this,<%=paper.getpId() %>)" href="javascript:;" title="??????" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="paper_start(this,<%=paper.getpId() %>)" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="????????????" href="paperInfo.action?pId=<%=paper.getpId() %>" class="btn btn-xs btn-info Refund_detailed">??????</a>  
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
				<li>
					<label class="label_name">
						???????????????
					</label>
					<span class="add_name">
						<input value="" id="title" name="????????????" type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">
						???????????????
					</label>
					<span class="add_name"> 
						<select id="degree" name="????????????"
							style="width: 170px">
							<option value="1">
								??????
							</option>
							<option value="2">
								??????
							</option>
							<option value="3">
								??????
							</option>
						</select> 
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">
						???????????????
					</label>
					<span class="add_name"> 
						<select id="grade" name="????????????"
							style="width: 170px">
							<option value="1">
								?????????
							</option>
							<option value="2">
								?????????
							</option>
							<option value="3">
								?????????
							</option>
							<option value="4">
								?????????
							</option>
							<option value="5">
								?????????
							</option>
							<option value="6">
								?????????
							</option>
							<option value="7">
								??????
							</option>
							<option value="8">
								??????
							</option>
							<option value="9">
								??????
							</option>
							<option value="10">
								??????
							</option>
							<option value="11">
								??????
							</option>
							<option value="12">
								??????
							</option>
						</select> 
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">
						???????????????
					</label>
					<span class="add_name"> 
						<select id="course" name="????????????"
							style="width: 170px">
							<option value="1">
								??????
							</option>
							<option value="2">
								??????
							</option>
							<option value="3">
								??????
							</option>
							<option value="4">
								??????
							</option>
							<option value="5">
								??????
							</option>
							<option value="6">
								??????
							</option>
							<option value="7">
								??????
							</option>
							<option value="8">
								??????
							</option>
							<option value="9">
								??????
							</option>
							<option value="10">
								??????
							</option>
							<option value="11">
								??????
							</option>
						</select> 
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">
						???????????????
					</label>
					<span class="add_name"><input name="????????????" id="downLink"
							type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li>
					<label class="label_name">
						???????????????
					</label>
					<span class="add_name"><input name="????????????" id="downPwd"
							type="text" class="text_add" />
					</span>
					<div class="prompt r_f"></div>
				</li>
				<li style="height: 600px;">
					
					<span class="add_name col-10">
						<script id="editor" type="text/plain" style="width:100%;height:400px; margin-left:10px;">
						</script>
					</span>
					<div class="prompt r_f"></div>
				</li>
				
			</ul>
		</div>
	</body>

</html>
<script>

	$(function(){
		var ue = UE.getEditor('editor');
		
	});


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
						"aTargets": [0,2, 8,10]
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
	function paper_stop(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('stopPaper.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="teacher_start(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
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
	function paper_start(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('startPaper.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="teacher_stop(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">?????????</span>');
						$(obj).remove();
						layer.msg('?????????!', {
							icon: 6,
							time: 1000
						});
		            	
		            } else {
	            		layer.msg('????????????????????????!', {
							icon: 6,
							time: 1000
						});
		            }
		    });
			
		});
	}
	/*??????-??????*/
	function paper_edit(id,title) {
		layer.open({
			type: 1,
			title: title,
			maxmin: true,
			shadeClose: false, //?????????????????????
			area: ['800px', ''],
			content: $('#add_menber_style'),
			btn: ['??????', '??????'],
			success: function(layero, index){
			
		        //UE.getEditor('editor').setContent('????????????ueditor234234234243');
		        //alert(UE.getEditor('editor').getPlainTxt());
				
			
				//var d = {
		        //    IsAsync: true,
		        //    id: id
		        //};
		        
		        
	       
		       // $.post('updatePaper.action', d, function (res) {
		        	
		       //     if (res.success) {
		       //     	$('#memberId').val(res.message.memberId);
		       //     	$('#name').val(res.message.name);
		       //     	$('#phone').val(res.message.phone);
		       //     	$('#address').val(res.message.address);
		       //     	$('#password').val(res.message.password);
		            	
		       //     	if(1==res.message.gender){
		       ////     		$("input[name='form-field-radio']").get(0).checked=true;
		       //     	}else{
		       //     		$("input[name='form-field-radio']").get(1).checked=true;
		       //     	}
		            	
		       //     	$("#areaId").val(res.message.areaId);
		       //     	$("#wxNumber").val(res.message.wxNumber);
		       //     	$("#areaId").val(res.message.districtId);
		       //     } else {
		       //     	alert(res.message);
		            	
		       //     }
		       // });

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