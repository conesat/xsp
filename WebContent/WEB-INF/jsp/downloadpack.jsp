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
<link rel="stylesheet" href="css/style.css" />
<title>关于</title>
</head>

<body style="background: #ececec">
	<div class="pet_mian">
		<div class="pet_head">
			<header data-am-widget="header"
				class="am-header am-header-default pet_head_block">
			<div class="am-header-left am-header-nav ">
				<a href="JavaScript:history.go(-1)" class="am-icon-chevron-left"></a>
			</div>
			<div class="pet_news_list_tag_name">下载收集文件</div>
			</header>
		</div>

	</div>
	<div class="am-panel am-panel-default xinjian-panel"
		style="background-color: #ececec; border: none; font-size: 1.2em; padding-left: 20px; padding-right: 20px; margin-left: 0; margin-right: 0;">
		<div class="am-panel am-panel-default">
			<div class="am-panel-hd">${id}设置单个文件命名格式</div>
			<div class="am-panel-bd">
				当前格式为 "<a id='fomat'></a>"</a>
			</div>
			<div class="am-panel-bd">

				<p>
					请勿使用特殊字符  \/:*?'<>| <input type="text"
						class="am-form-field am-radius" placeholder="输入自定义分隔符 "
						id='addself_fg' style="width: 73%; float: left;" />
					<button type="button" class="am-btn am-btn-primary am-radius"
						style="width: 25%; float: right;" onclick="changfg()">修改</button>
				</p>
				<hr style="height: 20px;">
				<button type="button" class="am-btn am-btn-default am-radius"
					onclick="add('&姓名&')">插入 姓名</button>
				<button type="button" class="am-btn am-btn-default am-radius"
					onclick="add('&编号&')">插入 编号</button>
				<p>
					<input type="text" class="am-form-field am-radius"
						placeholder="输入自定义文字" id='addself' />
				</p>
				<a onclick="addBySelf()" class="am-icon-btn am-primary am-icon-plus"></a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="am-icon-btn am-warning am-icon-minus" onclick="minu()"></a>
				<hr style="height: 20px;">

				<button type="button" class="am-btn am-btn-primary am-btn-block"
					onclick="submitInfo()">完成并提交</button>
				<c:if test="${zip=='1'}">
					<hr style="height: 20px;">
					<a href="downLoadSJPackge?id=${id}"><button type="button"
							class="am-btn am-btn-primary am-btn-block">下载当前已压缩好的文件</button></a>
				</c:if>
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

	<div class="am-modal am-modal-confirm" tabindex="-1" style="top: 20%;"
		id="my-confirm-submit">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">正在为您压缩文件</div>
			<div class="am-modal-bd">
				<!-- 代码部分begin -->
				<div class="loader-inner" style="top: -30px">
					<div class="loader-line-wrap">
						<div class="loader-line"></div>
					</div>
					<div class="loader-line-wrap">
						<div class="loader-line"></div>
					</div>
					<div class="loader-line-wrap">
						<div class="loader-line"></div>
					</div>
					<div class="loader-line-wrap">
						<div class="loader-line"></div>
					</div>
					<div class="loader-line-wrap">
						<div class="loader-line"></div>
					</div>
				</div>
				<!-- 代码部分end -->
			</div>
		</div>
	</div>

	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script type="text/javascript">
		var id = '${id}';
		var zip = '${zip}';
		var state = '${state}';
		var lin = "-";
		var namespace = new Array();
		namespace[0] = "&姓名&";
		namespace[1] = "&编号&";

		$(function() {
			if (zip == 1) {
				showGotoDialog("当前任务已格式化并压缩好了,是否直接下载?", "downLoadSJPackge?id="
						+ id);
			}
			showFomat();
		});

		function submitInfo() {
			lin=$('#addself_fg').val();
			if (namespace.length <= 0) {
				showGotoDialog("命名方式不能为空!","");
			} else {
				$('#my-confirm-submit').modal({
					relatedTarget : this,
					closeViaDimmer : 0
				});

				$.ajax({
					type : "post",
					url : "setSJPack",
					async : false,
					data : {
						lin : lin,
						namespace : JSON.stringify(namespace),
						id : id
					},
					success : function(data) {
						$('#my-confirm-submit').modal('close');
						jsonData = JSON.parse(data);
						if (jsonData.code == '100') {
							showGotoDialog("已完成,点击确认下载", "downLoadSJPackge?id="+ id);
						} else if (jsonData.code == '101') {
							showGotoDialog("请先登录", "gotoLogin");
						} else if (jsonData.code == '102') {
							showGotoDialog("创建失效!","");
						} else if (jsonData.code == '103') {
							showGotoDialog("创建失效!请勿使用特殊字符\/:*?'<>|","");
						}
					},
					error : function(jqObj) {
						$('#my-confirm-submit').modal('close');
					}
				});
			}
		}

		function addBySelf() {
			var text = $('#addself').val();
			if (text == '') {
				showGotoDialog("请输入自定义文字!","");
			} else {
				namespace[namespace.length] = text;
				showFomat();
			}
		}

		function changfg() {
			lin = $('#addself_fg').val();
			showFomat();
		}

		function add(text) {
			namespace[namespace.length] = text;
			showFomat();
		}

		function minu() {
			namespace.pop();
			showFomat();
		}

		$('#my-confirm-show').on('closed.modal.amui', function() {
			$(this).removeData('amui.modal');
		});

		function showGotoDialog(msg, url) {
			$('#dialog_title').html(msg);
			$('#my-confirm-show').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					if (url!='') {
						window.location.href = url;
					}
					return true;
				},
				onCancel : function() {
					return true;
				}
			});
		}

		function showFomat() {
			var fomat;
			if (namespace.length > 0) {
				if (namespace[0] == "&姓名&") {
					fomat = "姓名";
				} else if (namespace[0] == "&编号&") {
					fomat = "编号";
				} else {
					fomat = namespace[0];
				}
			} else {
				fomat = "";
			}
			for (var i = 1; i < namespace.length; i++) {
				if (namespace[i] == "&姓名&") {
					fomat += lin + "姓名";
				} else if (namespace[i] == "&编号&") {
					fomat += lin + "编号";
				} else {
					fomat += lin + namespace[i]
				}
			}

			$('#fomat').html(fomat);
		}
	</script>
</body>

</html>