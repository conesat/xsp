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
<link rel="stylesheet" href="css/shouji.css" />
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
			<div class="pet_news_list_tag_name">文件收集管理</div>

			</header>
		</div>

		<div class="pet_circle_nav">
			<ul class="pet_circle_nav_list">
				<li><a href="gotoXinjianshouji"
					class="  pet_nav_xinxianshi icon-fabu"></a><span>新建收集</span></li>
				<li><a href="gotoGuanliuser"
					class="  pet_nav_zhangzhishi  am-icon-users"></a><span>管理名单</span></li>
			</ul>
		</div>

		<div class="pet_content pet_content_list pet_hd">
			<div class="pet_article_like">
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">任务列表</div>
					<div class="am-panel-bd">
						<div class="pet_content_main pet_article_like_delete">
							<div data-am-widget="list_news"
								class="am-list-news am-list-news-default am-no-layout">
								<div class="am-list-news-bd">
									<ul class="am-list">
										<c:forEach items="${tasks}" var="task" varStatus="status">
											<li
												class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-right pet_hd_list">
												<div class="am-u-sm-10">
													<a
														href="gotoShoujixiangxi?id=${task.id}&state=${task.state}"
														class="pet_hd_block">
														<div class="pet_hd_block_title">${task.title}</div>
														<div class="pet_hd_block_map">${task.content}</div> <c:if
															test="${task.state=='收集中'}">
															<div class="pet_hd_block_tag">
																<span class="hd_tag_jh">收集中</span> ${task.end}
															</div>
														</c:if> <c:if test="${task.state=='收集完成'}">
															<div class="pet_hd_block_tag">
																<span class="hd_tag_js">收集完成</span> ${task.end}
															</div>
														</c:if> <c:if test="${task.state=='已过期'}">
															<div class="pet_hd_block_tag">
																<span class="hd_tag_jr"
																	style="padding-right: 4px; padding-left: 4px; width: initial;">已过期即将清除</span>
																${task.end}
															</div>
														</c:if>
													</a>
												</div> <c:if test="${task.state=='收集中'}">
													<div class="am-u-sm-2" align="right">
														<a onclick="ewm('${task.id}')"
															class="am-icon-btn am-icon-qrcode"></a>
													</div>
												</c:if> <c:if test="${task.state=='收集完成'}">
													<div class="am-u-sm-2" align="right">
														<a
															href="gotoDownloadPack?id=${task.id}&state=${task.state}"
															class="am-icon-btn am-icon-download"></a>
													</div>
												</c:if> <c:if test="${task.state=='已过期'}">
													<div class="am-u-sm-2" align="right">
														<a
															href="gotoDownloadPack?id=${task.id}&state=${task.state}"
															class="am-icon-btn am-icon-download"></a>
													</div>
												</c:if>


											</li>
										</c:forEach>

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm1"
		style="top: 20%;">
		<div class="am-modal-dialog">
			<div id="cz-name" class="am-modal-hd">扫码提交</div>
			<div class="am-modal-bd">
				<div id="doc-qrcode" class="am-text-center"></div>
				<div>
					链接： <a id="lianjie"></a>
				</div>
			</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn" data-am-modal-confirm>确定</span>
			</div>
		</div>
	</div>
	<div class="pet_article_footer_info">Copyright(c)2018 hg All
		Rights Reserved</div>
	<script src="js/jquery.min.js"></script>
	<script src="js/amazeui.min.js"></script>
	<script>
		var $input = $('#doc-qr-text');
		$qr = $('#doc-qrcode');

		function makeCode(text) {
			$qr.empty().qrcode({
				text : text, // 要生产二维码的文字
				render : "canvas", // 渲染方式，默认的选择顺序为 `canvas` -> `svg` -> `table`
				width : 200, // 二维码宽度 `px`
				height : 200, // 二维码高度 `px`
				correctLevel : 3, // 纠错级别，可取 0、1、2、3，数字越大说明所需纠错级别越大
				background : "#f8f8f8", // 背景色
				foreground : "#000000" // 前景色
			});
		}

		$input.val(location.href);

		function ewm(sjma) {
			makeCode('http://www.chinahg.top/xsp/gotoShoujiye?id=' + sjma);
			$('#lianjie').html(
					'http://www.chinahg.top/xsp/gotoShoujiye?id=' + sjma);
			$('#my-confirm1').modal({
				relatedTarget : this,
				closeOnConfirm : true
			});
		};
	</script>
</body>

</html>