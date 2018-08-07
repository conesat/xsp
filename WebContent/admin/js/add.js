layui
		.use(
				[ 'form', 'layedit', 'layer', "jquery", 'laydate' ],
				function() {
					var form = layui.form, layer = layui.layer, layedit = layui.layedit, laydate = layui.laydate;
					var $ = layui.jquery;
					var layer = layui.layer;
					var myDate = new Date;
					// 创建一个编辑器
					var editIndex = layedit.build('LAY_demo_editor');
					var sell_mpdel = '';// 出售的型号
					var product_number = 0;
					var total_price = 0;// 产品加保修价格
					var all_price = 0;// 总价

					var is_hf = true;// 输入是否合法
					// 自定义格式
					laydate.render({
						elem : '#date',
						value : myDate.getFullYear() + "年"
								+ (myDate.getMonth() + 1) + "月"
								+ myDate.getDate() + '日',
						format : 'yyyy年MM月dd日',
						done : function(value, date) {
							$('#bddate')
									.html(
											date.year + "    年    "
													+ date.month + "    月    "
													+ date.date + '    日');
						}
					});

					laydate.render({
						elem : '#pin-date',
						value : myDate.getFullYear() + "年"
								+ (myDate.getMonth() + 1) + "月"
								+ myDate.getDate() + '日',
						format : 'yyyy年MM月dd日'
					});

					laydate.render({
						elem : '#acc-date',
						value : myDate.getFullYear() + "年"
								+ (myDate.getMonth() + 1) + "月"
								+ myDate.getDate() + '日',
						format : 'yyyy年MM月dd日'
					});

					laydate.render({
						elem : '#rep-date',
						value : myDate.getFullYear() + "年"
								+ (myDate.getMonth() + 1) + "月"
								+ myDate.getDate() + '日',
						format : 'yyyy年MM月dd日'
					});

					$('#bddate').html(
							myDate.getFullYear() + "    年    "
									+ (myDate.getMonth() + 1) + "    月    "
									+ myDate.getDate() + '    日');

					// 自定义验证规则
					form
							.verify({
								content : function(value) {
									layedit.sync(editIndex);
								},
								myouttypesel : function(value) {
									if (value == '') {
										return '请选择有效类型！';
									}
								},
								myoutbrandsel : function(value) {
									if (value == '') {
										return '请选择有效品牌！';
									}
								},
								myoutmodelsel : function(value) {
									if (value == '') {
										return '请选择有效型号！';
									}
								},
								pout_gua_money : function(value) {
									if (value == '') {
										if ($('#is_guarantee').is(':checked'))
											return '请输入保金额！';
									}
								},
								pout_guaday : function(value) {
									if (value == '') {
										if ($('#is_guarantee').is(':checked'))
											return '请输入保天数！';
									}
								},
								mypintypesel : function(value) {
									if (value == '') {
										return '请选择有效类型！';
									}
								},
								mypinbrandsel : function(value) {
									if (value == '') {
										return '请选择有效品牌！';
									}
								},
								mypinmodelsel : function(value) {
									if (value == '') {
										return '请选择有效型号！';
									}
								},
								myoutdate : function(value) {
									if (value == '') {
										return '请选择有效日期！';
									}
								},
								myindate : function(value) {
									if (value == '') {
										return '请选择有效日期！';
									}
								},
								myaccdate : function(value) {
									if (value == '') {
										return '请选择有效日期！';
									}
								},
								myacctype : function(value) {
									if (value == '') {
										return '请选择类型！';
									}
								},
								mypinprice : function(value) {
									if (value == '') {
										return '请输入进货单价！';
									} else if (!value
											.match('^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$')) {
										if (!value.match('^[1-9]\d*$')) {
											return '进货价格输入有误！';
										}
									}
								},
								myaccmoney : function(value) {
									if (value == '') {
										return '请输入金额！';
									} else if (!value
											.match('^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$')) {
										if (!value.match('^[1-9]\d*$')) {
											return '金额输入有误！';
										}
									}
								},
								mypinsellprice : function(value) {
									if (value == '') {
										return '请输入销售单价！';
									} else if (!value
											.match('^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$')) {
										if (!value.match('^[1-9]\d*$')) {
											return '销售价格输入有误！';
										}
									}
								},
								myoutprice : function(value) {
									if (!value
											.match('^[1-9]\d*\.\d*|0\.\d*[1-9]\d*$')) {
										if (!value.match('^[1-9]\d*$')) {
											return '价格输入有误！';
										}
									}
								},
								myoutnumber : function(value) {
									if (value > product_number
											|| product_number == 0) {
										return '库存不足！';
									}
								},
								myout_customer_name : function(value) {
									if (value == '') {
										return '请输入客户姓名！';
									}
								},
								myreptypesel : function(value) {
									if (value == '') {
										return '请选择类型！';
									}
								},
								myrepbrandsel : function(value) {
									if (value == '') {
										return '请选择品牌！';
									}
								},
								myrepmodelsel : function(value) {
									if (value == '') {
										return '请选择型号！';
									}
								},
								myrepdate : function(value) {
									if (value == '') {
										return '请选择日期！';
									}
								},
								myrep_customer_name : function(value) {
									if (value == '') {
										return '请输入客户姓名！';
									}
								},
								rep_warranty_number : function(value) {
									if (value == '') {
										if ($('#rep_is_guarantee').is(
												':checked'))
											return '请输入保单号！';
									}
								},
								rep_problem : function(value) {
									if (value == '') {
										return '请输入问题描述！';
									}
								}

							});

					// 监听指定开关
					form.on('switch(sfrb-switch)', function(data) {
						if (this.checked) {
							$("#rbdiv").show(500);
						} else {
							$("#rbdiv").hide(500);
						}
						setpmgg();
					});

					// 监听指定开关
					form.on('switch(rep-sfrb-switch)', function(data) {
						if (this.checked) {
							$("#rep_rbdiv").show(500);
						} else {
							$("#rep_rbdiv").hide(500);
						}
						setpmgg();
					});

					function setpmgg() {
						$('#bd-dj1').attr('value', $('#price').val());
						$('#bd-sl1').attr('value', $('#number').val());
						update_bd();
					}

					function update_bd() {
						if ($('#is_guarantee').is(':checked')) {
							$('#bd-pmgg1').attr(
									'value',
									sell_mpdel + '+ 保修('
											+ $('#day_number').val() + '天-金额'
											+ $('#money').val() + ')');
							total_price = $('#price').val()
									* $('#number').val()
									+ parseInt($('#money').val());
						} else {
							$('#bd-pmgg1').attr('value', sell_mpdel + '+未入保');
							total_price = $('#price').val()
									* $('#number').val();
						}
						jsje('1', total_price);
						total_jiage();
					}

					// 计算金额 wic哪一个 pri金额
					function jsje(wic, pri) {
						var pric2 = 0, pric3 = 0, pric4 = 0;
						pric2 = $('#bd-sl2').val() * $('#bd-dj2').val();
						pric3 = $('#bd-sl3').val() * $('#bd-dj3').val();
						pric4 = $('#bd-sl4').val() * $('#bd-dj4').val();
						all_price = total_price + pric2 + pric3 + pric4;
						all_price = Math.round(all_price * 100) / 100;
						if (isNaN(all_price)) {
							all_price = '';
							layer.open({
								title : '非法输入！',
								content : '您输入的数据有误！请检查！'
							});
							is_hf = false;
						} else {
							is_hf = true;
							for (var i = 0; i < 4; i++) {
								var temp = 10000;
								var num = 0;
								if (i == 1) {
									pri = pric2;
									wic = 2;
								} else if (i == 2) {
									pri = pric3;
									wic = 3;
								} else if (i == 3) {
									pri = pric4;
									wic = 4;
								}
								while (temp >= 0.01) {
									num = parseInt(pri / temp);
									pri = Math.round((pri % temp) * 100) / 100;
									if (num != 0) {
										switch (temp) {
										case 0.01:
											$('#bd-je-f' + wic).attr('value',
													num);
											break;
										case 0.1:
											$('#bd-je-j' + wic).attr('value',
													num);
											break;
										case 1:
											$('#bd-je-y' + wic).attr('value',
													num);
											break;
										case 10:
											$('#bd-je-s' + wic).attr('value',
													num);
											break;
										case 100:
											$('#bd-je-b' + wic).attr('value',
													num);
											break;
										case 1000:
											$('#bd-je-q' + wic).attr('value',
													num);
											break;
										case 10000:
											$('#bd-je-w' + wic).attr('value',
													num);
											break;
										}
									} else {
										switch (temp) {
										case 0.01:
											$('#bd-je-f' + wic).attr('value',
													'');
											break;
										case 0.1:
											$('#bd-je-j' + wic).attr('value',
													'');
											break;
										case 1:
											$('#bd-je-y' + wic).attr('value',
													'');
											break;
										case 10:
											$('#bd-je-s' + wic).attr('value',
													'');
											break;
										case 100:
											$('#bd-je-b' + wic).attr('value',
													'');
											break;
										case 1000:
											$('#bd-je-q' + wic).attr('value',
													'');
											break;
										case 10000:
											$('#bd-je-w' + wic).attr('value',
													'');
											break;
										}
									}
									temp = temp / 10;
								}
							}
						}
					}

					// 计算总价
					function total_jiage() {
						var temp = 10000;
						$('#bdtablexh').attr('value', all_price);
						for (var i = 0; i < 7; i++) {
							switch (parseInt(all_price / temp)) {
							case 0:
								getweizhi(temp, '零');
								break;
							case 1:
								getweizhi(temp, '壹');
								break;
							case 2:
								getweizhi(temp, '贰');
								break;
							case 3:
								getweizhi(temp, '叁');
								break;
							case 4:
								getweizhi(temp, '肆');
								break;
							case 5:
								getweizhi(temp, '伍');
								break;
							case 6:
								getweizhi(temp, '陆');
								break;
							case 7:
								getweizhi(temp, '柒');
								break;
							case 8:
								getweizhi(temp, '捌');
								break;
							case 9:
								getweizhi(temp, '玖');
								break;
							}
							all_price = all_price % temp;
							temp = temp / 10;

						}
					}
					function getweizhi(temp, text) {
						switch (temp) {
						case 0.01:
							$('#bdf').html(text);
							break;
						case 0.1:
							$('#bdj').html(text);
							break;
						case 1:
							$('#bdy').html(text);
							break;
						case 10:
							$('#bds').html(text);
							break;
						case 100:
							$('#bdb').html(text);
							break;
						case 1000:
							$('#bdq').html(text);
							break;
						case 10000:
							$('#bdw').html(text);
							break;
						}
					}

					$('#customer_name').on(
							'change',
							function() {
								$('#bdcustomer_name').html(
										'客户：' + $('#customer_name').val());
							});

					$('#customer_phone').on(
							'change',
							function() {
								$('#bdcustomer_phone').html(
										'电话：' + $('#customer_phone').val());
							});

					$('#date').on('change', function() {
						$('#bddate').html($('#date').value);
					});

					$('#day_number').on('change', function() {
						update_bd();
					});

					$('#money').on('change', function() {
						update_bd();
					});

					$('#bd-dj2').on('change', function() {
						$('#bd-dj2').attr('value', $('#bd-dj2').val());
						update_bd();
					});

					$('#bd-sl2').on('change', function() {
						$('#bd-sl2').attr('value', $('#bd-sl2').val());
						update_bd();
					});

					$('#bd-dj3').on('change', function() {
						$('#bd-dj3').attr('value', $('#bd-dj3').val());
						update_bd();
					});

					$('#bd-sl3').on('change', function() {
						$('#bd-sl3').attr('value', $('#bd-sl3').val());
						update_bd();
					});

					$('#bd-dj4').on('change', function() {
						$('#bd-dj4').attr('value', $('#bd-dj4').val());
						update_bd();
					});

					$('#bd-sl4').on('change', function() {
						$('#bd-sl4').attr('value', $('#bd-sl4').val());
						update_bd();
					});

					$('#bd-pmgg2').on('change', function() {
						$('#bd-pmgg2').attr('value', $('#bd-pmgg2').val());
					});
					$('#bd-dw2').on('change', function() {
						$('#bd-dw2').attr('value', $('#bd-dw2').val());
					});
					$('#bd-pmgg3').on('change', function() {
						$('#bd-pmgg3').attr('value', $('#bd-pmgg3').val());
					});
					$('#bd-dw3').on('change', function() {
						$('#bd-dw3').attr('value', $('#bd-dw3').val());
					});
					$('#bd-pmgg4').on('change', function() {
						$('#bd-pmgg4').attr('value', $('#bd-pmgg4').val());
					});
					$('#bd-dw4').on('change', function() {
						$('#bd-dw4').attr('value', $('#bd-dw4').val());
					});
					$('#bd-bz').on('change', function() {
						$('#bd-bz').html($('#bd-bz').val());
					});

					$('#djer').on('change', function() {
						$('#bd-djer').html("开单人：" + $('#djer').val());
					});

					$('#new-type').click(
							function() {
								$("#new-brand").removeClass("new-t-b-m2");
								$("#new-model").removeClass("new-t-b-m2");
								$("#new-type").removeClass("new-t-b-m2");
								$("#new-type").addClass("new-t-b-m2");
								$("#pout-form-newtype").attr("style",
										"display:block;");
								$("#pout-form-newbrand").attr("style",
										"display:none;");
								$("#pout-form-newmodel").attr("style",
										"display:none;");
							});

					$('#new-brand').click(
							function() {
								if ($('#mypintype').val() == '') {
									layer.msg("请先选择类型");
									return false;
								}
								$('#new-brand-lable-type').html(
										"所属类型:" + $('#mypintype').val());
								$("#new-brand").removeClass("new-t-b-m2");
								$("#new-model").removeClass("new-t-b-m2");
								$("#new-type").removeClass("new-t-b-m2");
								$("#new-brand").addClass("new-t-b-m2");
								$("#pout-form-newtype").attr("style",
										"display:none;");
								$("#pout-form-newbrand").attr("style",
										"display:block;");
								$("#pout-form-newmodel").attr("style",
										"display:none;");
							});

					$('#new-model').click(
							function() {
								if ($('#mypintype').val() == '') {
									layer.msg("请先选择类型");
									return false;
								} else if ($('#mypinbrand').val() == '') {
									layer.msg("请先选择品牌");
									return false;
								}
								$('#new-model-lable-type').html(
										"所属类型:" + $('#mypintype').val());
								$('#new-model-lable-brand').html(
										"所属品牌:" + $('#mypinbrand').val());
								$("#new-model").removeClass("new-t-b-m2");
								$("#new-brand").removeClass("new-t-b-m2");
								$("#new-type").removeClass("new-t-b-m2");
								$("#new-model").addClass("new-t-b-m2");
								$("#pout-form-newtype").attr("style",
										"display:none;");
								$("#pout-form-newbrand").attr("style",
										"display:none;");
								$("#pout-form-newmodel").attr("style",
										"display:block;");
							});

					$('#new-type-sub')
							.click(
									function() {
										if ($('#new-type-input').val() == '') {
											layer.msg("请输入类型");
										} else {
											$
													.ajax({
														type : 'post',
														url : "newType?type="
																+ $(
																		'#new-type-input')
																		.val(),
														async : false,
														success : function(data) {
															jsonData = JSON
																	.parse(data);
															if (jsonData.success == '100') {
																layer
																		.msg("已添加，请重新选择类型");
																resettype();
															} else {
																layer
																		.msg("失败，可能类型已存在");
															}
														},
														error : function(jqObj) {
															layer
																	.open({
																		title : '连接失败！',
																		content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
																	});
															return null;
														}
													});

										}
										return false;
									});

					$('#new-brand-sub')
							.click(
									function() {
										alert($('#new-brand-input').val()
												+ "&type="
												+ $('#mypintype').val());
										if ($('#new-brand-input').val() == '') {
											layer.msg("请输入品牌");
										} else {
											$
													.ajax({
														type : 'post',
														url : "newBrand?brand="
																+ $(
																		'#new-brand-input')
																		.val()
																+ "&type="
																+ $(
																		'#mypintype')
																		.val(),
														async : false,
														success : function(data) {
															jsonData = JSON
																	.parse(data);
															if (jsonData.success == '100') {
																layer
																		.msg("已添加，请重新选择类型");
																resettype();
															} else {
																layer
																		.msg("失败，可能品牌已存在");
															}
														},
														error : function(jqObj) {
															layer
																	.open({
																		title : '连接失败！',
																		content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
																	});
															return null;
														}
													});

										}
										return false;
									});

					$('#new-model-sub')
							.click(
									function() {
										if ($('#new-model-input').val() == '') {
											layer.msg("请输入型号");
										} else {
											$
													.ajax({
														type : 'post',
														url : "newModel?brand="
																+ $(
																		'#mypinbrand')
																		.val()
																+ "&type="
																+ $(
																		'#mypintype')
																		.val()
																+ "&model="
																+ $(
																		'#new-model-input')
																		.val(),
														async : false,
														success : function(data) {
															jsonData = JSON
																	.parse(data);
															if (jsonData.success == '100') {
																layer
																		.msg("已添加，请重新选择类型");
																resettype();
															} else {
																layer
																		.msg("失败，可能型号已存在");
															}
														},
														error : function(jqObj) {
															layer
																	.open({
																		title : '连接失败！',
																		content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
																	});
															return null;
														}
													});

										}
										return false;
									});

					function resettype() {
						$("#mypintype")
								.html("<option value=''>搜索或者选择</option>");
						$("#mypinbrand").html(
								"<option value=''>搜索或者选择</option>");
						$("#mypinmodel").html(
								"<option value=''>搜索或者选择</option>");
						$
								.ajax({
									type : "get",
									url : "gettype",
									async : false,
									success : function(data) {
										jsonData = JSON.parse(data);
										$('#pin_number').val(
												'in_' + jsonData.onumber);
										for (x in jsonData.typelist) { // 遍历JSON格式的数组取元素,
											// x代表下标
											var option = $("<option></option>")
													.text(jsonData.typelist[x]);
											$("#mypintype").append(option);
										}
										form.render('select');
									},
									error : function(jqObj) {
										layer
												.open({
													title : '连接失败！',
													content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
												});
									}
								});
					}

					$('#salesman_name').on(
							'change',
							function() {
								$('#bd-salesman_name').html(
										"收款人：" + $('#salesman_name').val());
							});

					$('#number').on('change', function() {
						$('#bd-sl1').val($('#number').val());
						total_price = $('#price').val() * $('#number').val();
						jsje('1', total_price);
						total_jiage();
					});
					$('#price').on('change', function() {
						$('#bd-dj1').val($('#price').val());
						total_price = $('#price').val() * $('#number').val();
						jsje('1', total_price);
						total_jiage();
					});

					$("#printfdj")
							.click(
									function() {
										var headhtml = "<html><head><title></title>"
												+ '<link rel="stylesheet" href="admin/layui/css/layui.css" media="all"><link rel="stylesheet" href="admin/css/index.css" /><link rel="stylesheet" href="admin/css/add.css" />'
												+ "<style type='text/css'>.my-biaodan h2 {width: 100%;text-align: center;font-family: '仿宋';font-size: 28px;font-weight: bold;}.my-biaodan-line2 {margin-left: 5px;margin-right: 5px;margin-top: 8px;margin-bottom: 8px;}.my-lable-date {font-family: '仿宋';font-size: 17px;font-weight: bold;float: right;}.my-lable {font-family: '仿宋';font-size: 17px;font-weight: bold;}.layui-table thead tr {background-color: #fbfbfb}.my-th {text-align: center;height: 25px;}.layui-table td, .layui-table th {padding: 4px 3px;border: 1px solid #000000;}</style></head><body style='background-color: #fbfbfb;'>";
										var foothtml = "<script type='text/javascript'>window.print();</script></body>";
										var newhtml = headhtml
												+ $("#my-biaodan").html()
												+ foothtml;
										var newWin = window.open('打印', '', '');
										newWin.document.write(newhtml);
										return false;
									});

					function selbrand(type_id, brand_id, model_id) {
						$("#" + model_id).html(
								"<option value=''>搜索或者选择</option>");
						$
								.ajax({
									type : "get",
									url : "getmodel?type="
											+ $("#" + type_id).val()
											+ "&brand="
											+ $("#" + brand_id).val(),
									async : false,
									success : function(data) {
										jsonData = JSON.parse(data);
										for (x in jsonData.brandlist) { // 遍历JSON格式的数组取元素,
											// x代表下标
											var option = $("<option></option>")
													.text(jsonData.brandlist[x]);
											$("#" + model_id).append(option);
										}
										form.render('select', model_id);
									},
									error : function(jqObj) {
										layer
												.open({
													title : '连接失败！',
													content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
												});
									}
								});
					}

					function seltype(type_id, brand_id, model_id) {
						$("#" + brand_id).html(
								"<option value=''>搜索或者选择</option>");
						$("#" + model_id).html(
								"<option value=''>搜索或者选择</option>");
						$
								.ajax({
									type : "get",
									url : "getbrand?type="
											+ $("#" + type_id).val(),
									async : false,
									success : function(data) {
										jsonData = JSON.parse(data);
										for (x in jsonData.brandlist) { // 遍历JSON格式的数组取元素,
											// x代表下标
											var option = $("<option></option>")
													.text(jsonData.brandlist[x]);
											$("#" + brand_id).append(option);
										}
										form.render('select', brand_id);
										form.render('select', model_id);
									},
									error : function(jqObj) {
										layer
												.open({
													title : '连接失败！',
													content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
												});
									}
								});
					}

					form.on('select(myouttypesel)', function(data) {
						sell_mpdel = $("#myouttype").val() + "-";
						seltype("myouttype", "myoutbrand", "myoutmodel");
					});

					form.on('select(myreptypesel)', function(data) {
						sell_mpdel = $("#myouttype").val() + "-";
						seltype("myreptype", "myrepbrand", "myrepmodel");
					});

					form.on('select(mypintypesel)', function(data) {
						seltype("mypintype", "mypinbrand", "mypinmodel");
						$('#new-brand-lable-type').html(
								"所属类型:" + $('#mypintype').val());
						$('#new-model-lable-type').html(
								"所属类型:" + $('#mypintype').val());
						$('#new-model-lable-brand').html("所属品牌:");
					});

					form.on('select(myoutbrandsel)', function(data) {
						sell_mpdel += $("#myoutbrand").val() + "-";
						selbrand("myouttype", "myoutbrand", "myoutmodel");
					});

					form.on('select(myrepbrandsel)', function(data) {
						sell_mpdel += $("#myrepbrand").val() + "-";
						selbrand("myreptype", "myrepbrand", "myrepmodel");
					});

					form.on('select(mypinbrandsel)', function(data) {
						selbrand("mypintype", "mypinbrand", "mypinmodel");
						$('#new-model-lable-brand').html(
								"所属品牌:" + $('#mypinbrand').val());
					});

					form
							.on(
									'select(myoutmodelsel)',
									function(data) {
										sell_mpdel += $("#myoutmodel").val();

										$
												.ajax({
													type : "get",
													url : "getWarehousePriceAndNumber?type="
															+ $("#myouttype")
																	.val()
															+ "&brand="
															+ $("#myoutbrand")
																	.val()
															+ "&model="
															+ $("#myoutmodel")
																	.val(),
													async : false,
													success : function(data) {
														jsonData = JSON
																.parse(data);
														$("#dqkc")
																.html(
																		"数量 : 库存 "
																				+ jsonData.warehouse.number);
														product_number = jsonData.warehouse.number;
														if (jsonData.warehouse.number > 0) {
															$("#number").val(
																	'1');
															$("#price")
																	.val(
																			jsonData.warehouse.sellprice);
														} else {
															$("#number").val(
																	'0');
															$("#price")
																	.val(
																			jsonData.warehouse.sellprice);

															layer
																	.open({
																		title : '库存不足！',
																		content : '该型号当前库存不足！'
																	});
														}
														setpmgg();// 设置品名规格
													},
													error : function(jqObj) {
														layer
																.open({
																	title : '连接失败！',
																	content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
																});
													}
												});
									});

					// 监听提交
					form
							.on(
									'submit(pout-form)',
									function(data) {
										if (!is_hf) {
											layer.open({
												title : '非法输入！',
												content : '您输入的数据有误！请检查！'
											});
										} else {
											$
													.ajax({
														url : "insertPout",// 提交地址
														data : $("#pout-form")
																.serialize()
																+ "&"
																+ $(
																		"#biaodan-form")
																		.serialize(),// 将表单数据序列化
														type : "POST",
														dataType : "json",
														success : function(
																result) {
															if (result.success == '100') {
																$(
																		'#sub-biaodan')
																		.attr(
																				"disabled",
																				true);
																$(
																		'#sub-biaodan')
																		.html(
																				"请刷新");
																layer
																		.open({
																			title : '完成',
																			content : '已添加！',
																			yes : function(
																					index,
																					layero) {
																				layer
																						.close(index); // 如果设定了yes回调，需进行手工关闭
																				window.location.href = "gotoIndex?num=8";
																			}
																		});
															} else {
																layer
																		.open({
																			title : '错误代码'
																					+ result.success,
																			content : '我们似乎遇到了一些问题！有可能该单号已存在！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																			yes : function(
																					index,
																					layero) {
																				layer
																						.close(index); // 如果设定了yes回调，需进行手工关闭
																				window.location.href = "gotoIndex?num=8";
																			}
																		});
															}
														},
														error : function(jqObj) {
															layer
																	.open({
																		title : '错误',
																		content : '我们似乎遇到了一些问题！这有可能是网络连接已断开！或者数据库已被关闭！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=8";
																		}
																	});
														}
													});
										}
										return false;
									});

					// 监听提交
					form
							.on(
									'submit(pin-form)',
									function(data) {
										$
												.ajax({
													url : "insertPin",// 提交地址
													data : $("#pin-form")
															.serialize(),// 将表单数据序列化
													type : "POST",
													dataType : "json",
													success : function(result) {
														if (result.success == '100') {
															$('#sub-pin').attr(
																	"disabled",
																	true);
															$('#sub-pin').html(
																	"请刷新");
															layer
																	.open({
																		title : '完成',
																		content : '已添加！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=9";
																		}
																	});
														} else {
															layer
																	.open({
																		title : '错误代码'
																				+ result.success,
																		content : '我们似乎遇到了一些问题！有可能该单号已存在！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=9";
																		}
																	});
														}
													},
													error : function(jqObj) {
														layer
																.open({
																	title : '错误',
																	content : '我们似乎遇到了一些问题！这有可能是网络连接已断开！或者数据库已被关闭！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																	yes : function(
																			index,
																			layero) {
																		layer
																				.close(index); // 如果设定了yes回调，需进行手工关闭
																		window.location.href = "gotoIndex?num=8";
																	}
																});
													}
												});

										return false;
									});

					// 监听提交
					form
							.on(
									'submit(acc-form)',
									function(data) {
										$
												.ajax({
													url : "insertAcc",// 提交地址
													data : $("#acc-form")
															.serialize(),// 将表单数据序列化
													type : "POST",
													dataType : "json",
													success : function(result) {
														if (result.success == '100') {
															$('#sub-acc').attr(
																	"disabled",
																	true);
															$('#sub-acc').html(
																	"请刷新");
															layer
																	.open({
																		title : '完成',
																		content : '已添加！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=11";
																		}
																	});
														} else {
															layer
																	.open({
																		title : '错误代码'
																				+ result.success,
																		content : '我们似乎遇到了一些问题！有可能该单号已存在！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=11";
																		}
																	});
														}
													},
													error : function(jqObj) {
														layer
																.open({
																	title : '错误',
																	content : '我们似乎遇到了一些问题！这有可能是网络连接已断开！或者数据库已被关闭！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																	yes : function(
																			index,
																			layero) {
																		layer
																				.close(index); // 如果设定了yes回调，需进行手工关闭
																		window.location.href = "gotoIndex?num=8";
																	}
																});
													}
												});

										return false;
									});

					// 监听提交
					form
							.on(
									'submit(rep-form)',
									function(data) {
										$
												.ajax({
													url : "insertRep",// 提交地址
													data : $("#rep-form")
															.serialize(),// 将表单数据序列化
													type : "POST",
													dataType : "json",
													success : function(result) {
														if (result.success == '100') {
															$('#sub-rep').attr(
																	"disabled",
																	true);
															$('#sub-rep').html(
																	"请刷新");
															layer
																	.open({
																		title : '完成',
																		content : '已添加！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=10";
																		}
																	});
														} else if (result.success == '201') {
															layer
																	.open({
																		title : '错误代码'
																				+ result.success,
																		content : '不存在的保单！',

																	});
														} else if (result.success == '202') {
															layer
																	.open({
																		title : '错误代码'
																				+ result.success,
																		content : '过期的保单！',

																	});
														} else {
															layer
																	.open({
																		title : '错误代码'
																				+ result.success,
																		content : '我们似乎遇到了一些问题！有可能该单号已存在！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																		yes : function(
																				index,
																				layero) {
																			layer
																					.close(index); // 如果设定了yes回调，需进行手工关闭
																			window.location.href = "gotoIndex?num=10";
																		}
																	});
														}
													},
													error : function(jqObj) {
														layer
																.open({
																	title : '错误',
																	content : '我们似乎遇到了一些问题！这有可能是网络连接已断开！或者数据库已被关闭！点击‘确定’将刷新，否则您可以点击右上角的X按钮，然后重新尝试提交数据！',
																	yes : function(
																			index,
																			layero) {
																		layer
																				.close(index); // 如果设定了yes回调，需进行手工关闭
																		window.location.href = "gotoIndex?num=10";
																	}
																});
													}
												});
										return false;
									});

				});
