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
				<a href="gotoIndex" class="am-icon-chevron-left"></a>
			</div>
			<div class="pet_news_list_tag_name">收集页</div>

			</header>
		</div>

	</div>
	<div class="am-panel am-panel-default xinjian-panel">
		<div class="am-panel-hd">收集码：${task.id}</div>
		<div class="am-panel-bd">
			<button class="am-btn am-btn-default am-btn-block"
				disabled="disabled" style="margin-bottom: 10px;" id='sj_end_time'>收集进行中
				0天0小时0分后截止</button>
			<form class="am-form am-form-horizontal">
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">标题</label>
					<div class="am-u-sm-10 sjxx-label">${task.title}</div>
				</div>
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">内容</label>
					<div class="am-u-sm-10 sjxx-label">${task.content}</div>
				</div>
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">附件</label>

					<div class="am-u-sm-10">
						<div class="am-form-group">
							<div class="am-form-group am-form-file">
								<c:if test="${empty files}">
									<div style="padding: 10px;" align="center">无附件</div>
								</c:if>
								<c:if test="${not empty files}">
									<c:forEach items="${files}" var="file" varStatus="status">
										<div style="padding: 5px;">
											<span style="display: block; width: 60%; float: left;">${file.name}</span>
											<a href="downLoadFile?file=${file.path}">
												<button style="float: right;" type="button"
													class="am-btn am-btn-default am-btn-sm">
													<i class="am-icon-cloud-download"></i>下载
												</button>
											</a>

										</div>
										<hr style="clear: both;">
									</c:forEach>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				<div class="am-form-group am-form-group-sm" id="tj_sj_name_div">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">姓名</label>
					<div class="am-u-sm-10">
						<input type="text" id="tj_sj_name" class="am-form-field"
							placeholder="输入姓名">
					</div>
				</div>
				<div class="am-form-group am-form-group-sm" id="tj_sj_user_id_div">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">编号</label>
					<div class="am-u-sm-10">
						<input type="text" id="tj_sj_user_id" class="am-form-field"
							placeholder="输入编号">
					</div>
				</div>
				<div class="am-form-group am-form-group-sm" id='tj_sj_sc_div'>
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">文件</label>
					<div class="am-u-sm-10">
						<div class="am-form-group">
							<div class="am-form-group am-form-file">
								<button type="button" class="am-btn am-btn-default am-btn-sm"
									id='tj_sj_sc'>
									<i class="am-icon-cloud-upload"></i> 选择要上传的文件
								</button>
							</div>
						</div>
					</div>
				</div>

				<div class="am-form-group">
					<div class="am-u-sm-10 am-u-sm-offset-2">
						<button type="button" class="am-btn am-btn-default"
							id='tj_sj_submit'>提交</button>
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
				<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script src="js/plupload.full.min.js"></script>
	<script type="text/javascript">
		var endTime = '${task.end}';
		var uploader;

		$(function() {

			//实例化一个plupload上传对象
			uploader = new plupload.Uploader({
				browse_button : 'tj_sj_sc', //触发文件选择对话框的按钮，为那个元素id
				url : '${pageContext.request.contextPath}/addShouJi', //服务器端的上传页面地址\
				runtimes : 'html5,flash,silverlight',//设置运行环境，会按设置的顺序，可以选择的值有html5,gears,flash,silverlight,browserplus,html
				flash_swf_url : './js/Moxie.swf',
				silverlight_xap_url : './js/Moxie.xap',
				max_file_size : '10mb',//100b, 10kb, 10mb, 1gb
				chunk_size : '1mb'//分块大小，小于这个大小的不分块
			});

			//上传成功触发，ps:data是返回值（第三个参数是返回值）
			uploader.bind('FileUploaded', function(uploader, files, data) {
				$('#add_sj_jd').width(100);
				var jsonData = JSON.parse(data.response);
				uploader.files.splice(0, uploader.files.length);
				if (jsonData.code == '100') {
					showGotoDialog("创建完成", "");
				} else if (jsonData.code == '101') {
					showGotoDialog("账号已过期，请登录", "gotoLogin");
				} else if (jsonData.code == '102') {
					$("#add_sj_bt").addClass("my_border_color_red");
					$("#browse").addClass("my_border_color_red");
					$("#browse").html(
							'<i class="am-icon-cloud-upload"></i> 请重新选择文件');
					showGotoDialog("任务标题已存在,请重新选择文件", "");
				} else {
					showGotoDialog("创建失败", "");
				}
				showFils();
				$('#add_sj_jd').width(0);
			});

			//在实例对象上调用init()方法进行初始化
			uploader.init();

			uploader
					.bind(
							'BeforeUpload',
							function(uploader, files) {
								uploader.settings.url = '${pageContext.request.contextPath}/addShouJi?id='
										+ $('#add_sj_id').val()
										+ "&title"
										+ $('#add_sj_bt').val()
										+ "&content="
										+ $('#add_sj_nr').val()
										+ "&end="
										+ $('#add_sj_ri').val()
										+ " "
										+ $('#add_sj_sj').val()
										+ "&nameListName="
										+ $('#add_sj_qz').val();
							});

			//绑定各种事件，并在事件监听函数中做你想做的事
			uploader.bind('FilesAdded', function(uploader, files) {
				$("#browse").html('<i class="am-icon-cloud-upload"></i> 选择文件');
				//每个事件监听函数都会传入一些很有用的参数，
				//我们可以利用这些参数提供的信息来做比如更新UI，提示上传进度等操作

				if (uploader.files.length >= 1) {
					$("#browse").html(
							'<i class="am-icon-cloud-upload"></i> 文件数量达上限');
					$("#browse").attr('disabled', true);
					if (uploader.files.length > 1) {
						showGotoDialog("只能选择一个文件！", "");
						uploader.files.splice(1, uploader.files.length - 1);
					}
				}
				showFils();
			});

			//会在文件上传过程中不断触发，可以用此事件来显示上传进度监听（比如说上传进度）
			uploader.bind('UploadProgress', function(uploader, file) {
				$('#add_sj_jd').width(file.percent);
			});

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
				$('#sj_end_time').html("收集已截止 请联系发起人");
				$('#tj_sj_name_div').css('display', 'none');
				$('#tj_sj_user_id_div').css('display', 'none');
				$('#tj_sj_sc_div').css('display', 'none');
				$('#tj_sj_submit').css('display', 'none');

			} else {
				var day = Math.floor(runTime / 86400);
				runTime = runTime % 86400;
				var hour = Math.floor(runTime / 3600);
				runTime = runTime % 3600;
				var minute = Math.floor(runTime / 60);
				$('#sj_end_time').html(
						"收集进行中 " + day + "天" + hour + "小时" + minute + "分 后截止");
			}
		}
		
		$('#tj_sj_submit').on('click', function() {
			reset_input_color();
			if ($('#tj_sj_name').val() == '') {
				$("#tj_sj_name").addClass("my_border_color_red");
				showMsgDialog('请输入姓名');
			} else if ($('#tj_sj_user_id').val() == '') {
				$("#tj_sj_name").addClass("my_border_color_red");
				showMsgDialog('请输入编号');
			}
		});

		function showMsgDialog(msg) {
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

		function reset_input_color() {
			$("#add_sj_bt").removeClass("my_border_color_red");
			$("#add_sj_nr").removeClass("my_border_color_red");
			$("#add_sj_ri").removeClass("my_border_color_red");
			$("#add_sj_sj").removeClass("my_border_color_red");
			$("#add_sj_qz").removeClass("my_border_color_red");
			$("#browse").removeClass("my_border_color_red");
		}
	</script>
</body>

</html>