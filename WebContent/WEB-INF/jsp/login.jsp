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
			<!--	<div class="am-header-left am-header-nav">
						<a href="#left-link" class="">
							<img src="imgs/hglogo.png" alt=""> 去首页
						</a>
					</div>

					<h1 class="am-header-title">
			          <a href="#title-link" class="">
			           学生派
			          </a>
			      </h1>--> </header>
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
						<form class="am-form am-form-horizontal">
							<div class="am-form-group">

								<div class="am-u-sm-12">
									<input type="email" class="am-radius" id="doc-ipt-3"
										placeholder="输入你的电子邮件">
								</div>
							</div>

							<div class="am-form-group">

								<div class="am-u-sm-12">
									<input type="password" class="am-radius" id="doc-ipt-pwd-2"
										placeholder="输入密码">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-offset-1 am-u-sm-12">
									<div class="checkbox">
										<input type="checkbox"> 记住密码
									</div>
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<button type="submit"
										class="am-btn am-btn-primary am-btn-block">登录</button>

								</div>
							</div>
						</form>

					</div>
					<div data-tab-panel-1 class="am-tab-panel ">
						<form class="am-form am-form-horizontal">
							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="email" class="am-radius" id="doc-ipt-3"
										placeholder="输入你的电子邮件">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="password" class="am-radius" id="doc-ipt-pwd-2"
										placeholder="输入密码">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="password" class="am-radius" id="doc-ipt-pwd-2"
										placeholder="确认密码">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<input type="password" class="am-radius" id="doc-ipt-pwd-2"
										placeholder="输入姓名">
								</div>
							</div>

							<div class="am-form-group">
								<div class="am-u-sm-6">
									<input type="password" class="am-radius" id="doc-ipt-pwd-2"
										placeholder="输入验证码">
								</div>
								<div class="am-u-sm-6">
									<button type="button"
										class="am-btn am-btn-primary am-btn-block">获取验证码</button>
								</div>

							</div>

							<div class="am-form-group">
								<div class="am-u-sm-12">
									<button type="submit"
										class="am-btn am-btn-primary am-btn-block">登录</button>

								</div>
							</div>
						</form>
					</div>

				</div>
			</div>
		</div>

	</div>
	<br />

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

				// 动态计算新闻列表文字样式
				auto_resize();
				$(window).resize(function() {
					auto_resize();
				});
				$('.am-list-thumb img').load(function() {
					auto_resize();
				});
				$('.pet_article_like li:last-child').css('border', 'none');

				function auto_resize() {
					$('.pet_list_one_nr').height($('.pet_list_one_img').height());
					// alert($('.pet_list_one_nr').height());
				}
				$('.pet_article_user').on('click', function() {
					if($('.pet_article_user_info_tab').hasClass('pet_article_user_info_tab_show')) {
						$('.pet_article_user_info_tab').removeClass('pet_article_user_info_tab_show').addClass('pet_article_user_info_tab_cloes');
					} else {
						$('.pet_article_user_info_tab').removeClass('pet_article_user_info_tab_cloes').addClass('pet_article_user_info_tab_show');
					}
				});

				$('.pet_head_gd_ico').on('click', function() {
					$('.pet_more_list').addClass('pet_more_list_show');
				});
				$('.pet_more_close').on('click', function() {
					$('.pet_more_list').removeClass('pet_more_list_show');
				});
			});
		</script>
</body>

</html>