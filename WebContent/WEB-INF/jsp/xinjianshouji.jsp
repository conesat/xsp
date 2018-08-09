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
			<div class="pet_news_list_tag_name">新建收集</div>
			</header>
		</div>

	</div>
	<div class="am-panel am-panel-default xinjian-panel">
		<div class="am-panel-hd">收集码：${ID}</div>
		<div class="am-panel-bd">
			<form class="am-form am-form-horizontal">

				<!-- am-form-group 的基础上添加了 am-form-group-sm -->
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">标题</label>
					<div class="am-u-sm-10">
						<input type="text" id="doc-ipt-3-1" class="am-form-field"
							placeholder="输入标题">
					</div>
				</div>

				<div class="am-form-group am-form-group-sm"
					style="margin-bottom: 0;">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">内容</label>
					<div class="am-u-sm-10">
						<div class="am-form-group">
							<textarea class="" rows="5" id="doc-ta-1" placeholder="输入描述内容"></textarea>
						</div>
					</div>

				</div>
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">日期</label>
					<div class="am-u-sm-10" style="height: 32px;">
						<div class="am-form-group">
							<p>
								<input type="text" class="am-form-field" placeholder="选择截止日期"
									data-am-datepicker readonly required />
							</p>
						</div>
					</div>
				</div>

				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">时间</label>
					<div class="am-u-sm-10" style="height: 32px;">
						<div class="am-form-group">
							<select>
								<option value="01">01:00</option>
								<option value="02">02:00</option>
								<option value="03">03:00</option>
								<option value="04">04:00</option>
								<option value="05">05:00</option>
								<option value="06">06:00</option>
								<option value="07">07:00</option>
								<option value="08">08:00</option>
								<option value="09">09:00</option>
								<option value="10">10:00</option>
								<option value="11">11:00</option>
								<option value="12">12:00</option>
								<option value="13">13:00</option>
								<option value="14">14:00</option>
								<option value="15">15:00</option>
								<option value="16">16:00</option>
								<option value="17">17:00</option>
								<option value="18">18:00</option>
								<option value="19">19:00</option>
								<option value="20">20:00</option>
								<option value="21">21:00</option>
								<option value="22">22:00</option>
								<option value="23">23:00</option>
								<option value="24">24:00</option>
							</select>
						</div>
					</div>
				</div>

				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">群组</label>
					<div class="am-u-sm-10" style="height: 32px;">
						<div class="am-form-group">
							<select>
								<option value="01">软件154</option>
								<option value="01">软件154</option>
							</select>
						</div>
					</div>
				</div>
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">附件</label>
					<div class="am-u-sm-10">
						<div class="am-form-group">
							<div class="am-form-group am-form-file">
								<button type="button" class="am-btn am-btn-default am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择要上传的文件
								</button>
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
	<script src="js/plupload.full.min.js"></script>
	<script type="text/javascript">
		var fileNames = new Array();
		$(function() {
			/* $('#doc-form-file').on('change', function() {
				$.each(this.files, function() {
					console.log(this);
					for (var i = 0; i < fileNames.length; i++) {
						if (fileNames[i] == this.name) {
							return;
						}
					}
					fileNames[fileNames.length] = this.name;
				});
				showFils();
			}); */
			
			
		});

		function showFils() {
			var divs = "";
			for (var i = 0; i < fileNames.length; i++) {
				divs += '<div style="margin-bottom:5px;background-color: #dadada;"><span class="am-badge" style="line-height: 22px;">'
						+ fileNames[i]
						+ '</span> <span style="float:right;" ><button onclick="deleteDiv('
						+ i
						+ ')" type="button" class="am-btn am-btn-warning am-btn-xs">删除</button></span></div>';
			}
			$('#file-list').html(divs);
		}

		function deleteDiv(num) {
			fileNames.splice(num, 1);
			showFils();
			return false;
		}
		
		function showGotoDialog(msg, url) {
			$('#dialog_title').html(msg);
			$('#my-confirm-show').modal({
				relatedTarget : this,
				onConfirm : function(options) {
					if(url!=""){
						window.location.href = url;
					}else{
						return true;
					}
				},
				onCancel : function() {
					return true;
				}
			});
		}
		
		$('#my-confirm-show').on('closed.modal.amui', function() {
			$(this).removeData('amui.modal');
		});
	</script>
</body>

</html>