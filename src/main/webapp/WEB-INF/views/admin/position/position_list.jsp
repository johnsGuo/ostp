<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>位置</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <jsp:include page="../head.jsp"/>

</head>
<body>
<!--将这一部分1转化成ifream-->
<div class="main-content"  style="margin-left:0;margin-bottom:0;">
    <div class="breadcrumbs" id="breadcrumbs">
        <script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

        <ul class="breadcrumb">
            <li>
                <i class="icon-download"></i>
                <a href="#">位置管理</a>
            </li>
            <li class="active">位置列表</li>
        </ul><!-- .breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
               	 位置列表
                <small>
                    <i class="icon-double-angle-right"></i>
                   	 查看
                </small>
            </h1>
        </div><!-- /.page-header -->

        <div class="row">
            <div class="col-xs-12">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="row">
                            <div class="col-xs-12">
                                <form id="position-select" class="clearfix form-actions" action="admin/position-list" method="post" onsubmit="return checkDate()">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">位置名称</label>

                                                <div class="col-sm-9">
                                                	<c:choose>
                                                		<c:when test="${positionInfo.positionname != null}">
                                                    		<input type="text" id="form-field-1" name="positionname" placeholder="tilte" class="form-control" value="${positionInfo.positionname }">
                                                		</c:when>
                                                		<c:otherwise>
                                                			<input type="text" id="form-field-1" name="positionname" placeholder="tilte" class="form-control">
                                                		</c:otherwise>
                                                	</c:choose>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">位置坐标</label>

                                                <div class="col-sm-9">
                                                    <c:if test="${positionInfo.positioncoordinate != null }">
                                                    	 <input type="text" id="form-field-1" name="positioncoordinate" placeholder="tilte" class="form-control" value="${positionInfo.positioncoordinate }">
                                                    </c:if>
                                                    <c:if test="${positionInfo.positioncoordinate == null }">
                                                    	<input type="text" id="form-field-1" name="positioncoordinate" placeholder="tilte" class="form-control">
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right"  for="form-field-1">起始时间</label>

                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                    	<c:if test="${positionInfo.begintime != null }">
                                                        	<input placeholder="yyyy-MM-dd" id="begin-time" name="begintime" class="laydate-icon form-control date-picker date_calendar" type="text" value="${positionInfo.begintime }">
                                                    	</c:if>
                                                    	<c:if test="${positionInfo.begintime == null }">
                                                    		<input placeholder="yyyy-MM-dd" id="begin-time" name="begintime" class="laydate-icon form-control date-picker date_calendar" type="text">
                                                    	</c:if>
                                                        <span class="input-group-addon">
															<i class="icon-calendar bigger-110"></i>
														</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <!--添加下拉菜单-->
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label no-padding-right" for="form-field-1">位置类型</label>

                                                <div class="col-sm-8">
                                                    <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
                                                     <select class="form-control" name="positiontypeid">
		                                                <option value=""></option>
		                                                <c:forEach items="${positionTypes }" var="positionType" varStatus="status">
		                                                	<c:choose>
		                                                		<c:when test="${positionInfo.positiontypeid == positionType.PositionTypeID }">
		                                                			<option value="${positionType.PositionTypeID }" selected="selected">${positionType.PositionTypeName }</option>
		                                                		</c:when>
		                                                		<c:otherwise>
		                                                			<option value="${positionType.PositionTypeID }">${positionType.PositionTypeName }</option>
		                                                		</c:otherwise>
		                                                	</c:choose>
		                                                </c:forEach>
		                                            </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-4 control-label no-padding-right" for="form-field-1">运动类型</label>

                                                <div class="col-sm-8">
                                                    <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
                                                    <select class="form-control" name="sporttypeid">
														<option value=""></option>
														<c:forEach items="${sportType }" var="sportType" varStatus="status">
															<c:choose>
																<c:when test="${positionInfo.sporttypeid == sportType.SportTypeID }">
																	<option value="${sportType.SportTypeID }" selected="selected">${sportType.SportTypeName }</option>
																</c:when>
																<c:otherwise>
																	<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
																</c:otherwise>
															</c:choose>
														</c:forEach>
													</select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">结束时间</label>

                                                <div class="col-sm-9">
                                                    <div class="input-group">
                                                        <c:if test="${positionInfo.endtime != null }">
                                                        	<input placeholder="yyyy-MM-dd" id="end-time" name="endtime" class="laydate-icon form-control date-picker date_calendar" type="text" value="${positionInfo.endtime }">
                                                        </c:if>
                                                        <c:if test="${positionInfo.endtime == null }">
                                                        	<input placeholder="yyyy-MM-dd" id="end-time" name="endtime" class="laydate-icon form-control date-picker date_calendar" type="text">
                                                        </c:if>
                                                        <span class="input-group-addon">
															<i class="icon-calendar bigger-110"></i>
														</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <script type="text/javascript">
                                            $('.date_calendar').datetimepicker({
                                                timeFormat: "HH:mm:ss",
                                                dateFormat: "yy-mm-dd",
                                                showSecond:true,
                                                beforeShow:function(input){
                                                    $(input).css({
                                                        "position":"relative",
                                                        "z-index":9999
                                                    });
                                                }
                                            });
                                        </script>
                                    </div>
                                    <br />
                                    <br />
                                    <div class="row">
                                        <div class="form-actions">
                                            <div class="col-sm-offset-5 col-md-3">
                                            	<input type="submit" class="btn btn-primary" value="查询">
                                                &nbsp; &nbsp; &nbsp;
                                                <button class="btn btn-primary" type="reset">
                                                    <i class="icon-undo bigger-110"></i>
                                                  	  重置
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>

                            <div class="col-xs-12">

                                <div class="row">
                                    <div class="col-sm-6">
                                        <div class="dataTables_info" id="sample-table-2_info">
                                            <div class="btn-group">
                                                <button class="btn btn-info">
                                                    <i class="icon-edit bigger-125"></i> 添加文档
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6">

                                    </div>
                                </div>

                                <div class="table-header">
                                   	 位置更新信息
                                </div>

                                <div class="table-responsive">
                                    <table id="sample-table-2" class="table table-striped table-bordered table-hover">
                                        <thead>
                                        <tr>
                                            <th class="center">选择</th>
                                            <th>序号</th>
                                            <th>位置名称</th>
                                            <th>位置坐标</th>
                                            <th>位置类型</th>
                                            <th>运动类型</th>
                                            <th>详细介绍</th>
                                            <th>
                                                <i class="icon-time bigger-110 hidden-480"></i>
                                               	 适宜去的时间
                                            </th>
                                            <th class="hidden-480">操作</th>

                                        </tr>
                                        </thead>

                                        <tbody>
                                        	<c:choose>
                                        		<c:when test="${fn:length(positionInfos.results) > 0 }">
                                        			<c:forEach items="${positionInfos.results }" var="positionInfo" varStatus="statu">
	                                        			 <tr class="zixun_tr">
				                                            <td class="center">
				                                                <label>
				                                                    <input type="checkbox" class="ace" />
				                                                    <span class="lbl"></span>
				                                                </label>
				                                            </td>
				                                            <%-- <input type="text" hidden="hidden" value="${positionInfo.positionid }"/> --%>
				                                            <td>${(statu.index+1) }</td>
				                                            <td>${positionInfo.positionname }</td>
				                                            <td>${positionInfo.positioncoordinate }</td>
				                                            <td>${positionInfo.positionTypeInfo.positiontypename }</td>
				                                            <td>${positionInfo.basicSportType.sporttypename }</td>
				                                            <td>${positionInfo.positiondescribe }</td>
				                                            <td>${positionInfo.positiontime }</td>
				                                            <td> 
				                                                <div class="visible-md visible-lg hidden-sm hidden-xs action-buttons">
				
				                                                    <a class="blue" href="admin/position-view?positionid=${positionInfo.positionid }&positiontypeid=${positionInfo.positionTypeInfo.positiontypeid }&sporttypeid=${positionInfo.basicSportType.sporttypeid }">
				                                                        <i class="icon-search bigger-130"></i> 详情
				                                                    </a>
				
				                                                    <a class="green" href="admin/position?positionid=${positionInfo.positionid }&positiontypeid=${positionInfo.positionTypeInfo.positiontypeid }&sporttypeid=${positionInfo.basicSportType.sporttypeid }">
				                                                        <i class="icon-pencil bigger-130"></i> 编辑
				                                                    </a>
				
				                                                   <a class="red" href="admin/position-del?positionid=${positionInfo.positionid }&positionpicture=${positionInfo.positionpicture}" class="delete_a">
				                                                   <%-- <a class="red" href="javascript:void(0)" class="delete_a" attr-id="${positionInfo.positionid }">--%>
				                                                        <i class="icon-trash bigger-130"></i> 删除 
				                                                    </a>
				                                                </div>
				                                            </td>
				                                         </tr>
			                                        </c:forEach>
                                        		</c:when>
                                        		<c:otherwise>
                                        			<tr>
														<td colspan="9" align="center">对不起，暂无数据！</td>
													</tr>
                                        		</c:otherwise>
                                        	</c:choose>
                                        <script type="text/javascript">
                                            /* (function(){
                                                var tr=document.querySelector("#zixun_tr");
                                                var delete1=document.querySelector("#delete_a");
                                                delete1.addEventListener("click",function(e){
                                                    tr.innerHTML="";
                                                    e.preventDefault();
                                                });
                                            })(); */
                                        </script>
                                        </tbody>
                                    </table>
                                </div>
								<div class="row">
									<div class="col-sm-8 col-sm-offset-4">
										<div class="dataTables_paginate paging_bootstrap">
											<ul class="pagination">${pageStr}
											</ul>
										</div>
									</div>
								</div>
							</div>
                        </div>
                    </div><!-- /.col -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->
<!-- <script type="text/javascript" src="resources/assets/js/jquery-1.8.2.min.js"></script> -->
<jsp:include page="../foot.jsp"/>
<script type="text/javascript" src="resources/js/laydate/laydate.js"></script>
<script type="text/javascript">
	var SCOPE = {
			 'index_url':'admin/info-list',
			 'add_url' : 'admin/info-add',
			 'edit_url' : 'admin/info-edit',
			 'del_url' : 'admin/info-del',
	
		 }

	/*============检查查询时日期是否合法 start============*/
	var timeFlage = false;
	var beginTime = {
			elem: '#begin-time',
			choose: function(datas){
				var endDate = new Date($("#end-time").val());
				timeFlage = Date.parse(endDate) < Date.parse(datas);
				if(timeFlage){
					alert("起始时间不能大于结束时间");
				}
			}
	};
	var endTime = {
			elem: '#end-time',
			choose: function(datas){
				var beginDate = new Date($("#begin-time").val());
				timeFlage = !(Date.parse(beginDate) < Date.parse(datas));
				if(timeFlage){
					alert("起始时间不能大于结束时间");
				}
			}
	};
	laydate(beginTime);
	laydate(endTime);
	
	function checkDate(){
		var startFlag = $("#begin-time").val();
		if(timeFlage && startFlag != '') {
			alert("起始日期不能大于结束时间，请确认！");
			return false;
		}
	}
	/*============检查查询时日期是否合法 end============*/
	/* $(".pagination li a").click(function(){
		var url = $(this).attr("href");
		var datas = $("#position-select").serialize();
		alert("ddd");
		$(this).attr("href","javascript:;");
		$.ajax({
			url : url,
			type : "POST",
			data : datas,
			dataType : "json",
			success : function(data){
				var pageStr = data[0];
				var positions = data[1];
				var html = "";
				alert(positions.length);
				for(var i = 0; i < positions.length; i++) {
					html += "<tr>"
						+"<td class=\"center\">"
							+"<label>"
								+"<input type=\"checkbox\" class=\"ace\" />"
								+"<span class=\"lbl\"></span>"
								 +"<input type=\"text\" hidden=\"hidden\" value=\""+positions[i].positionid +"\"/>"
							+"</label>"
						+"</td>"
						+"<td>"+(i + 1)+"</td>"
						+"<td>"+positions[i].positionname +"</td>"
						+"<td>"+positions[i].positioncoordinate +"</td>"
						+"<td>"+positions[i].positionTypeInfo.positiontypename +"</td>"
						+"<td>"+positions[i].basicSportType.sporttypename +"</td>"
						+"<td>"+positions[i].positiondescribe+"</td>"
						+"<td>"+positions[i].positiontime+"</td>"
						+"<td>"
							+"<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>"
								+"<a class='blue' href='admin/position-view?positionid='"+positions[i].positionid +"&positiontypeid="+positions[i].positionTypeInfo.positiontypeid +"&sporttypeid="+positions[i].basicSportType.sporttypeid +"'>"
									+"<i class=\"icon-search bigger-130\"></i> 详情"
							    +"</a>"
							    +"<a class=\"green\" href=\"admin/position?positionid='"+positions[i].positionid +"&positiontypeid="+positions[i].positionTypeInfo.positiontypeid +"&sporttypeid="+positions[i].basicSportType.sporttypeid +"\">"
						         	+"<i class=\"icon-pencil bigger-130\"></i> 编辑"
							     +"</a>"
							     +" <a class=\"red\" href=\"admin/position-del?positionid="+positions[i].positionid +"&positionpicture="+positions[i].positionpicture +"\" class=\"delete_a\">"
							         +"<i class=\"icon-trash bigger-130\"></i> 删除"
								 +"</a>"
							+"</div>"
						+"</td>"
					+"</tr>";
				}
				$("#sample-table-2 tbody").empty().append(html);
				alert($(".pagination li a").attr("href"));
				$(".pagination li").remove();
				$(".pagination").append(pageStr);
			},
		});
	}); */
	$("body").on("click",".pagination li a",function(){
		var url = $(this).attr("href");
		var datas = $("#position-select").serialize();
		$(this).attr("href","javascript:;");
		$.ajax({
			url : url,
			type : "POST",
			data : datas,
			async: false,
			dataType : "json",
			success : function(data){
				var pageStr = data[0];
				var positions = data[1];
				var html = "";
				if(positions.length > 0) {
					for(var i = 0; i < positions.length; i++) {
						html += "<tr>"
							+"<td class=\"center\">"
								+"<label>"
									+"<input type=\"checkbox\" class=\"ace\" />"
									+"<span class=\"lbl\"></span>"
									/* +"<input type=\"text\" hidden=\"hidden\" value=\""+positions[i].positionid +"\"/>" */
								+"</label>"
							+"</td>"
							+"<td>"+(i + 1)+"</td>"
							+"<td>"+positions[i].positionname +"</td>"
							+"<td>"+positions[i].positioncoordinate +"</td>"
							+"<td>"+positions[i].positionTypeInfo.positiontypename +"</td>"
							+"<td>"+positions[i].basicSportType.sporttypename +"</td>"
							+"<td>"+positions[i].positiondescribe+"</td>"
							+"<td>"+positions[i].positiontime+"</td>"
							+"<td>"
								+"<div class='visible-md visible-lg hidden-sm hidden-xs action-buttons'>"
									+"<a class='blue' href='admin/position-view?positionid="+positions[i].positionid +"&positiontypeid="+positions[i].positionTypeInfo.positiontypeid +"&sporttypeid="+positions[i].basicSportType.sporttypeid +"'>"
										+"<i class=\"icon-search bigger-130\"></i> 详情"
								    +"</a>"
								    +"<a class=\"green\" href=\"admin/position?positionid="+positions[i].positionid +"&positiontypeid="+positions[i].positionTypeInfo.positiontypeid +"&sporttypeid="+positions[i].basicSportType.sporttypeid +"\">"
							         	+"<i class=\"icon-pencil bigger-130\"></i> 编辑"
								     +"</a>"
								     +" <a class=\"red\" href=\"admin/position-del?positionid="+positions[i].positionid +"&positionpicture="+positions[i].positionpicture +"\" class=\"delete_a\">"
								         +"<i class=\"icon-trash bigger-130\"></i> 删除"
									 +"</a>"
								+"</div>"
							+"</td>"
						+"</tr>";
					}
				} else {
					html += "<tr><td colspan=\"9\" align=\"center\">对不起，暂无数据！</td></tr>";
				}
				
				$("#sample-table-2 tbody").empty().append(html);
				$(".pagination li").detach();
				//$(".pagination").empty().append(pageStr);
				$(".pagination").append(pageStr);
			},
		});
	});
	
</script>
</body>
</html>