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
			<div class="pet_news_list_tag_name">新建收集</div>

			</header>
			<div class="am-progress am-progress-xs">
				<div class="am-progress-bar" id='add_sj_jd' style="width: 0%"></div>
			</div>
		</div>

	</div>
	<div class="am-panel am-panel-default xinjian-panel">
		<div class="am-panel-hd">
			收集码：<span id="add_sj_id">${ID}</span>
		</div>
		<div class="am-panel-bd">
			<form class="am-form am-form-horizontal">

				<!-- am-form-group 的基础上添加了 am-form-group-sm -->
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">标题</label>
					<div class="am-u-sm-10">
						<input type="text" id="add_sj_bt" class="am-form-field"
							placeholder="输入标题">
					</div>
				</div>

				<div class="am-form-group am-form-group-sm"
					style="margin-bottom: 0;">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">内容</label>
					<div class="am-u-sm-10">
						<div class="am-form-group">
							<textarea class="" rows="5" id="add_sj_nr" placeholder="输入描述内容"></textarea>
						</div>
					</div>

				</div>
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">日期</label>
					<div class="am-u-sm-10" style="height: 32px;">
						<div class="am-form-group">
							<p>
								<input type="text" id='add_sj_ri' class="am-form-field"
									placeholder="选择截止日期" readonly required />
							</p>
						</div>
					</div>
				</div>

				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">时间</label>
					<div class="am-u-sm-10" style="height: 32px;">
						<div class="am-form-group">
							<select id='add_sj_sj'>
								<option value="">请选择时间</option>
								<option value="00:00:00">00:00</option>
								<option value="01:00:00">01:00</option>
								<option value="02:00:00">02:00</option>
								<option value="03:00:00">03:00</option>
								<option value="04:00:00">04:00</option>
								<option value="05:00:00">05:00</option>
								<option value="06:00:00">06:00</option>
								<option value="07:00:00">07:00</option>
								<option value="08:00:00">08:00</option>
								<option value="09:00:00">09:00</option>
								<option value="10:00:00">10:00</option>
								<option value="11:00:00">11:00</option>
								<option value="12:00:00">12:00</option>
								<option value="13:00:00">13:00</option>
								<option value="14:00:00">14:00</option>
								<option value="15:00:00">15:00</option>
								<option value="16:00:00">16:00</option>
								<option value="17:00:00">17:00</option>
								<option value="18:00:00">18:00</option>
								<option value="19:00:00">19:00</option>
								<option value="20:00:00">20:00</option>
								<option value="21:00:00">21:00</option>
								<option value="22:00:00">22:00</option>
								<option value="23:00:00">23:00</option>
							</select>
						</div>
					</div>
				</div>

				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">群组</label>
					<div class="am-u-sm-10" style="height: 32px;">
						<div class="am-form-group">
							<select id='add_sj_qz'>
								<option value="">请选择群组</option>
								<c:forEach items="${names}" var="name" varStatus="status">
									<option value="${name}">${name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<div class="am-form-group am-form-group-sm">
					<label for="doc-ipt-3-1" class="am-u-sm-2 am-form-label xjsj-label">附件</label>
					<div class="am-u-sm-10">
						<div class="am-form-group">
							<div class="am-form-group">
								<button type="button" id='browse'
									class="am-btn am-btn-default am-btn-sm">
									<i class="am-icon-cloud-upload"></i> 选择要上传的文件
								</button>
								<!-- <input id="doc-form-file" type="file" multiple> -->
							</div>
							<div id="file-list"></div>
						</div>
					</div>
				</div>

				<div class="am-form-group">
					<div class="am-u-sm-10 am-u-sm-offset-2">
						<button type="button" class="am-btn am-btn-default" id='add_sj_tj'>提交</button>
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
		$(function() {
			var nowTemp = new Date();
			var nowDay = new Date(nowTemp.getFullYear(), nowTemp.getMonth(),
					nowTemp.getDate(), 0, 0, 0, 0).valueOf();
			var nowMoth = new Date(nowTemp.getFullYear(), nowTemp.getMonth(),
					1, 0, 0, 0, 0).valueOf();
			var nowYear = new Date(nowTemp.getFullYear(), 0, 1, 0, 0, 0, 0)
					.valueOf();
			var $myStart2 = $('#add_sj_ri');

			var checkin = $myStart2.datepicker({
				onRender : function(date, viewMode) {
					// 默认 days 视图，与当前日期比较
					var viewDate = nowDay;

					switch (viewMode) {
					// moths 视图，与当前月份比较
					case 1:
						viewDate = nowMoth;
						break;
					// years 视图，与当前年份比较
					case 2:
						viewDate = nowYear;
						break;
					}

					return date.valueOf() < viewDate ? 'am-disabled' : '';
				}
			}).on('changeDate.datepicker.amui', function(ev) {

				checkin.close();
			}).data('amui.datepicker');

		});

		var uploader;
		$(function() {

			//实例化一个plupload上传对象
			uploader = new plupload.Uploader({
				browse_button : 'browse', //触发文件选择对话框的按钮，为那个元素id
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
					showGotoDialog("创建完成", "gotoShouji");
				} else if (jsonData.code == '101') {
					showGotoDialog("账号已过期，请登录", "gotoLogin");
				} else if (jsonData.code == '102') {
					$("#browse").addClass("my_border_color_red");
					$("#browse").html(
							'<i class="am-icon-cloud-upload"></i> 请重新选择文件');
					showGotoDialog("收集码已存在,请重新选择文件", "");
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
										+ $('#add_sj_id').html()+"&title="+$('#add_sj_bt').val()+
										"&content="+$('#add_sj_nr').val()+"&end="+ $('#add_sj_ri').val() + " "
										+ $('#add_sj_sj').val()+"&nameListName="+$('#add_sj_qz').val();
								
								
							});

			//绑定各种事件，并在事件监听函数中做你想做的事
			uploader.bind('FilesAdded', function(uploader, files) {
				$("#browse").html('<i class="am-icon-cloud-upload"></i> 添加文件');
				//每个事件监听函数都会传入一些很有用的参数，
				//我们可以利用这些参数提供的信息来做比如更新UI，提示上传进度等操作

				var myset = new Set();
				for (var i = 0; i < uploader.files.length; i++) {
					myset.add(uploader.files[i].name);
				}
				if (myset.size != uploader.files.length) {
					showGotoDialog("存在重复文件名！", "");
					uploader.files.splice(uploader.files.length - files.length,
							files.length);
				}
				if (uploader.files.length >= 4) {
					$("#browse").html(
							'<i class="am-icon-cloud-upload"></i> 文件数量达上限');
					$("#browse").attr('disabled', true);
					if (uploader.files.length > 4) {
						showGotoDialog("最多选择四个文件！", "");
						uploader.files.splice(4, uploader.files.length - 4);
					}
				}
				showFils();
			});

			//会在文件上传过程中不断触发，可以用此事件来显示上传进度监听（比如说上传进度）
			uploader.bind('UploadProgress', function(uploader, file) {
				$('#add_sj_jd').width(file.percent);
			});

			$('#add_sj_tj').on(
					'click',
					function() {

						reset_input_color();
						if ($('#add_sj_bt').val() == '') {
							$("#add_sj_bt").addClass("my_border_color_red");
							showGotoDialog("请输入标题", "");
						} else if ($('#add_sj_nr').val() == '') {
							$("#add_sj_nr").addClass("my_border_color_red");
							showGotoDialog("请输入内容", "");
						} else if ($('#add_sj_ri').val() == '') {
							$("#add_sj_ri").addClass("my_border_color_red");
							showGotoDialog("请输入日期", "");
						} else if ($('#add_sj_sj').val() == '') {
							$("#add_sj_sj").addClass("my_border_color_red");
							showGotoDialog("请选择时间", "");
						} else if (new Date($('#add_sj_ri').val() + " "
								+ $('#add_sj_sj').val()) < new Date()) {
							$("#add_sj_ri").addClass("my_border_color_red");
							$("#add_sj_sj").addClass("my_border_color_red");
							showGotoDialog("时间不能小于当前", "");
						} else if (getRemainderTime($('#add_sj_ri').val() + " "
								+ $('#add_sj_sj').val(), 20)) {
							$("#add_sj_ri").addClass("my_border_color_red");
							showGotoDialog("时间不能超过20天", "");
						} else if ($('#add_sj_qz').val() == '') {
							$("#add_sj_qz").addClass("my_border_color_red");
							showGotoDialog("请选择群租", "");
						} else {
							if (uploader.files.length == 0) {
								$.ajax({
									type : "post",
									url : "addShouJi",
									async : false,
									data : {
										title : $('#add_sj_bt').val(),
										id : $('#add_sj_id').html(),
										content : $('#add_sj_nr').val(),
										end : $('#add_sj_ri').val() + " "
												+ $('#add_sj_sj').val(),
										nameListName : $('#add_sj_qz').val()
									},
									success : function(data) {
										jsonData = JSON.parse(data);
										if (jsonData.code == '100') {
											showGotoDialog("创建完成", "gotoShouji");
										} else if (jsonData.code == '101') {
											showGotoDialog("账号已过期，请登录",
													"gotoLogin");
										} else if (jsonData.code == '102') {
											showGotoDialog("收集号已存在", "");
										} else {
											showGotoDialog("创建失败", "");
										}
									},
									error : function(jqObj) {
										showGotoDialog("连接失败", "");
									}
								});
							} else {
								uploader.start();
							}
						}
					});

		});

		function getRemainderTime(endTime, time) {
			var s1 = new Date(endTime.replace(/-/g, "/")), s2 = new Date(), runTime = parseInt((s1
					.getTime() - s2.getTime()) / 1000);
			var past = false;
			console.log(runTime+" "+s1+" "+s2+" "+Math.floor(runTime/60/60/24));
			if (Math.floor(runTime/60/60/24) > time) {
				past = true;
			}
			return past;

		}

		function reset_input_color() {
			$("#add_sj_bt").removeClass("my_border_color_red");
			$("#add_sj_nr").removeClass("my_border_color_red");
			$("#add_sj_ri").removeClass("my_border_color_red");
			$("#add_sj_sj").removeClass("my_border_color_red");
			$("#add_sj_qz").removeClass("my_border_color_red");
			$("#browse").removeClass("my_border_color_red");
		}

		function showFils() {
			var divs = "";
			for (var i = 0; i < uploader.files.length; i++) {
				divs += '<div style="margin-bottom:5px;background-color: #dadada;"><span class="am-badge" style="line-height: 22px;overflow: hidden;width: 70%;text-align: left;">'
						+ uploader.files[i].name
						+ '</span> <span style="float:right;" ><button onclick="deleteDiv('
						+ i
						+ ')" type="button" class="am-btn am-btn-warning am-btn-xs">删除</button></span></div>';
			}
			$('#file-list').html(divs);
		}

		function deleteDiv(num) {
			$("#browse").html('<i class="am-icon-cloud-upload"></i> 添加文件');
			$("#browse").attr('disabled', false);
			uploader.files.splice(num, 1);
			showFils();
			return false;
		}

		function showGotoDialog(msg,url) {
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

		$('#my-confirm-show').on('closed.modal.amui', function() {
			$(this).removeData('amui.modal');
		});
	</script>
</body>

</html>