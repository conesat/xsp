<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link rel="stylesheet" href="css/amazeui.min.css">
		<link rel="stylesheet" href="css/wap.css">
		<link rel="stylesheet" href="css/index.css" />
		<link rel="stylesheet" href="css/guanliuser.css" />
		<title>文件收集管理</title>
	</head>

	<body style="background:#ececec">
		<div class="pet_mian">
			<div class="pet_head">
				<header data-am-widget="header" class="am-header am-header-default pet_head_block">
					<div class="am-header-left am-header-nav ">
						<a href="gotoIndex" class="am-icon-chevron-left"></a>
					</div>
					<div class="pet_news_list_tag_name">收集页</div>

				</header>
			</div>

		</div>
		<div class="am-panel am-panel-default xinjian-panel">
			<div class="am-panel-hd">收集码：3421</div>
			<div class="am-panel-bd">
				<button class="am-btn am-btn-default am-btn-block" disabled="disabled" style="margin-bottom: 10px;">
					收集进行中 0天3小时后截止
				</button>
				<form class="am-form am-form-horizontal">
					<div class="am-form-group am-form-group-sm">
						<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">标题</label>
						<div class="am-u-sm-10 sjxx-label">
							标题
						</div>
					</div>
					<div class="am-form-group am-form-group-sm">
						<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">内容</label>
						<div class="am-u-sm-10 sjxx-label">
							奥术大师多Asdasd大声道阿萨德内容
						</div>
					</div>
					<div class="am-form-group am-form-group-sm">
						<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">姓名</label>
						<div class="am-u-sm-10">
							<input type="text" id="doc-ipt-3-1" class="am-form-field" placeholder="输入姓名">
						</div>
					</div>
					<div class="am-form-group am-form-group-sm">
						<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">编号</label>
						<div class="am-u-sm-10">
							<input type="text" id="doc-ipt-3-1" class="am-form-field" placeholder="输入编号">
						</div>
					</div>
					<div class="am-form-group am-form-group-sm">
						<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">附件</label>
						<div class="am-u-sm-10">
							<div class="am-form-group">
								<div class="am-form-group am-form-file">
									<button type="button" class="am-btn am-btn-default am-btn-sm">
    <i class="am-icon-cloud-upload"></i> 选择要上传的文件</button>
									<input id="doc-form-file" type="file" multiple>
								</div>
								<div id="file-list"></div>
							</div>
						</div>
					</div>

					<div class="am-form-group">
						<div class="am-u-sm-10 am-u-sm-offset-2">
							<button type="submit" class="am-btn am-btn-default">提交</button>
						</div>
					</div>
				</form>
			</div>

		</div>
		<div class="pet_article_footer_info">Copyright(c)2018 hg All Rights Reserved </div>
		<script src="js/jquery.min.js"></script>
		<script src="js/amazeui.min.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#doc-form-file').on('change', function() {
					var fileNames = '';
					$.each(this.files, function() {
						fileNames += '<span class="am-badge">' + this.name + '</span> ';
					});
					$('#file-list').html(fileNames);
				});
			});
		</script>
	</body>

</html>