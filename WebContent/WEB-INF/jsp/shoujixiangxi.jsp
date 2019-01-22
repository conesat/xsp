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
<style type="text/css">
.am-icon-btn {
	width: 30px;
	height: 30px;
	font-size: 20px;
	line-height: 30px;
	background-color: #f5f5f5;
}
</style>
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
			<div class="pet_news_list_tag_name">收集详细</div>

			</header>
		</div>

	</div>
	<div class="am-panel am-panel-default xinjian-panel">
		<div class="am-panel-hd">
			收集码：${id}
			<div style="float: right;">
				<c:if test="${state=='收集完成'}">
					<a href="gotoDownloadPack?id=${id}&state=${state}"><span class="am-icon-btn am-icon-download"></span></a>
				</c:if>
				<c:if test="${state=='已过期'}">
					<a href="gotoDownloadPack?id=${id}&state=${state}"><span class="am-icon-btn am-icon-download"></span></a>
				</c:if>
				<span style="color: #fd0808;" onclick="deleteShouji('${id}')"
					class="am-icon-btn am-icon-close"></span>
			</div>
		</div>
		<div class="am-panel-bd">
			<c:if test="${state=='收集完成'}">
				<button class="am-btn am-btn-default am-btn-block" 
					disabled="disabled" style="margin-bottom: 10px;">收集已完成
					<span id='sj_end_time'>0天0小时0分 后截止</span></button>
			</c:if>
			<c:if test="${state=='收集中'}">
				<button class="am-btn am-btn-default am-btn-block" 
					disabled="disabled" style="margin-bottom: 10px;">收集进行中
					<span id='sj_end_time'>0天0小时0分 后截止</span></button>
			</c:if>
			<c:if test="${state=='已过期'}">
				<button class="am-btn am-btn-default am-btn-block" id='sj_end_time'
					disabled="disabled" style="margin-bottom: 10px;">收集已截止 请及时下载文件</button>
			</c:if>

			<div data-am-widget="tabs" class="am-tabs am-tabs-default">
				<ul class="am-tabs-nav am-cf">
					<li class="am-active"><a href="[data-tab-panel-0]"
						id='sj_xx_n_a'>未提交0人</a></li>
					<li class=""><a href="[data-tab-panel-1]" id='sj_xx_y_a'>已提交0人</a></li>
				</ul>
				<div class="am-tabs-bd">
					<div data-tab-panel-0 class="am-tab-panel am-active">
						<table class="am-table am-table-bordered" id="sj_xx_n">
							<thead>
								<tr>
									<th>姓名</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>
					<div data-tab-panel-1 class="am-tab-panel ">
						<table class="am-table am-table-bordered" id='sj_xx_y'>
							<thead>
								<tr>
									<th>姓名</th>
									<th style="text-align: center;" width="80px">操作</th>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>
					</div>

				</div>
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
	<div class="am-modal am-modal-confirm" tabindex="-1"
		id="my-confirm-show-delete">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">警告</div>
			<div class="am-modal-bd" id="delete-dialog_title"></div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div id="cz-name" class="am-modal-hd">重置提交</div>
			<div class="am-modal-bd">
				<p>重置后将删除源文件！无法恢复是否继续？</p>
			</div>
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
		//var userlist = new Array();
		var numOfN = 0;//未提交人数
		var numOfY = 0;//已提交人数
		var endTime = '${endTime}';
		var taskid = '${id}';

		$(function() {
			var names = '${names}';
			var jsonData = JSON.parse(names);
			for (x in jsonData) {
				var user = new Object();
				user.id = jsonData[x].id;
				user.name = jsonData[x].name;
				user.state = jsonData[x].state;
				user.fileName = jsonData[x].fileName;
				if (jsonData[x].state == "已提交") {
					var rowTem = '<tr><td class="am-success">'
							+ jsonData[x].name + '</td>';
					rowTem += '<td style="text-align: center;" class="am-success"><div>';
					rowTem += '<span onclick="chongzhi('
							+ "'"
							+ jsonData[x].id
							+ "'"
							+ ')" class="my-piont-r"></span>&nbsp;&nbsp;&nbsp;<span class="my-piont-b"><a href="downLoadUserFile?filename='
							+ jsonData[x].fileName + "&id=" + taskid
							+ '">文件</a></span>';
					rowTem += '</div></td></tr>';
					$("#sj_xx_y tbody:last").append(rowTem);
					numOfY++;
				} else {
					var rowTem = '<tr><td class="am-warning">'
							+ jsonData[x].name + '</td></tr>';
					$("#sj_xx_n tbody:last").append(rowTem);
					numOfN++;

				}
			}

			$("#sj_xx_n_a").html("未提交" + numOfN + "人");
			$("#sj_xx_y_a").html("已提交" + numOfY + "人");
			$('#doc-form-file').on(
					'change',
					function() {
						var fileNames = '';
						$.each(this.files, function() {
							fileNames += '<span class="am-badge">' + this.name
									+ '</span> ';
						});
						$('#file-list').html(fileNames);
					});
			getRemainderTime();
		});

		var getTime = setInterval(getRemainderTime, 60000);
		var s1 = new Date(endTime.replace(/-/g, "/"));
		function getRemainderTime() {
			var s2 = new Date(), runTime = parseInt((s1.getTime() - s2
					.getTime()) / 1000);
			if (runTime < 0) {
				clearInterval(getTime);
				$('#sj_end_time').html("收集已截止 请及时下载文件");
			} else {
				var day = Math.floor(runTime / 86400);
				runTime = runTime % 86400;
				var hour = Math.floor(runTime / 3600);
				runTime = runTime % 3600;
				var minute = Math.floor(runTime / 60);
				$('#sj_end_time').html(
						 day + "天" + hour + "小时" + minute + "分 后截止");
			}
		}

	/* 	function chongzhi(name) {
			$("#cz-name").html("重置：" + name + "提交信息");
			$('#my-confirm').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					window.location.href = "shoujiye.html";
				},
				onCancel : function() {
				}
			});
		}; */

		function deleteShouji(id) {
			$('#delete-dialog_title').html(
					"即将删除收集号为：" + id + "的收集记录！删除后欧无法恢复！是否继续？");
			$('#my-confirm-show-delete').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					$.ajax({
						type : "post",
						url : "deleteShouJi?id=" + id,
						async : false,
						success : function(data) {
							jsonData = JSON.parse(data);
							if (jsonData.code == '100') {
								showGotoDialog("删除完成", "gotoShouji");
							} else if (jsonData.code == '101') {
								showGotoDialog("账号已过期，请登录", "gotoLogin");
							} else {
								showGotoDialog("删除失败", "gotoShouji");
							}
						},
						error : function(jqObj) {
							showGotoDialog("连接失败", "");
						}
					});
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
					if (url != "") {
						window.location.href = url;
					} else {
						return true;
					}
				},
				onCancel : function() {
					return true;
				}
			});
		}
	</script>
</body>

</html>