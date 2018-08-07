<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>提交文件</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" href="admin/layui/css/layui.css" media="all">
</head>

<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<blockquote class="layui-elem-quote layui-text">
			注意：如发现文档需要改动，直接上传新文件覆盖即可</blockquote>

		<form class="layui-form" action="" lay-filter="example">
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 40px;">学号</label>
				<div class="layui-input-block"
					style="margin-left: 70px; margin-right: 10px;">
					<input type="text" id="stu_id" lay-verify="stu_id"
						autocomplete="off" placeholder="请输入学号" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 40px;">姓名</label>
				<div class="layui-input-block"
					style="margin-left: 70px; margin-right: 10px;">
					<input type="text" id="name" placeholder="请输入姓名"
						lay-verify="name" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label" style="width: 40px;">公开</label>
				<div class="layui-input-inline"
					style="margin-left: 70px; margin-right: 10px;">
					<input type="checkbox" id="open" lay-skin="switch"
						lay-text="是|否" checked="checked">
					<div class="layui-form-mid layui-word-aux">允许其他人查看</div>
				</div>
			</div>
			<div class="layui-upload" style="margin-left: 25px;"
				id='layui-upload'>
				<button type="button" class="layui-btn layui-btn-normal"
					id="getfiled">选择文件</button>
			</div>
			<div class="layui-footer" id="footer1"
				style="left: 0px; background-color: rgba(238, 238, 238, 0); bottom: 5px;"
				align="center">
				<div class="layui-form-item">
					<div class="layui-input-block" style="margin: 5px;">
						<button class="layui-btn layui-btn-fluid" lay-submit=""
							lay-filter="demo1">立即提交</button>
					</div>
				</div>
			</div>


		</form>


	</div>
	<script src="admin/layui/layui.js" charset="utf-8"></script>
	<script>
		layui
				.use(
						[ 'form', 'layedit', 'laydate', 'upload', "jquery" ],
						function() {
							var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate, upload = layui.upload;
							//自定义验证规则
							var $ = layui.jquery;
							var open="不公开";
							var choosefile = false;
							form.verify({
								stu_id : function(value) {
									if (value.length < 12) {
										return '学号至少得12个字符';
									}
								},
								name : function(value) {
									if (value.length == '') {
										return '姓名不能为空';
									}
								},
								content : function(value) {
									layedit.sync(editIndex);
								}
							});

							//监听提交
							form.on('submit(demo1)', function(data) {
								if (!choosefile) {
									layer.msg("请选择文件");
								} else {
									$.ajax({
										type : "post",
										url : "login?stu_id="+$('#stu_id').val()+"&name="+$('#name').val()+"&type=login",
										async : false,
										success : function(data) {
											jsonData = JSON.parse(data);
											if(jsonData.code=='101'){
												layer.msg("姓名于学号不匹配");
											}else{
												if($('#open').is(':checked')){
													open="公开";
												}else{
													open="不公开";
												}
												uploadInst.config.url="upload?stu_id="+$('#stu_id').val()+"&name="+$('#name').val()+"&open="+open;
												console.log(uploadInst);
												layer.load();
												uploadInst.upload(); 
											}
										},
										error : function(jqObj) {
											layer
													.open({
														title : '连接失败！',
														content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
													});
										}
									});
								}
								return false;
							});

							//选完文件后不自动上传
							var uploadInst = upload.render({
								elem : '#getfiled',
								url : 'upload',
								auto : false,
								accept : 'file' //普通文件
								,
								exts : 'doc|docx' //只允许上传压缩文件
								,
								done : function(res) {
									layer.closeAll('loading'); //关闭loading
									if(res.code == 0){
								        return layer.msg('已完成', {
								        	  icon: 1,
								        	  time: 2000 //2秒关闭（如果不配置，默认是3秒）
								        	}, function(){
								        	  window.location.href="gotoIndex";
								        	}); ;
								      }else{
								    	return layer.msg('文件有误');
								      }
									
								},
								error : function(index, upload) {
									layer.closeAll('loading'); //关闭loading
									 return layer.msg('上传失败');
									
								},
								choose : function(obj) {
									
									obj
											.preview(function(index, file,
													result) {
												choosefile = true;
												$('#layui-upload').append(
														'<div class="layui-form-mid layui-word-aux">'
																+ file.name
																+ '</div>');
											});
								}
							});

						});
	</script>

</body>

</html>