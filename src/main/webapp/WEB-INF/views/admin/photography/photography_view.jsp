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
    <meta charset="utf-8" />
    <base href="<%=basePath%>">
    <title>摄影详情</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- basic styles -->
    <link href="resources/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="resources/assets/css/font-awesome.min.css" />

    <!--[if IE 7]>
    <link rel="stylesheet" href="resources/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->

    <!-- page specific plugin styles -->

    <!-- fonts -->

    <link rel="stylesheet" href="resources/js/extra/css.css" />

    <!-- ace styles -->

    <link rel="stylesheet" href="resources/assets/css/ace.min.css" />
    <link rel="stylesheet" href="resources/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="resources/assets/css/ace-skins.min.css" />

    <link rel="stylesheet" href="resources/css/sport_zixun.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="resources/assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- inline styles related to this page -->

    <!-- ace settings handler -->

    <script src="resources/assets/js/ace-extra.min.js"></script>

    <script src="resources/js/sport_zixun.js"></script>
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
                <i class="icon-camera-retro"></i>
                <a href="#">摄影管理</a>
            </li>
            <li class="active">摄影详情</li>
        </ul><!-- .breadcrumb -->

    </div>

    <div class="page-content">
        <div class="page-header">
            <h1>
                摄影详情
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

                        <form>
                           <input type="text" name="pictureid" style="display:none" value="${photophotography.pictureid }">
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">一级类目</label>
                                        <div class="col-sm-8">
                                              <select class="form-control" name="styletypeid">
                                              	<option >${photophotography.basicPhotoStyle.photostylename }</option>
                                              </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">二级类目</label>

                                        <div class="col-sm-8">
                                            <!--<input type="text" id="form-field-1" placeholder="Username" class="form-control">-->
                                             <select class="form-control" name="sporttypeid">
                                             	<option >${photophotography.basicSportType.sporttypename }</option>          	
                                             </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">照片参数</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="photoparam"  placeholder="photoparams" class="form-control" disabled="disabled" value=${photophotography.photoparam }>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作品名称</label>
                                        <div class="col-sm-9">
                                           <input type="text" id="form-field-1" name="title" placeholder="tilte" class="form-control" disabled="disabled" value="${photophotography.title }">	
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作者</label>
                                        <div class="col-sm-9">
                                        	<input type="text" id="form-field-1" name="author" placeholder="author" class="form-control" disabled="disabled" value="${photophotography.author }" >    	
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作品来源</label>
                                        <div class="col-sm-9">
                                        	<input type="text" id="form-field-1" name="origin" placeholder="origin" class="form-control" disabled="disabled" value="${photophotography.origin }">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">昨日点赞数</label>

                                        <div class="col-sm-9">
                                        	<input type="text" id="form-field-1" name="currentliketimes" placeholder="currentliketimes" class="form-control" disabled="disabled" value="${photophotography.currentliketimes }">  
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">总点赞数</label>

                                        <div class="col-sm-9">
                                              
                                                    		<input type="text" id="form-field-1" name="totalliketimes" placeholder="totalliketimes" class="form-control" disabled="disabled" value="${photophotography.totalliketimes }">
                                                		
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">照片等级</label>
                                        <div class="col-sm-9"> 
                                            <input type="text" id="form-field-1" name="leveltype" placeholder="leveltype" class="form-control" disabled="disabled" value="${photophotography.leveltype }">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">

                            </div>
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">发布时间</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="publishtime" id="form-field-1" placeholder="yyyy-mm-dd" class="form-control"  disabled="disabled" value="${photophotography.publishtime }" oninput="setCustomValidity('')">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">列表图片</label>

                                        <div class="col-sm-9"><c:choose>
                                        		<c:when test="${photophotography.thumbphotography == null }">
                                        			没有图片
                                        		</c:when>
                                        		<c:otherwise>
                                        			<img alt="缩略图" title="缩略图" src="${photophotography.thumbphotography }">
                                        		</c:otherwise>
                                        	</c:choose>
                                            <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
												查看原图
											</button>
											<!-- 模态框（Modal） -->
											<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
												<div class="modal-dialog">
													<div class="modal-content">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
																&times;
															</button>
															<h4 class="modal-title" id="myModalLabel">
																原图
															</h4>
														</div>
														<div class="modal-body">
															<img alt="原图" title="原图" src="${photophotography.photourl }">
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-default" data-dismiss="modal">关闭
															</button>
														</div>
													</div><!-- /.modal-content -->
												</div><!-- /.modal -->
           									</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="form-group">
                                    <label class="col-xs-12 control-label no-padding-right" for="form-field-1">摄影内容</label>
                                    <div class="col-xs-12">
                                        <textarea class="form-control" name="introduction" id="form-field-1" style="margin: 0 auto;" required="required" oninvalid="setCustomValidity('请输入摄影内容')" oninput="setCustomValidity('')">${photophotography.introduction }</textarea>
                                        <p class="help-block text-danger"></p>
                                        <script type="text/javascript">CKEDITOR.replace("financial.bz");</script>
                                    </div>
                                </div>
                            </div>
                            <br />
                        </form>

                    </div><!-- /.col -->
                </div><!-- /.row -->

                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div><!-- /.main-content -->
<jsp:include page="../foot.jsp"/>
</body>
</html>