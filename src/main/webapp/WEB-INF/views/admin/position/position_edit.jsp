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
	<base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>位置编辑</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="resources/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <!-- ace styles -->

    <link rel="stylesheet" href="resources/assets/css/ace.min.css" />
    <link rel="stylesheet" href="resources/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="resources/assets/css/ace-skins.min.css" />

    <link rel="stylesheet" href="resources/css/ostp.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="resources/assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="resources/assets/js/ace-extra.min.js"></script>

    <script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

    <!--[if lt IE 9]>
    <script src="resources/assets/js/html5shiv.js"></script>
    <script src="resources/assets/js/respond.min.js"></script>
    <![endif]-->
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
            <li class="active">位置编辑</li>
        </ul><!-- .breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                位置编辑
                <small>
                    <i class="icon-double-angle-right"></i>
                    查看
                </small>
            </h1>
        </div><!-- /.page-header -->

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

                        <form action="admin/position-update" method="post" enctype="multipart/form-data">
                        	<input type="text" name="positionid" style="display:none" value="${positionDetailInfo.positionid }">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">适宜去的时间</label>

                                        <div class="col-sm-8">
                                            <input type="text" name="positiontime" value="${positionDetailInfo.positiontime }" placeholder="yyyy-MM-dd" onclick="laydate()" class="form-control laydate-icon" required="required" oninvalid="setCustomValidity('请输入适宜去的时间')" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">运动类型</label>

                                        <div class="col-sm-8">
                                            <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
                                            <select class="form-control" name="sporttypeid">
                                                <c:forEach items="${sportType }" var="sportType">
													<c:choose>
														<c:when test="${sportType.SportTypeID eq positionDetailInfo.sporttypeid }">
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
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">位置类型</label>

                                        <div class="col-sm-8">
                                            <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
                                            <select class="form-control" name="positiontypeid">
                                                <c:forEach items="${positionTypes }" var="positionType">
                                               		<c:choose>
														<c:when test="${positionType.PositionTypeID eq positionDetailInfo.positiontypeid }">
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
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">位置名称</label>

                                        <div class="col-sm-8">
                                            <input type="text" name="positionname" value="${positionDetailInfo.positionname }" placeholder="title" class="form-control" required="required" oninvalid="setCustomValidity('请输入位置名称')" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">位置坐标</label>

                                        <div class="col-sm-8">
                                            <input type="text" name="positioncoordinate" value="${positionDetailInfo.positioncoordinate }" placeholder="origin" class="form-control" required="required" oninvalid="setCustomValidity('请输入位置坐标')" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">列表图片</label>
                                        <div class="col-sm-8">
                                        	<c:choose>
                                        		<c:when test="${positionDetailInfo.positionthumbnailpicture == null }">
                                        			没有图片
                                        		</c:when>
                                        		<c:otherwise>
                                        			<img alt="缩略图" title="缩略图" src="${positionDetailInfo.positionthumbnailpicture }">
                                        		</c:otherwise>
                                        	</c:choose>
                                            <input type="file" name="picture" oninvalid="setCustomValidity('请选择相关图片')" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-xs-12 control-label no-padding-right" for="form-field-1">位置详细信息</label>
                                    <div class="col-xs-12">
                                        <textarea class="form-control" id="financial.bz" name="positiondescribe" style="margin: 0 auto;" required="required" oninvalid="setCustomValidity('请输入资讯内容')" oninput="setCustomValidity('')">${positionDetailInfo.positiondescribe }</textarea>
                                        <p class="help-block text-danger"></p>
                                        <script type="text/javascript">CKEDITOR.replace("financial.bz");</script>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-actions">
                                    <div class="col-sm-offset-5 col-md-3">
                                        <input type="submit" class="btn btn-primary" value="完成">
                                        &nbsp; &nbsp; &nbsp;
                                        <button class="btn btn-info" type="reset">
                                            <i class="icon-undo bigger-110"></i>
                                           	 重置
                                        </button>
                                    </div>
                                </div>
                            </div>

                        </form>

                    </div><!-- /.col -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->
<script type="text/javascript" src="resources/js/laydate/laydate.js"></script>
</body>
</html>