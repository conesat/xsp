<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>首页</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="format-detection" content="telephone=no">
<link rel="stylesheet" type="text/css" href="dist/css/barrager.css">
<link rel="stylesheet" href="admin/layui/css/layui.css" media="all">
<style type="text/css">
.layui-layout-admin {
	margin-left: 0px;
	left: 0px;
}

.layui-footer a {
	margin-top: 2px;
	height: 40px;
	margin-bottom: 2px;
}
</style>
</head>

<body class="layui-layout-body" style="overflow: auto;">
	<div class="layui-layout layui-layout-admin">
		<blockquote class="layui-elem-quote layui-text">
			致我们的同学：我们都即将离开这个学校，你是否有一句话想对ta说，是否有个问题想问ta，即使ta不在这个学校。如果有一次机会让你说出来，你会想说什么。<br>你可以大胆发上来，我们除了这句话，不会记录额外信息<br>power
			by：<a href="http://www.chinahg.top" target="_blank">红格互联</a><br>回首页：<a
				href="gotoIndex" target="_blank">点击返回</a><br>普通：<a
				href="XLH" target="_blank">点击进入</a>
		</blockquote>
		<hr style="background: #ffffff;">
		<div id='all' style="display: block;padding-bottom: 85px;">
			<c:forEach items="${list}" var="list" varStatus="status">
				<div
					style="margin-bottom: 5px; background-color: #f2f2f2; padding: 5px; height: 20px;">
					<div
						style="width: 100%; float: left; line-height: 20px; color: #009688;">${list}</div>

				</div>
			</c:forEach>
		</div>

		<div class="layui-footer" id="footer1"
			style="left: 0px; background-color: rgba(238, 238, 238, 0); bottom: 3px; height: auto;"
			align="center">
			<div class="layui-btn-group" style="width: 100%">
				<button class="layui-btn" id="sendmsg">提交心里话</button>
				<button class="layui-btn" id="getmsg">随机选取一个</button>
				<button class="layui-btn" id="showall">隐藏全部</button>
				<button class="layui-btn" id="stop">停止弹幕</button>
				<button class="layui-btn" id="reset">重置</button>
				<button class="layui-btn" id="res">刷新新问题</button>
			</div>

		</div>
	</div>
	<script src="admin/layui/layui.all.js" charset="utf-8"></script>
	<script type="text/javascript" src="dist/js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="dist/js/jquery.barrager.min.js"></script>
	<script>
		//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
		layui.use([ 'element', "jquery" ], function() {
			var element = layui.element;
			var $ = layui.jquery;
			
			$('#sendmsg').click(function() {
				//例子1
				layer.prompt({
					title : '请输入',
					formType : 0
				}, function(value, index, elem) {
					layer.close(index);
					if (value == '') {
						layer.msg("输入不能为空");
					} else {
						window.location.href = "addmsg?msg=" + value;
					}
				});
			});

			$('#getmsg').click(function() {
				if(!show){
					var sp = parseInt(Math.random() * array.length);
					//layer.alert(array[sp]);
					msg=array[sp];
					$('#getmsg').html('查看结果');
					show=true;
					$.ajax({
						type : "post",
						url : "setMSG?msg="+msg,
						async : true,
						success : function(data) {
							jsonData = JSON.parse(data);
						}
					});
				}else{
					layer.alert(msg);
				}
				
			});

			$('#showall').click(function() {
				if ($('#all').css('display') == 'none') {
					$('#showall').html('隐藏全部');
					$("#all").attr("style", "display:block;");
				} else {
					$('#showall').html('查看全部');
					$("#all").attr("style", "display:none;");
				}
			});

			$('#stop').click(function() {
				if (stop) {
					window.location.reload();
				} else {
					stop = true;
					$('#stop').html('启用弹幕');
				}
			});
			
			$('#res').click(function() {
				window.location.reload();
			});
			
			$('#reset').click(function() {
				if (show) {
					//例子1
					layer.prompt({
						title : '请输入密码',
						formType : 1
					}, function(value, index, elem) {
						layer.close(index);
						if (value == '8350') {
							$.ajax({
								type : "get",
								url : "resetMSG",
								async : true,
								success : function(data) {
									jsonData = JSON.parse(data);
									if(jsonData.code=='1'){
										layer.msg("完成");
									}
								}
							});
						} else {
							layer.msg("错误密码");
						}
					});
					
				} else {
					layer.msg("不需要重置");
				}
			});

		});
	</script>
	<script type="text/javascript">
		var array = new Array();
		var stop = false;
		var show=false;
		var msg='';
		var i = 0;
		<c:forEach items="${list}" var="list">
		array.push("${list}");
		</c:forEach>
		var interval = setInterval(function() {
			var sp = parseInt(Math.random() * 7) + 5;
			var item = {
				img : 'admin/img/icon.png', //图片 
				info : array[i], //文字 
				href : '', //链接 
				close : true, //显示关闭按钮 
				speed : sp, //延迟,单位秒,默认6 
				color : '#ffffff', //颜色,默认白色 
				old_ie_color : '#ffffff', //ie低版兼容色,不能与网页背景相同,默认黑色 
			}
			$('body').barrager(item);
			if (i < array.length - 1) {
				i++;
			} else {
				i = 0;
			}
			if (stop) {
				clearInterval(interval);
			}
		}, 2500);
		
		var isget=false;
		var interval2 = setInterval(function() {
			if (!isget) {
				$.ajax({
					type : "get",
					url : "selectMSG",
					async : true,
					success : function(data) {
						jsonData = JSON.parse(data);
						if(jsonData.code=='1'){
							msg=jsonData.msg;
							layer.alert(msg);
							$('#getmsg').html('查看结果');
							show=true;
							isget=true;
						}
					}
				});
			}else{
				$.ajax({
					type : "get",
					url : "selectMSG",
					async : true,
					success : function(data) {
						jsonData = JSON.parse(data);
						if(jsonData.code=='0'){
							isget=false;
							$('#getmsg').html('随机选取一个');
							show=false;
						}
					}
				});
			}
		}, 1000);
	</script>
</body>

</html>