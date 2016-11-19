<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <base href="<%=basePath%>">
    <title>摄影添加</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <jsp:include page="../head.jsp"/>
</head>
<body>
	<div class="main-content" style="margin-left: 0; margin-bottom: 0;">
		<div class="breadcrumbs" id="breadcrumbs">
			<script type="text/javascript">
            try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
        </script>

			<ul class="breadcrumb">
				<li><i class="icon-camera-retro"></i> <a href="#">摄影管理</a></li>
				<li class="active">摄影添加</li>
			</ul>
			<!-- .breadcrumb -->

		</div>

		<div class="page-content">
			<div class="page-header">
				<h1>
					摄影添加 <small> <i class="icon-double-angle-right"></i> 查看
					</small>
				</h1>
			</div>
			<!-- /.page-header -->

			<div class="row">
				<div class="col-xs-12">
					<!-- PAGE CONTENT BEGINS -->

					<!--<div class="alert alert-block alert-success">
                    <button type="button" class="close" data-dismiss="alert">
                        <i class="icon-remove"></i>
                    </button>

                    <i class="icon-ok green"></i>

                    欢迎进入
                    <strong class="green">
                        OSTP后台管理系统
                        <small>(v1.0)</small>
                    </strong>
                </div>-->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<form action="admin/photography-insert" method="POST"
								enctype="multipart/form-data">
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-4 control-label no-padding-right"
												for="form-field-1">一级类目</label>

											<div class="col-sm-8">
												<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<select class="form-control" name="styletypeid">
													<c:forEach items="${photoStyle }" var="photoStyle">
														<option value="${photoStyle.PhotoStyleID }">${photoStyle.PhotoStyleName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-4 control-label no-padding-right"
												for="form-field-1">二级类目</label>

											<div class="col-sm-8">
												<!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
												<select class="form-control" name="sporttypeid">
													<c:forEach items="${sportType }" var="sportType">
														<option value="${sportType.SportTypeID }">${sportType.SportTypeName }</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">照片参数</label>

											<div class="col-sm-9">
												<input type="text" name="photoparam" id="form-field-1"
													placeholder="photoparams" class="form-control"
													required="required"
			
													oninvalid="setCustomValidity('请输入照片参数')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作品名称</label>

											<div class="col-sm-9">
												<input type="text" name="title" id="form-field-1"
													placeholder="title" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入作品名称')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作者</label>

											<div class="col-sm-9">
												<input type="text" name="author" id="form-field-1"
													placeholder="autor" class="form-control"
													required="required" oninvalid="setCustomValidity('请输入作者')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">作品来源</label>

											<div class="col-sm-9">
												<input type="text" name="origin" id="form-field-1"
													placeholder="origin" class="form-control"
													required="required"
													oninvalid="setCustomValidity('请输入作品来源')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">昨日点赞数</label>

											<div class="col-sm-9">
												<input type="text" name="currentliketimes" id="form-field-1"
													placeholder="currentliketimes" class="form-control"
													required="required"
													pattern="^[0-9]*[1-9][0-9]*$"
													oninvalid="setCustomValidity('请输入昨日点赞数(整数)')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">总点赞数</label>

											<div class="col-sm-9">
												<input type="text" name="totalliketimes" id="form-field-1"
													placeholder="totalliketimes" class="form-control"
													required="required"
													pattern="^[0-9]*[1-9][0-9]*$"
													oninvalid="setCustomValidity('请输入总点赞数(整数)')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">照片等级</label>

											<div class="col-sm-9">
												<input type="text" name="leveltype" id="form-field-1"
													placeholder="leveltype" class="form-control"
													oninvalid="setCustomValidity('请输入照片等级(整数)')"
													oninput="setCustomValidity('')"
													required="required">
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row"></div>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">发布时间</label>

											<div class="col-sm-9">
												<input type="text" name="publishtime" id="form-field-1"
													placeholder="yyyy-mm-dd"
													onclick="laydate({istime: false, format: 'YYYY-MM-DD'})"
													class="form-control date-picker date_calendar"
													required="required"
													oninvalid="setCustomValidity('请输入发布时间')"
													oninput="setCustomValidity('')">
											</div>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label class="col-sm-3 control-label no-padding-right"
												for="form-field-1">列表图片</label>

											<div class="col-sm-9">
												<input type="file" name="picture"
													oninvalid="setCustomValidity('请选择相关图片')"
													oninput="setCustomValidity('')"
													required="required"
													>
											</div>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="form-group">
										<label class="col-xs-12 control-label no-padding-right"
											for="form-field-1">摄影内容</label>
										<div class="col-xs-12">
											<textarea class="form-control" name="introduction"
												id="form-field-1" style="margin: 0 auto;"
												required="required" oninvalid="setCustomValidity('请输入摄影内容')"
												oninput="setCustomValidity('')">摄影内容</textarea>
											<p class="help-block text-danger"></p>
											<script type="text/javascript">CKEDITOR.replace("financial.bz");</script>
										</div>
									</div>
								</div>
								<br />
								<div class="row">
									<div class="form-actions">
										<div class="col-sm-offset-5 col-md-3">
											<button class="btn btn-primary" type="submit">
												<i class="icon-ok bigger-110"></i> 添加
											</button>

											&nbsp; &nbsp; &nbsp;
											<button class="btn btn-info" type="reset">
												<i class="icon-undo bigger-110"></i> 重置
											</button>
										</div>
									</div>
								</div>

							</form>

						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->

					<!-- PAGE CONTENT ENDS -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.page-content -->
	</div>
	<!-- /.main-content -->
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
	<script type="text/javascript" src="resources/js/laydate/laydate.js"></script>
</body>
</html>