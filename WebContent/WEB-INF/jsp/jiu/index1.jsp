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
			文件：高校毕业登记表6月19号前提交<br>时间：还有<label id='time' style="color: red;"></label>截止提交<br>power
			by：<a href="http://www.chinahg.top" target="_blank">红格互联</a><br>心里话：<a href="XLH" target="_blank">点击进入</a>
		</blockquote>
		<hr style="background: #ffffff;">
		<div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
			<ul class="layui-tab-title">
				<li class="layui-this">未提交${numno}人</li>
				<li>已提交${numyes}人</li>
				<li>下载文档</li>
			</ul>
			<div class="layui-tab-content" style="margin-bottom: 45px;">
				<div class="layui-tab-item layui-show">
					<div style="margin-bottom: 5px; padding: 5px;">
						<div style="width: 50%; float: left;">&nbsp;&nbsp;姓名</div>
						<div style="width: 50%; float: left; text-align: right;">状态&nbsp;&nbsp;</div>
					</div>
					<hr>
					<c:forEach items="${listno}" var="listno" varStatus="status">
						<div
							style="margin-bottom: 5px; background-color: #f2f2f2; padding: 5px; height: 20px;">
							<div
								style="width: 50%; float: left; line-height: 20px; color: red;">${listno.name}</div>
							<div
								style="width: 50%; float: left; text-align: right; line-height: 20px; color: red;">未提交</div>
						</div>
					</c:forEach>

				</div>
				<div class="layui-tab-item">
					<div style="margin-bottom: 5px; padding: 5px;">
						<div style="width: 40%; float: left;">&nbsp;&nbsp;姓名</div>
						<div style="width: 40%; float: left; text-align: right;">状态&nbsp;&nbsp;</div>
						<div style="width: 20%; float: left; text-align: right;">文件&nbsp;&nbsp;</div>
					</div>
					<hr>
					<c:forEach items="${listyes}" var="listyes" varStatus="status">
						<div
							style="margin-bottom: 5px; background-color: #f2f2f2; padding: 5px; height: 20px;">
							<div
								style="width: 40%; float: left; line-height: 20px; color: #009688;">${listyes.name}</div>
							<div
								style="width: 40%; float: left; text-align: right; line-height: 20px; color: #009688;">已提交</div>
							<div
								style="width: 20%; float: left; text-align: right; line-height: 20px; color: #009688;">
								<button class="layui-btn layui-btn-xs"
									onclick='showDoc("${listyes.open}","${listyes.name}","${listyes.url}")'>查看</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="layui-tab-item" align="center">
					<div class="layui-btn-group">
						<a href="downLoadwd?type=mb" class="layui-btn">下载模板</a>
						<a href="downLoadwd?type=wd" class="layui-btn layui-btn-normal">下载Word</a>
					</div>
				</div>

			</div>
		</div>

		<div class="layui-footer" id="footer1"
			style="left: 0px; background-color: rgba(238, 238, 238, 0); bottom: 3px;"
			align="center">
			<a style="margin: 3px;" id="gotoUpload"
				class="layui-btn layui-btn-fluid">提交文件</a>
		</div>

	</div>
	<script src="admin/layui/layui.all.js" charset="utf-8"></script>
	<script>
		//注意：选项卡 依赖 element 模块，否则无法进行功能性操作
		layui.use([ 'element', "jquery" ], function() {
			var element = layui.element;
			var $ = layui.jquery;
			var d1 = new Date(getNowFormatDate());
			var d2 = new Date('2018-06-19 20:00:00');
			var day,hh;
			day=parseInt((d2 - d1) / 86400000 );
			hh=parseInt((parseInt(d2 - d1) / 86400000 -day)*24);
			$('#time').html(day+"天"+hh+"小时");
			if (day<=0 && hh<=0) {
				layer.open({
					  content: '文件提交已关闭',
					  yes: function(index, layero){
					    //do something
					    window.location.href="http://www.chinahg.top";
					  }
					});    
				
			}
			$('#gotoUpload').click(
					function() {
						if (day<=0 && hh<=0) {
							layer.open({
								  content: '文件提交已关闭',
								  yes: function(index, layero){
								    //do something
								    window.location.href="http://www.chinahg.top";
								  }
								});    
						}else{
							window.location.href="gotoUpload";
						}	
					});
		
			function getNowFormatDate() {
			    var date = new Date();
			    var seperator1 = "-";
			    var seperator2 = ":";
			    var month = date.getMonth() + 1;
			    var strDate = date.getDate();
			    if (month >= 1 && month <= 9) {
			        month = "0" + month;
			    }
			    if (strDate >= 0 && strDate <= 9) {
			        strDate = "0" + strDate;
			    }
			    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
			            + " " + date.getHours() + seperator2 + date.getMinutes()
			            + seperator2 + date.getSeconds();
			    return currentdate;
			}
			
			window.showDoc = function(open,name,url) {
				if (open == '不公开') {
					layer.prompt({
						title : '不公开的文档，需要验证学号',
						formType : 1
					}, function(text, index) {
						layer.close(index);
						$.ajax({
							type : "post",
							url : "login?stu_id="+text+"&name="+name+"&type=getdoc",
							async : true,
							success : function(data) {
								jsonData = JSON.parse(data);
								if(jsonData.code=='101'){
									layer.msg("姓名与学号不匹配");
								}else{
									window.location.href="downLoad?url="+url;
								}
							},
							error : function(jqObj) {
								layer.open({
											title : '连接失败！',
											content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
										});
							}
						});
						
					});
				}else{
					window.location.href="downLoad?url="+url;
				}
			}
		});
	</script>
</body>

</html>