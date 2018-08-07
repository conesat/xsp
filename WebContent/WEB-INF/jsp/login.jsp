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
<link rel="stylesheet" href="css/login.css" />
<title>学生派登录</title>
</head>

<body style="background: #FFFFFF">
	<div class="pet_mian">
		<div class="pet_head">
			<header data-am-widget="header"
				class="am-header am-header-default pet_head_block">

			<ul class="am-nav am-nav-pills">
				<li><a href="gotoIndex"><span
						class="am-icon-home am-icon-sm"></span> 学生派首页</a></li>

				<li class="am-dropdown" data-am-dropdown><a
					class="am-dropdown-toggle" data-am-dropdown-toggle
					href="javascript:;"> 菜单 <span class="am-icon-caret-down"></span>
				</a>
					<ul class="am-dropdown-content">
						<li><a href="#">关于学生派</a></li>
						<li><a href="#">客户端下载</a></li>
						<li class="am-divider"></li>
						<li><a href="#">捐助</a></li>
					</ul></li>
			</ul>
			</header>
		</div>
		<div class="pet_content">
			<div data-am-widget="tabs"
				class="am-tabs am-tabs-default am-u-lg-3 am-u-md-6">
				<ul class="am-tabs-nav am-cf">
					<li class="am-active"><a href="[data-tab-panel-0]">登录</a></li>
					<li class=""><a href="[data-tab-panel-1]">注册</a></li>

				</ul>
				<div class="am-tabs-bd">
					<div data-tab-panel-0 class="am-tab-panel am-active">
						<form class="am-form am-form-horizontal" action="javascript:;"
							id="login_form">
							<div class="am-form-group">

								<div class="am-u-sm-12">
									<input type="email" class="am-radius" name="mail"
										id="login_mail" placeholder="输入你的电子邮件">
								</div>
							</div>

							<div class="am-form-group">

								<div class="am-u-sm-12">
									<input type="password" class="am-radius" name="password"
										id="login_password" placeholder="输入密码">
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-12">
									<button type="submit"
										class="am-btn am-btn-primary am-btn-block" id='login'>登录</button>

								</div>
							</div>
						</form>

					</div>
					<div data-tab-panel-1 class="am-tab-panel ">
						<form class="am-form am-form-horizontal" action="javascript:;"
							id="register_form">
							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="email" class="am-radius" name="mail"
										id="register_mail" placeholder="输入你的电子邮件">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="password" class="am-radius" name='password'
										id="register_pd1" placeholder="输入密码">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="password" class="am-radius" id="register_pd2"
										placeholder="确认密码">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="text" class="am-radius" name='name'
										id="register_name" placeholder="输入姓名">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-6">
									<input type="text" class="am-radius" name='code'
										id="register_code" placeholder="输入验证码">
								</div>
								<div class="am-u-sm-6">
									<button id="get_code"
										class="am-btn am-btn-primary am-btn-block">获取验证码</button>
								</div>

							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<button id="register"
										class="am-btn am-btn-primary am-btn-block">注册</button>

								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

	</div>
	<br />
	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">提示</div>
			<div class="am-modal-bd" id="dialog_title"></div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<div class="pet_article_footer_info">
		<div class="pet_article_dowload_content_font"></div>
		Copyright(c)2018 hg All Rights Reserved 广西科技大学红格互联
	</div>
	</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script>
		$(function() {

			$('#login').on(
					'click',
					function() {
						reset_input_color();
						if (!/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test($(
								'#login_mail').val())) {
							$("#login_mail").addClass("my_border_color_red");
							showDialog("请填写正确邮箱！");
						} else if ($('#login_password').val() == '') {
							showDialog("请填写密码！");
							$("#login_password")
									.addClass("my_border_color_red");
						} else {
							$.ajax({
								type : "post",
								url : "verifyLogin?"
										+ $("#login_form").serialize(),
								async : false,
								success : function(data) {
									jsonData = JSON.parse(data);
									if (jsonData.code == '101') {
										showDialog("用户不存在");
									} else if (jsonData.code == '102') {
										showDialog("密码错误");
									} else{
										window.location.href='gotoIndex';
									}
								},
								error : function(jqObj) {

								}
							});
						}
					});

			$('#register')
					.on(
							'click',
							function() {
								reset_input_color();
								if ($('#register_mail').val() == '') {
									showDialog("请填写正确邮箱！");
									$("#register_mail").addClass(
											"my_border_color_red");
								} else if ($('#register_pd1').val() == '') {
									showDialog("请填写密码！");
									$("#register_pd1").addClass(
											"my_border_color_red");
								} else if ($('#register_pd2').val() == '') {
									showDialog("请再次确认密码！");
									$("#register_pd2").addClass(
											"my_border_color_red");
								} else if ($('#register_pd2').val() != $(
										'#register_pd1').val()) {
									showDialog("两次密码不相同！");
									$("#register_pd1").addClass(
											"my_border_color_red");
									$("#register_pd2").addClass(
											"my_border_color_red");
								} else if ($('#register_name').val() == '') {
									showDialog("请填写姓名！");
									$("#register_name").addClass(
											"my_border_color_red");
								} else if ($('#register_code').val() == '') {
									showDialog("请填写验证码！");
									$("#register_code").addClass(
											"my_border_color_red");
								} else {
									reset_input_color();
									$.ajax({
										type : "post",
										url : "registerUser?"
												+ $("#register_form")
														.serialize(),
										async : false,
										success : function(data) {
											jsonData = JSON.parse(data);
											if (jsonData.code == '100') {
												showDialog("注册成功，请登录");
											} else if (jsonData.code == '101') {
												showDialog("用户名已存在");
											} else if (jsonData.code == '200') {
												showDialog("验证码错误");
											} else if (jsonData.code == '102') {
												showDialog("注册失败");
											}
										},
										error : function(jqObj) {

										}
									});
								}
							});

			function reset_input_color() {
				$("#login_mail").removeClass("my_border_color_red");
				$("#login_password").removeClass("my_border_color_red");
				$("#register_mail").removeClass("my_border_color_red");
				$("#register_pd1").removeClass("my_border_color_red");
				$("#register_pd2").removeClass("my_border_color_red");
				$("#register_name").removeClass("my_border_color_red");
				$("#register_code").removeClass("my_border_color_red");
			}

			$('#get_code')
					.on(
							'click',
							function() {
								if (!/^[\w\-\.]+@[\w\-\.]+(\.\w+)+$/.test($(
										'#register_mail').val())) {
									$("#register_mail").addClass(
											"my_border_color_red");
									showDialog("请填写正确邮箱！");
								} else {
									reset_input_color();
									updateTime();
									$.ajax({
										type : "post",
										url : "getCode?mail="
												+ $("#register_mail").val(),
										async : false,
										success : function(data) {
											jsonData = JSON.parse(data);
											if (jsonData.code == '100') {
												showDialog("验证码已发送，请注意接收");
											} else if (jsonData.code == '102') {
												showDialog("该邮箱已被使用");
											} else {
												showDialog("验证码发送失败，请重试");
												countdown = 0;
											}
										},
										error : function(jqObj) {

										}
									});
								}
							});

			var countdown = 60;
			function updateTime() {
				if (countdown == 0) {
					$('#get_code').removeAttr("disabled");
					$('#get_code').html("获取验证码");
					countdown = 60;
				} else {
					$('#get_code').attr('disabled', "true");
					$('#get_code').html("重新发送(" + countdown + ")");
					countdown--;
					setTimeout(function() {
						updateTime()
					}, 1000)
				}
			}

			function showDialog(msg) {
				$('#dialog_title').html(msg);
				$('#my-confirm').modal({
					relatedTarget : this,
					onConfirm : function(options) {
						return true;
					},
					onCancel : function() {
						return true;
					}
				});
			}
		});
	</script>
</body>

</html>