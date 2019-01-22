<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0" />
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="css/amazeui.min.css">
<link rel="stylesheet" href="css/wap.css">
<link rel="stylesheet" href="css/index.css" />
<link rel="stylesheet" href="css/guanliuser.css" />
<title>反馈</title>
</head>

<body style="background: #ececec">
	<div class="pet_mian">
		<div class="pet_head">
			<header data-am-widget="header"
				class="am-header am-header-default pet_head_block">
			<div class="am-header-left am-header-nav ">
				<a href="gotoIndex" class="am-icon-chevron-left"></a>
			</div>
			<div class="pet_news_list_tag_name">反馈意见</div>

			</header>
		</div>

	</div>
	<div class="am-panel am-panel-default xinjian-panel"
		style="background-color: #ececec; border: none; font-size: 1.2em; padding-left: 30px; padding-right: 30px; margin-left: 0; margin-right: 0;">
		你的意见将帮助我们成长_小弟在此谢过<br>作者:别人家的狗 qq:1092501244<br>
		<hr>
		<label for="doc-ta-1">输入意见 300字以内</label><br>
		<div class="am-form-group">
			<textarea class=""
				style="background-color: #f3f3f3; width: 100%; height: 200px;"
				id="msg" maxlength="300"></textarea>
		</div>
		<button type="button" class="am-btn am-btn-primary  am-btn-block"
			id='send'>匿名发送</button>
	</div>

	<div class="am-modal am-modal-confirm" tabindex="-1"
		id="my-confirm-show">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">提示</div>
			<div class="am-modal-bd" id="dialog_title"></div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script type="text/javascript">
		$('#send').on('click', function() {
			if ($('#msg').val() == '') {
				showDialog("请输入意见");
			}
			$.ajax({
				type : "post",
				url : "sendMsg?msg=" + $('#msg').val(),
				async : false,
				success : function(data) {
					showDialog("谢谢您的反馈,我们会尽快处理");
				},
				error : function(jqObj) {
					showDialog("无法连接", "");
				}
			});
		});

		function showDialog(msg) {
			$('#dialog_title').html(msg);
			$('#my-confirm-show').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					return true;
				},
				onCancel : function() {
					return true;
				}
			});
		}
	</script>
</body>

</html>