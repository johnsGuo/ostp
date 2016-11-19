<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
		<title>资讯</title>
		
		<jsp:include page="../head.jsp"></jsp:include>
	</head>
	
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="resources/ckfinder/ckfinder.js"></script>
	<body>
		<!--将这一部分1转化成ifream-->
		<div class="main-content" style="margin-left: 0px;margin-bottom: 0px;">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
					try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
				</script>

				<ul class="breadcrumb">
					<li>
						<i class="icon-dashboard"></i>
						<a href="admin/equip-list">装备列表</a>
					</li>
					<li class="active">装备详情</li>
				</ul><!-- .breadcrumb -->
				
			</div>

			<div class="page-content">
				<div class="page-header">
					<h1>
						装备详情
						<small>
							<i class="icon-double-angle-right"></i>
							 查看
						</small>
					</h1>
				</div><!-- /.page-header -->

				<div class="row">
					<div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								
								
									<div class="row">
										
										<div class="col-sm-4">
											
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备ID</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.equipid}</label>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备名称</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.equipname}</label>
												
											</div>
										</div>
										
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备价格</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.equipprice}</label>
												
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备参数</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.equipparam}</label>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否推荐</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
													<c:if test="${equip.equiprecommend == 1}">推荐</c:if>
													<c:if test="${equip.equiprecommend == 0}">不推荐</c:if>
												</label>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">运动类型</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.sporttypeid}</label>
				
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">装备类型</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.equiptypeid}</label>
		
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">是否可用</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
													<c:if test="${equip.enabled == '1'}">可用</c:if>
													<c:if test="${equip.enabled == '0'}">不可用</c:if>
												</label>
												
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">创建时间</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
												
													<fmt:formatDate value='${equip.createdate}' pattern='yyyy-MM-dd'/>	
												</label>
												
											</div>
										</div>
									</div>
									<br />
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">创建者</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.createby}</label>	
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">更新时间</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">
													<fmt:formatDate value='${equip.updatedate}' pattern='yyyy-MM-dd'/>
												</label>		
											</div>
										</div>
										<br />
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">更新者</label>
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">${equip.updateby}</label>
												
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label class="col-sm-3 control-label no-padding-right" for="form-field-1">图片</label>
												<img style="width:80px;height:80px" alt="图片" src="${equip.equipimage}">
											</div>
										</div>
										
										
									</div>
									<br>
									<div class="row">
										<div class="form-group">
											<label class="col-xs-12 control-label no-padding-right" for="form-field-1">备注</label>
											<div class="col-xs-12">
												<textarea rows="10" cols="60" id="editor"oninvalid="setCustomValidity('请输入教程内容')"
													oninput="setCustomValidity('')" class="ckeditor">
													${equip.note}
												</textarea>
										
												<p class="help-block text-danger"></p>
											</div>
										</div>
									</div>
									<br />
									
								
								
							</div><!-- /.col -->
						</div><!-- /.row -->
					
						<!-- PAGE CONTENT ENDS -->
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.page-content -->
		</div><!-- /.main-content -->
				
		<jsp:include page="../foot.jsp"></jsp:include>
		
</body>
</html>
