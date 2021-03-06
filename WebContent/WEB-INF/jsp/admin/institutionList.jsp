<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.jiajiao.bean.Institution"%>
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
		
		<script type="text/javascript">
			//??????????????????    IE??????????????????
			function previewImage2(file) {
				var MAXWIDTH = 280;
				var MAXHEIGHT = 240;
				var div = document.getElementById('preview2');
				if(file.files && file.files[0]) {
					div.innerHTML = '<img id=imghead2>';
					var img = document.getElementById('imghead2');
					img.onload = function() {
						var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
						img.width = rect.width;
						img.height = rect.height;
						img.style.marginTop = rect.top + 'px';
					}
					var reader = new FileReader();
					reader.onload = function(evt) {
						img.src = evt.target.result;
					}
					reader.readAsDataURL(file.files[0]);
				} else //??????IE
				{
					var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
					file.select();
					var src = document.selection.createRange().text;
					div.innerHTML = '<img id=imghead2>';
					var img = document.getElementById('imghead2');
					img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
					status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
					div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" + rect.top + "px;" + sFilter + src + "\"'></div>";
				}
			}

			function clacImgZoomParam(maxWidth, maxHeight, width, height) {
				var param = {
					top: 0,
					left: 0,
					width: width,
					height: height
				};
				if(width > maxWidth || height > maxHeight) {
					rateWidth = width / maxWidth;
					rateHeight = height / maxHeight;

					if(rateWidth > rateHeight) {
						param.width = maxWidth;
						param.height = Math.round(height / rateWidth);
					} else {
						param.width = Math.round(width / rateHeight);
						param.height = maxHeight;
					}
				}
				param.left = Math.round((maxWidth - param.width) / 2);
				param.top = Math.round((maxHeight - param.height) / 2);
				return param;
			}
		</script>
		
		
	</head>

	<body>
		<div class="page-content clearfix">
			<div id="Member_Ratings">
				<div class="d_Confirm_Order_style">
					
					<div class="table_menu_list">
						<table class="table table-striped table-bordered table-hover" id="sample-table">
							<thead>
								<tr>
									<th width="25">
										<label>
											<input type="checkbox" class="ace">
												<span class="lbl"></span>
										</label>
									</th>
									<th width="80">ID</th>
									<th width="50">LOGO</th>
									<th width="100">??????</th>
									<th width="80">????????????</th>
									<th width="90">?????????</th>
									<th width="90">??????</th>
									<th width="90">??????</th>
									<th width="80">??????</th>
									<th width="60">??????</th>
									<th width="60">??????</th>
									<th width="50">??????</th>
								</tr>
							</thead>
							<tbody>
							<%
							List<Institution> institutionList = (List<Institution>)request.getAttribute("institutionList");
							if(institutionList!=null){
								for(int i=0;i<institutionList.size();i++){
									Institution institution = institutionList.get(i);							
							%>
								<tr>
									<td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
									<td><%=institution.getiId() %></td>
									<td>
										<img src="<%=basePath %>static/institutionimg/<%=institution.getLogo()%>" width="140px" height="120px">
									</td>
									<td><%=institution.getiName()%></td>
									<td><%=institution.getCourse()%></td>
									<td><%=institution.getContactName()%></td>
									<td><%=institution.getContactPhone()%></td>
									<td><%
				                    if(institution.getAreaId()==1){
				                    %>
				                    	?????????
				                    <%} %>
				                    <%if(institution.getAreaId()==2){ %> 
				                    	?????????
				                    <%} %>
				                    <%if(institution.getAreaId()==3){ %> 
				                    	?????????
		        					<%} %>
		        					<%if(institution.getAreaId()==4){ %> 
		        						?????????
					        		<%} %>
					        		<%if(institution.getAreaId()==5){ %> 
					        			?????????
		        					<%} %></td>
									<td><%=institution.getSort()%></td>
									<td>
										<%
										 String testString = institution.getTeachingPrice();
										 int duanshu = 0;//?????????
										 int duan = 15;//????????????
										 int zongchangdu = testString.length();//??????????????????
										 int yushu=zongchangdu%duan;//??????
										 duanshu = zongchangdu/duan+(yushu>0?1:0);
										 for(int k=0;k<duanshu;k++){
										 %>
										 <%=(k==duanshu-1)?testString.substring(k*duan):testString.substring(k*duan,(k+1)*duan)%>
										 <br/>
										<%
										 }
										%>
									</td>
									<td class="td-status">
									<%if(institution.getDisplay()==1){ %>
										<span class="label label-success radius">??????</span>
									<%}else{ %>
										<span class="label label-defaunt radius">?????????</span>
									<%} %>
										
									</td>
									<td class="td-manage">
										<%if(institution.getDisplay()==1){ %>
											<a onClick="institution_stop(this,<%=institution.getiId() %>)" href="javascript:;" title="?????????" class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
										<%}else{ %>
											<a style="text-decoration:none" class="btn btn-xs " onclick="institution_start(this,<%=institution.getiId() %>)" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>
										<%} %>
										<a title="??????" href="../institution/institutionInfo.action?iId=<%=institution.getiId() %>&admin=1" >??????</a>   
										<a title="??????" onclick="institution_edit(<%=institution.getiId() %>)" href="javascript:;" ><i class="icon-edit bigger-120"></i></a>
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
		<form action="updateInstitution.action" id="form" name="form" method="post" enctype="multipart/form-data">
			<div class="add_menber" id="add_menber_style" style="display:none">
				<input value="" id="iId" name="iId"  type="hidden"  class="text_add"/>
				<input value="" id="preInstitutionLogo" name="preInstitutionLogo"  type="hidden"  class="text_add"/>
				<ul class=" page-content">
					<li>
						<label class="label_name">
							???????????????
						</label>
						<span class="add_name"><input value="" id="iName" name="iName"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???????????????
						</label>
						<span class="add_name"><input name="contactPhone" id="contactPhone"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???&nbsp;&nbsp;???&nbsp;&nbsp;??????
						</label>
						<span class="add_name"><input name="contactName" id="contactName"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							Q&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Q???
						</label>
						<span class="add_name"><input name="qq" id="qq"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???????????????
						</label>
						<span class="add_name"><input name="kemudalei" id="kemudalei"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???????????????
						</label>
						<span class="add_name"><input name="course" id="course"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????
						</label>
						<span class="add_name"> <select id="areaId" name="areaId"
								style="width: 170px">
								<option value="0">
									--?????????????????????--
								</option>
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
							</select> </span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????
						</label>
						<span class="add_name"><input name="address" id="address"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????
						</label>
						<span class="add_name"><input name="lng" id="lng"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????
						</label>
						<span class="add_name"><input name="lat" id="lat"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???????????????
						</label>
						<span class="add_name"><input name="teachingPrice" id="teachingPrice"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<label class="label_name">
							???????????????
						</label>
						<span class="add_name"><input name="teachingType" id="teachingType"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
					</li>
					<li>
						<div id="preview2" >
	                        <img id="imghead2" width="280" height="240" border="0" src="../static/img/photo.png">
						</div>
						<label for="file" ><img src="../static/img/upload.png" style="border:0px" ></label>
						<input type="file"  id="file" name="file" style="display: none" onchange="previewImage2(this)">
					</li>
					<li>
						<label class="label_name">
							???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;??????
						</label>
						<span class="add_name"><input name="sort" id="sort"
								type="text" class="text_add" />
						</span>
						<div class="prompt r_f"></div>
						<br>
						<label class="label_name">???????????????</label>
						<span class="add_name">
	     					<label><input name="isListen" value="1" id="isListen" type="radio" checked="checked" class="ace"><span class="lbl">???</span></label>&nbsp;&nbsp;&nbsp;
							<label><input name="isListen" value="0" id="isListen" type="radio" class="ace"><span class="lbl">???</span></label>
						</span>
						<div class="prompt r_f"></div>
						
						<br>
						<span class="add_name">
							<textarea name="introduce" id="introduce"  rows="10" cols="35" placeholder="????????????"></textarea>
						</span>
						<div class="prompt r_f"></div>
						<br><br><br><br><br>
						<input type="Submit" value="       ??????        ">
					</li>
				</ul>
				
			</div>
		</form>
	</body>

</html>
<script>
	jQuery(function($) {
			var oTable1 = $('#sample-table').dataTable({
				"aaSorting": [
					[8, "desc"]
				], //?????????????????????
				"bStateSave": true, //????????????
				"aoColumnDefs": [
					//{"bVisible": false, "aTargets": [ 3 ]} //????????????????????????
					{
						"orderable": false,
						"aTargets": [0,1,2,3,4,5,6,7,9,10,11]
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
	function institution_stop(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('stopInstitution.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="institution_start(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
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
	function institution_start(obj, id) {
		layer.confirm('?????????????????????', function(index) {
		
			var d = {
	            IsAsync: true,
	            id: id
	        };
			
			 $.post('startInstitution.action', d, function (res) {
		        	
		            if (res.success) {
		            	
		            	$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="institution_stop(this,'+id +')" href="javascript:;" title="??????"><i class="icon-ok bigger-120"></i></a>');
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
	function institution_edit(id) {
		layer.open({
			type: 1,
			title: '??????????????????',
			maxmin: true,
			shadeClose: false, //?????????????????????
			area: ['800px', '760px'],
			offset: ['20px', '300px'],
			content: $('#add_menber_style'),
			success: function(layero, index){
				var d = {
		            IsAsync: true,
		            id: id
		        };
	       
		        $.post('findInstitution.action', d, function (res) {
		        	
		            if (res.success) {
		            	$('#iId').val(res.message.iId);
		            	$('#iName').val(res.message.iName);
		            	$('#kemudalei').val(res.message.kemudalei);
		            	$('#course').val(res.message.course);
		            	$('#contactName').val(res.message.contactName);
		            	$('#contactPhone').val(res.message.contactPhone);
		            	$('#teachingType').val(res.message.teachingType);
		            	$('#teachingPrice').val(res.message.teachingPrice);
		            	$('#teachingPrice').val(res.message.teachingPrice);
		            	$('#preInstitutionLogo').val(res.message.logo);
		            	
		            	if(1==res.message.isListen){
		            		$("input[name='isListen']").get(0).checked=true;
		            	}else{
		            		$("input[name='isListen']").get(1).checked=true;
		            	}
		            	
		            	$("#qq").val(res.message.qq);
		            	$("#address").val(res.message.address);
		            	$("#areaId").val(res.message.areaId);
		            	$("#lng").val(res.message.lng);
		            	$("#lat").val(res.message.lat);
		            	$("#sort").val(res.message.sort);
		            	$("#introduce").val(res.message.introduce);
		            	$("#imghead2").attr('src','<%=basePath%>static/institutionimg/'+res.message.logo); 
		            } else {
		            	alert(res.message);
		            	
		            }
		        });

  			}
			
		});
	}

	laydate({
		elem: '#start',
		event: 'focus'
	});
	
	

var index = parent.layer.getFrameIndex(window.name);
parent.layer.iframeAuto(index);
$('.Refund_detailed').on('click', function(){
	var cname = $(this).attr("title");
	var chref = $(this).attr("href");
	var cnames = parent.$('.Current_page').html();
	var herf = parent.$("#iframe").attr("src");
    parent.$('#parentIframe').html(cname);
    parent.$('#iframe').attr("src",chref).ready();;
	parent.$('#parentIframe').css("display","inline-block");
	parent.$('.Current_page').attr({"name":herf,"href":"javascript:void(0)"}).css({"color":"#4c8fbd","cursor":"pointer"});
	//parent.$('.Current_page').html("<a href='javascript:void(0)' name="+herf+" class='iframeurl'>" + cnames + "</a>");
    parent.layer.close(index);
	
});
</script>