<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/layui/css/layui.css"  media="all">
    <script src="<%=request.getContextPath()%>/js/jquery-1.11.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/layui/layui.js" charset="utf-8"></script>

    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<span class="layui-breadcrumb">

  <a href="<%=request.getContextPath()%>/admin/courselist.html">课程管理</a>
    <c:choose>
        <c:when test="${!empty course}">
            <a><cite>更新课程</cite></a>
        </c:when>
        <c:otherwise>
            <a><cite>添加课程</cite></a>
        </c:otherwise>
    </c:choose>
</span>
<form class="layui-form" action="<%=request.getContextPath()%>/admin/addorupdate.html" method="post">
    <input type="hidden" name="cid" value="${course.cid}">
    <div class="layui-form-item">
        <label class="layui-form-label">课程名称</label>
        <div class="layui-input-inline">
            <input type="text" name="cname" lay-verify="required" autocomplete="off" class="layui-input" value="${course.cname}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课时</label>
        <div class="layui-input-inline">
            <input type="text" name="ctime" lay-verify="required|number" autocomplete="off" class="layui-input" value="${course.ctime}">
        </div>
        <label class="layui-form-label">价格</label>
        <div class="layui-input-inline">
            <input type="text" name="cprice" lay-verify="required|number" autocomplete="off" class="layui-input" value="${course.cprice}">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">教练</label>
        <div class="layui-input-inline">
            <select name="trainerId" lay-verify="required">
                <option value="-1">无</option>
                <c:forEach items="${trainers}" var="trainer">
                    <option value="${trainer.eid}" <c:if test="${course.trainerId==trainer.eid}"> selected</c:if>>${trainer.ename}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程类型</label>
        <div class="layui-input-inline">
            <select name="ccateId" lay-verify="required">
                <c:forEach items="${coursecategories}" var="category">
                    <option value="${category.cateId}" <c:if test="${course.ccateId==category.cateId}">selected </c:if>>${category.cateName}</option>
                </c:forEach>
            </select>
        </div>
        <label class="layui-form-label">课程功能</label>
        <div class="layui-input-inline">
            <select name="cfunctionId" lay-verify="required">
                <c:forEach items="${coursefunctions}" var="coursefunction">
                    <option value="${coursefunction.fid}" <c:if test="${course.cfunctionId==coursefunction.fid}">selected </c:if>>${coursefunction.fname}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">课程图片</label>
        <div class="layui-input-inline">
            <div class="layui-upload">
                <input type="hidden" name="cpic" id="cpic" value="${course.cpic}">
                <button type="button" class="layui-btn" id="test1">上传图片</button>
                <div class="layui-upload-list">
                    <img class="layui-upload-img"  id="demo1" src="${course.cpic}">
                    <p id="demoText"></p>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">课程描述</label>
        <div class="layui-input-block">
            <textarea name="cdesc"id="cdesc" placeholder="请输入内容" class="layui-textarea">${course.cdesc}</textarea>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
            <button type="reset" class="layui-btn layui-btn-primary">取消</button>
        </div>
    </div>
</form>

<script>
    layui.use(['form','element','upload'], function(){
        var form = layui.form
            ,element = layui.element//导航的hover效果、二级菜单等功能，需要依赖element模块
            ,$ = layui.jquery
            ,upload = layui.upload;

        //监听提交
        form.on('submit(formDemo)', function(data){
//            layer.msg(JSON.stringify(data.field));
//            return false;
        });
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
        //普通图片上传
        var uploadInst = upload.render({
            elem: '#test1'
            , url: '<%=request.getContextPath()%>/admin/upload.html'
            , before: function (obj) {
                //预读本地文件示例，不支持ie8
                obj.preview(function (index, file, result) {
                    $('#demo1').attr("width","50px");
                    $('#demo1').attr("height","50px");
                    $('#demo1').attr('src', result); //图片链接（base64）
                });
            }
            , done: function (res) {
                //如果上传失败
                if (res.code > 0) {
                    return layer.msg('上传失败');
                }else {//上传成功
                    $('#cpic').val("http://localhost:8080/SternGym/sterngymimages/"+res.data.src);
                    layer.msg('上传成功',{icon:6});
                }
            }
            , error: function () {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
        });
    });
</script>
</body>
</html>
