<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>文件收集管理</title>
</head>

<body style="background: #ececec">
	<div class="pet_mian">
		<div class="pet_head">
			<header data-am-widget="header"
				class="am-header am-header-default pet_head_block">
			<div class="am-header-left am-header-nav ">
				<a href="gotoShouji" class="am-icon-chevron-left"></a>
			</div>
			<div class="pet_news_list_tag_name">名单管理</div>

			</header>
		</div>

		<div class="pet_circle_nav">
			<ul class="pet_circle_nav_list">
				<li><a href="gotoXinjianusers"
					class="  pet_nav_xinxianshi icon-fabu"></a><span>新建名单组</span></li>
			</ul>
		</div>

		<div class="pet_content pet_content_list pet_hd">
			<div class="pet_article_like">
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">名单组列表</div>
					<div class="am-panel-bd">
						<ul class="am-list am-list-static am-list-border">
							<c:forEach items="${names}" var="name" varStatus="status">
								<li><span class="am-badge am-badge-success"><a
										href="gotoXinjianusers?name=${name}" style="color: #ffffff;">编辑</a></span>
									<span class="am-badge am-badge-danger"
									onclick="shanchu('${name}')">删除</span> <a
									href="gotoXinjianusers?name=${name}"> ${name}</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div id="cz-name" class="am-modal-hd"></div>
			<div class="am-modal-bd">
				<p>删除后无法恢复是否继续？</p>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
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
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script type="text/javascript">
		function shanchu(name) {
			$("#cz-name").html("删除：" + name);
			$('#my-confirm').modal({
				relatedTarget : this,
				onConfirm : function(options) {

					$.ajax({
						type : "post",
						url : "deleteName?name=" + name,
						async : false,
						success : function(data) {
							jsonData = JSON.parse(data);
							if (jsonData.code == '100') {
								showGotoDialog("已完成", "gotoGuanliuser");
							} else if (jsonData.code == '101') {
								showGotoDialog("请先登录", "gotoLogin");
							}
						},
						error : function(jqObj) {

						}
					});
				},
				onCancel : function() {
				}
			});
		};

		function showGotoDialog(msg, url) {
			$('#dialog_title').html(msg);
			$('#my-confirm-show').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					window.location.href = url;
				},
				onCancel : function() {
					return true;
				}
			});
		}
	</script>
</body>

</html>