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
<link rel="stylesheet" href="css/xinjianusers.css" />
<title>文件收集管理</title>
</head>

<body style="background: #ececec">
	<div class="pet_mian">
		<div class="pet_head">
			<header data-am-widget="header"
				class="am-header am-header-default pet_head_block">
			<div class="am-header-left am-header-nav ">
				<a href="gotoGuanliuser" class="am-icon-chevron-left"></a>
			</div>
			<div class="pet_news_list_tag_name">名单管理</div>

			</header>
		</div>

		<div class="pet_circle_nav" align="center">
			<p>
				<input type="text" class="am-form-field am-radius"
					placeholder="输入分组名称" />
			</p>
		</div>

		<div class="pet_content pet_content_list pet_hd">
			<div class="pet_article_like">
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">名单列表</div>
					<div class="am-panel-bd">
						<ul class="am-list am-list-static am-list-border" id='user_list'>

						</ul>
						<div class="am-u-sm-6 xinjianuser-button">
							<button onclick="addUser()" type="button"
								class="am-btn am-btn-primary am-btn-block">添加名单</button>
						</div>
						<div class="am-u-sm-6 xinjianuser-button">
							<button type="button" class="am-btn am-btn-success am-btn-block">完成</button>
						</div>

					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">添加名单</div>
			<div class="am-modal-bd">
				<p>
					<input type="text" class="am-form-field am-radius"
						placeholder="输入姓名" id='add_user_name' />
				</p>
				<p>
					<input type="text" class="am-form-field am-radius"
						placeholder="输入编号[如学号]" id='add_user_id' />
				</p>
			</div>

			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>

	<div class="am-modal am-modal-confirm" tabindex="-1"
		id="my-confirm-change">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">添加名单</div>
			<div class="am-modal-bd">
				<p>
					<input type="text" class="am-form-field am-radius"
						placeholder="输入姓名" id='change_user_name' />
				</p>
				<p>
					<input type="text" class="am-form-field am-radius"
						placeholder="输入编号[如学号]" id='change_user_id' />
				</p>
			</div>

			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>

	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm1">
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
				<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script type="text/javascript">
		var userlist = new Array();
		$(function() {
			$('#doc-modal-list').find('.am-icon-close').add(
					'#doc-confirm-toggle-change').on('click', function() {
				$('#my-confirm').modal({
					relatedTarget : this,
					onConfirm : function(options) {
					},
					onCancel : function() {
					}
				});
			});
		});

		function addUser() {
			$('#my-confirm').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					var user = new Object();
					for (var i = 0; i < userlist.length; i++) {
						if ($('#add_user_id').val() == userlist[i].id) {
							showDialog("用户编号已存在！");
							return;
						}
					}
					user.id = $('#add_user_id').val();
					user.name = $('#add_user_name').val();
					userlist[userlist.length] = user;
					$('#add_user_id').val('');
					$('#add_user_name').val('');
					showList();
				},
				onCancel : function() {
				}
			});
		}

		function showList() {
			$("#user_list").html("");
			for (var i = 0; i < userlist.length; i++) {
				var text = '<li><span class="am-badge am-badge-success" onclick="change('
						+ i
						+ ')">修改</span> <span onclick="shanchu('
						+ i
						+ ')" class="am-badge am-badge-danger" >删除</span><a href="#">'
						+ userlist[i].name + '</a></li>';

				$("#user_list").append(text);
			}
		}

		function shanchu(num) {
			$("#cz-name").html("删除编号：" + userlist[num].id);
			$('#my-confirm1').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					userlist.splice(num, 1);
					showList();
				},
				onCancel : function() {
				}
			});
		};

		function change(num) {
			$('#change_user_id').val(userlist[num].id);
			$('#change_user_name').val(userlist[num].name);
			$('#my-confirm-change').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					alert(num);
					var id =  userlist[num].id;
					//alert(userlist[num].id + " " + $('#change_user_id').val());
					if (id != $('#change_user_id').val()) {
						for (var i = 0; i < userlist.length; i++) {
							if ($('#change_user_id').val() == userlist[i].id) {
								showDialog("用户编号已存在！");
								return;
							}
						}
					}
					userlist[num].id = $('#change_user_id').val();
					userlist[num].name = $('#change_user_name').val();
					showList();
				},
				onCancel : function() {
				}
			});
		};
		
		

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