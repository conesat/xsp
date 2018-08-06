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
<link rel="stylesheet" href="css/wap.css?2">
<link rel="stylesheet" href="css/index.css" />
<title>学生派首页</title>
</head>

<body>
	<div data-am-widget="gotop" class="am-gotop am-gotop-fixed">
		<a href="#top" title=""> <img class="am-gotop-icon-custom"
			src="img/goTop.png" />
		</a>
	</div>

	<div class="pet_mian" id="top">
		<div class="">
			<header data-am-widget="header"
				class="am-header am-header-default pet_head_block">
			<div class="pet_news_list_tag_name">学生派</div>
			<div class="am-header-right am-header-nav ">
				<a href="gotoLogin" class="am-icon-user">登录|注册</a>
			</div>
			</header>
		</div>
		<div data-am-widget="slider" class="am-slider am-slider-a1"
			data-am-slider='{"directionNav":false}'>
			<ul class="am-slides">
				<li><img src="img/fl01.png">
					<div class="pet_slider_font">
						<span class="pet_slider_emoji"> 学生派 </span> <span>学生派开发准备阶段</span>
					</div>
					<div class="pet_slider_shadow"></div></li>
				<li><img src="img/fl02.png">
					<div class="pet_slider_font">
						<span class="pet_slider_emoji"> 红格要闻 </span> <span>手机app“托儿
							”进入设计阶段</span>
					</div>
					<div class="pet_slider_shadow"></div></li>
				<li><img src="img/fl03.png">
					<div class="pet_slider_font">
						<span class="pet_slider_emoji"> </span> <span>《星际争霸2:虚空之遗》国服过审!</span>
					</div>
					<div class="pet_slider_shadow"></div></li>
			</ul>
		</div>

		<div class="pet_circle_nav">

			<ul class="pet_circle_nav_list">
				<li><a href="gotoShouji" class="  pet_nav_xinxianshi icon-fabu"></a><span>收集</span></li>
				<li><a id="doc-confirm-toggle"
					class="pet_nav_zhangzhishi icon-tijiao"></a><span>提交</span></li>
				<li><a href="" class="  pet_nav_kantuya icon-xinwen"></a><span>新闻</span></li>
				<li><a href="" class="  pet_nav_mengzhuanti icon-zhoubian"></a><span>周边</span></li>
				<li><a href="" class="  pet_nav_meirong icon-dongtai"></a><span>动态</span></li>
				<li><a href="" class="  pet_nav_yiyuan icon-banji"></a><span>班级</span></li>
				<li><a href="" class="  pet_nav_dianpu icon-guanyu"></a><span>关于</span></li>
			</ul>
			<blockquote>
				<p class="my_blockquote">软件开发学习资料</p>
			</blockquote>
			<ul class="pet_circle_nav_list">
				<li><a href="gotoShouji" class="  pet_nav_xinxianshi icon-anzhuo"></a><span>安卓</span></li>
				<li><a id="doc-confirm-toggle"
					class="pet_nav_zhangzhishi icon-java"></a><span>java</span></li>
				<li><a href="" class="  pet_nav_kantuya icon-java_web"></a><span>jee</span></li>
				<li><a href="" class="  pet_nav_mengzhuanti icon-qianduan"></a><span>前端</span></li>
				<li><a href="" class="  pet_nav_meirong icon-c_c"></a><span>c/c++</span></li>
				<li><a href="" class="  pet_nav_yiyuan icon-net"></a><span>.net</span></li>
			</ul>
			<blockquote>
				<p class="my_blockquote">帮助我们</p>
			</blockquote>
			<ul class="pet_circle_nav_list">
				<li><a href="gotoShouji" class="  pet_nav_xinxianshi icon-renminbi"></a><span>捐助作者</span></li>
				<li><a id="doc-confirm-toggle"
					class="pet_nav_zhangzhishi icon-jiaruwomen"></a><span>加入我们</span></li>
				<li><a href="" class="  pet_nav_kantuya icon-lianxiwomen"></a><span>联系我们</span></li>
			</ul>
		</div>

		<div class="pet_article_dowload pet_dowload_more_top_off">
			<div class="pet_article_dowload_title">关于学生派</div>
			<div class="pet_article_dowload_content pet_dowload_more_top_bg">
				<div class="pet_article_dowload_triangle pet_dowload_more_top_san"></div>
				<div class="pet_article_dowload_ico">
					<img src="imgs/hglogo.png" alt="">
				</div>
				<div class="pet_article_dowload_content_font">power by
					广西科技大学红格互联：提供一个方便学生自助管理，提高学习生活效率 的工具</div>
				<div class="pet_article_dowload_all">
					<a href="###" class="pet_article_dowload_Az am-icon-apple"> App
						store</a> <a href="###" class="pet_article_dowload_Pg am-icon-android">
						Android</a>
				</div>
			</div>
			<div class="pet_article_footer_info">Copyright(c)2015 hg All
				Rights Reserved</div>
		</div>
	</div>
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		<div class="am-modal-dialog">
			<div class="am-panel am-panel-default">
				<div class="am-panel-hd">您的支持使我们最大的动力</div>
				<div class="am-panel-bd">
					<div data-am-widget="tabs" class="am-tabs am-tabs-default">
						<ul class="am-tabs-nav am-cf">
							<li class="am-active"><a href="[data-tab-panel-0]">QQ</a></li>
							<li class=""><a href="[data-tab-panel-1]">微信</a></li>
							<li class=""><a href="[data-tab-panel-2]">支付宝</a></li>
						</ul>
						<div class="am-tabs-bd">
							<div data-tab-panel-0 class="am-tab-panel am-active">
								<img src="imgs/jz/jzqq.png" alt="..."
									class="am-img-thumbnail am-radius">
							</div>
							<div data-tab-panel-1 class="am-tab-panel ">
								<img src="imgs/jz/jzweixin.png" alt="..."
									class="am-img-thumbnail am-radius">
							</div>
							<div data-tab-panel-2 class="am-tab-panel ">
								<img src="imgs/jz/jzzfb.png" alt="..."
									class="am-img-thumbnail am-radius">
							</div>
						</div>
					</div>

				</div>
			</div>

			<div class="am-modal-footer">
				<span class="am-modal-btn">确定</span>
			</div>
		</div>
	</div>

	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">提交文件</div>
			<div class="am-modal-bd">
				<p>
					<input type="text" class="am-form-field am-radius"
						placeholder="输入收集码" />
				</p>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
					class="am-modal-btn" data-am-modal-confirm>确定</span>
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

					$('.am-list > li:last-child').css('border', 'none');

					function auto_resize() {
						$('.pet_list_one_nr').height($('.pet_list_one_img').height());

					}
					$('.pet_nav_gengduo').on('click', function() {
						$('.pet_more_list').addClass('pet_more_list_show');
					});
					$('.pet_more_close').on('click', function() {
						$('.pet_more_list').removeClass('pet_more_list_show');
					});

					$('#doc-modal-list').find('.am-icon-close').add('#doc-confirm-toggle').
					on('click', function() {
						$('#my-confirm').modal({
							relatedTarget: this,
							onConfirm: function(options) {
								window.location.href="gotoShoujiye";
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
					});
					
				});
			</script>
</body>

</html>