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
						<a href="gotoShouji" class="am-icon-chevron-left"></a>
					</div>
					<div class="pet_news_list_tag_name">收集详细</div>

				</header>
			</div>

		</div>
		<div class="am-panel am-panel-default xinjian-panel">
			<div class="am-panel-hd">收集码：3421</div>
			<div class="am-panel-bd">
				<button class="am-btn am-btn-default am-btn-block" disabled="disabled" style="margin-bottom: 10px;">
					收集进行中 0天3小时后截止
				</button>
				<div data-am-widget="tabs" class="am-tabs am-tabs-default">
					<ul class="am-tabs-nav am-cf">
						<li class="am-active">
							<a href="[data-tab-panel-0]">未提交11人</a>
						</li>
						<li class="">
							<a href="[data-tab-panel-1]">已提交3人</a>
						</li>

					</ul>
					<div class="am-tabs-bd">
						<div data-tab-panel-0 class="am-tab-panel am-active">
							<table class="am-table am-table-bordered">
								<thead>
									<tr>
										<th>姓名</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="am-warning">张三</td>
									</tr>
									<tr>
										<td class="am-warning">李四</td>
									</tr>
									<tr>
										<td class="am-warning">王五</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div data-tab-panel-1 class="am-tab-panel ">
							<table class="am-table am-table-bordered">
								<thead>
									<tr>
										<th>姓名</th>
										<th style="text-align: center;" width="80px">操作</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="am-success">张三</td>
										<td style="text-align: center;" class="am-success">
											<div><span onclick="chongzhi('张三')" class="my-piont-r">重置</span>&nbsp;&nbsp;&nbsp;<span class="my-piont-b">文件</span></div>
										</td>
									</tr>
									<tr>
										<td class="am-success">张三</td>
										<td style="text-align: center;" class="am-success">
											<div><span class="my-piont-r">重置</span>&nbsp;&nbsp;&nbsp;<span class="my-piont-b">文件</span></div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>

		</div>
		<div class="pet_article_footer_info">Copyright(c)2018 hg All Rights Reserved </div>
		<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
			<div class="am-modal-dialog">
				<div id="cz-name" class="am-modal-hd">重置提交</div>
				<div class="am-modal-bd">
					<p>重置后将删除源文件！无法恢复是否继续？</p>
				</div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>取消</span>
					<span class="am-modal-btn" data-am-modal-confirm>确定</span>
				</div>
			</div>
		</div>
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

			function chongzhi(name) {
				$("#cz-name").html("重置：" + name + "提交信息");
				$('#my-confirm').modal({
					relatedTarget: this,
					onConfirm: function(options) {
						window.location.href = "shoujiye.html";
						/*var $link = $(this.relatedTarget).prev('a');
						var msg = $link.length ? '你要删除的链接 ID 为 ' + $link.data('id') :
							'确定了，但不知道要整哪样';
						alert(msg);*/
					},
					// closeOnConfirm: false,
					onCancel: function() {
						//alert('算求，不弄了');
					}
				});
			};
		</script>
	</body>

</html>