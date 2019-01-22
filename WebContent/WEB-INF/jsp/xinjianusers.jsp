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
				<input type="text" id='add_user_list_name'
					class="am-form-field am-radius" placeholder="输入分组名称"
					value="${name}" />
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
							<button type="button" id="add_user_finish"
								class="am-btn am-btn-success am-btn-block">完成</button>
						</div>
						<button type="button" class="am-btn am-btn-warning am-btn-block"
							onclick="choiceUser()">从现有名单中选择</button>

					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>


	<div class="am-modal am-modal-confirm" tabindex="-1"
		style="height: 60%; top: 20%;" id="my-confirm-choice-has">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">选择群组</div>
			<div class="am-modal-bd"
				style="height: 300px; overflow-x: hidden; overflow-y: scroll; padding-left: 50px; padding-right: 50px;">
				<ul class="am-list" id="ajax_qzs">
				</ul>
			</div>

			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span>
			</div>
		</div>
	</div>


	<div class="am-modal am-modal-confirm" tabindex="-1"
		style="height: 60%; top: 20%;" id="my-confirm-choice-name">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">选择名单</div>
			<h4
				style="padding-left: 60px; padding-right: 60px; padding-top: 0px; padding-bottom: 4px; margin: 0;">
				<label class="am-checkbox"> <input type="checkbox"
					id="choiceall" data-am-ucheck> 全选 
			</h4>
			<div class="am-modal-bd"
				style="height: 300px; overflow-x: hidden; overflow-y: scroll; padding-left: 50px; padding-right: 50px;">
				<div class="am-form-group" id='ajax_names'></div>
			</div>

			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span><span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>

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

	<div class="am-modal am-modal-confirm" tabindex="-1"
		id="my-confirm-shanchu">
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
		var userlist = new Array();
		var change = '${name}';
		var ajaxlist = new Array();
		var names = '${names}';
		var ajaxnames = new Array();
		$(function() {
			$("#choiceall").change(function() {
				var cbx = document.getElementsByName("cbx")
				for (var i = 0; i < cbx.length; i++) {
					cbx[i].checked = $("#choiceall").is(':checked');
				}
			});
			var jsonData = JSON.parse(names);
			for (x in jsonData) {
				var user = new Object();
				user.id = jsonData[x].id;
				user.name = jsonData[x].name;
				userlist[userlist.length] = user;
			}
			showList();

		});
		$('#add_user_finish').on('click', function() {
			$("#add_user_list_name").removeClass("my_border_color_red");
			if ($('#add_user_list_name').val() == '') {
				$("#add_user_list_name").addClass("my_border_color_red");
				showDialog("请填输入群组名！");
			} else if (userlist.length == 0) {
				showDialog("拒绝空的群组！");
			} else {
				$.ajax({
					type : "post",
					url : "addUserList",
					async : false,
					data : {
						name : $("#add_user_list_name").val(),
						userlist : JSON.stringify(userlist),
						change : change
					},
					success : function(data) {
						jsonData = JSON.parse(data);
						if (jsonData.code == '100') {
							showGotoDialog("已完成", "gotoGuanliuser");
						} else if (jsonData.code == '101') {
							showDialog("新建失败");
						} else if (jsonData.code == '102') {
							showGotoDialog("账号已失效，请先登录", "gotoLogin");
						} else if (jsonData.code == '103') {
							showDialog("群组名已存在！");
						}
					},
					error : function(jqObj) {

					}
				});
			}
		});

		function addUser() {
			$('#my-confirm').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					if ($('#add_user_id').val() == '') {
						showDialog("用户编号不能为空！");
					} else if ($('#add_user_name').val() == '') {
						showDialog("用户姓名不能为空！");
					} else {
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
					}
				},
				onCancel : function() {
				}
			});
		}

		function showList() {
			$("#user_list").html("");
			for (var i = 0; i < userlist.length; i++) {
				var text = '<li><span class="am-badge am-badge-success" onclick="changeList('
						+ i
						+ ')">修改</span> <span onclick="shanchu('
						+ i
						+ ')" class="am-badge am-badge-danger" >删除</span><a href="#">'
						+ userlist[i].name + '</a></li>';

				$("#user_list").append(text);
			}
		}

		function choiceUserName(listname) {
			$("#choiceall").attr("checked", false);  
			ajaxnames.splice(0, ajaxnames.length);
			$.ajax({
				type : "post",
				url : "seleteNamesByListName?name=" + listname,
				async : false,
				success : function(data) {
					jsonData = JSON.parse(data);
					if (jsonData.code == '100') {
						for ( var x in jsonData.names) {
							var user = new Object();
							user.id = jsonData.names[x].id;
							user.name = jsonData.names[x].name;
							ajaxnames[x] = user;
						}
						showNames();

					} else if (jsonData.code == '101') {
						showGotoDialog("账号已失效，请先登录", "gotoLogin");
					}
				},
				error : function(jqObj) {
					showGotoDialog("无法连接", "");
				}
			});
		};

		function choiceUser() {
			if (ajaxlist.length == 0) {

				$.ajax({
					type : "post",
					url : "seleteUserList",
					async : false,
					success : function(data) {
						jsonData = JSON.parse(data);

						if (jsonData.code == '100') {
							for ( var x in jsonData.names) {
								ajaxlist[x] = jsonData.names[x];
							}
							showQunZu();
						} else if (jsonData.code == '101') {
							showGotoDialog("账号已失效，请先登录", "gotoLogin");
						}
					},
					error : function(jqObj) {
						showGotoDialog("无法连接", "");
					}
				});
			} else {
				showQunZu();
			}

		};

		//展示群组
		function showQunZu() {
			var text = "";
			for (var i = 0; i < ajaxlist.length; i++) {
				text += '<li onclick="choiceUserName('
						+ "'"
						+ ajaxlist[i]
						+ "'"
						+ ')" style="background: #f8f8f8; padding-top: 5px; padding-bottom: 5px;">'
						+ ajaxlist[i] + '</li>';
			}
			$('#ajax_qzs').html(text);
			$('#my-confirm-choice-has').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					return true;
				},
				onCancel : function() {
					return true;
				}
			});
		}
		//展示用户
		function showNames() {
			var text = "";
			for (var i = 0; i < ajaxnames.length; i++) {
				text += '<label class="am-checkbox"> <input type="checkbox" name="cbx" value="'+ajaxnames[i].id+'" data-am-ucheck>'
						+ ajaxnames[i].name + '</label> ';
			}
			$('#ajax_names').html(text);
			$('#my-confirm-choice-name')
					.modal(
							{
								relatedTarget : this,
								onConfirm : function(options) {
									$('#my-confirm-choice-has').modal("close");
									var lin = userlist.length;
									var cbx = document.getElementsByName("cbx");
									for (var j = 0; j < cbx.length; j++) {
										if (cbx[j].checked) {
											console
													.log(cbx[j].value
															+ " "
															+ cbx[j].nextSibling.nodeValue);
											for (var i = 0; i < lin; i++) {
												if (cbx[j].value == userlist[i].id) {
													showDialog(
															"编号为:"
																	+ cbx[j].value
																	+ " 的"
																	+ cbx[j].nextSibling.nodeValue
																	+ "冲突,已停止导入！");
													return;
												}
											}
											var user = new Object();
											user.id = cbx[j].value;
											user.name = cbx[j].nextSibling.nodeValue;
											userlist[userlist.length] = user;
										}
									}
									showDialog("已导入");
									showList();
								},
								onCancel : function() {
									return true;
								}
							});
		}

		function shanchu(num) {
			var ren = true;
			$("#cz-name").html("删除编号：" + userlist[num].id);
			$('#my-confirm-shanchu').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					if (ren) {
						ren = false;
						userlist.splice(num, 1);
					}
					showList();
				},
				onCancel : function() {
				}
			});
		};

		function changeList(num) {
			var ren = true;
			$('#change_user_id').val(userlist[num].id);
			$('#change_user_name').val(userlist[num].name);
			$('#my-confirm-change')
					.modal(
							{
								relatedTarget : this,
								onConfirm : function(options) {
									if (ren) {
										ren = false;
										var id = userlist[num].id;
										if (id != $('#change_user_id').val()) {
											for (var i = 0; i < userlist.length; i++) {
												if ($('#change_user_id').val() == userlist[i].id) {
													showDialog("用户编号已存在！");
													return;
												}
											}
										}
										userlist[num].id = $('#change_user_id')
												.val();
										userlist[num].name = $(
												'#change_user_name').val();
									}
									showList();
								},
								onCancel : function() {
								}
							});
		};

		//移除数据 否则出错
		$('#my-confirm-change').on('closed.modal.amui', function() {
			$(this).removeData('amui.modal');
		});

		$('#my-confirm-shanchu').on('closed.modal.amui', function() {
			$(this).removeData('amui.modal');
		});

		$('#my-confirm-show').on('closed.modal.amui', function() {
			$(this).removeData('amui.modal');
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