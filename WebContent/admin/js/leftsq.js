layui.use([ 'layer', "jquery", 'element', 'table' ], function() {
	var $ = layui.jquery, element = layui.element, table = layui.table;
	var opensq = false;
	$('#sq').click(
			function() {
				if (!opensq) {
					opensq = true;
					if ($('#myleft').width() == 200) {
						$("#left-sq-i").text('');
						$("#left-cx").animate({
							opacity : '0.0'
						});
						$("#left-xj").animate({
							opacity : '0.0'
						});
						$("#menue12").animate({
							opacity : '0.0'
						});
						$("#myleft").animate({
							width : '50px'
						});
						$("#zb-find").animate({
							left : '50px'
						});
						$("#zb-find-body").animate({
							left : '50px'
						});
						$("#zb-add-body").animate({
							left : '50px'
						});
						$("#left-sq-i").removeClass("layui-icon-shrink-right");
						$("#left-sq-i").addClass("layui-icon-spread-left");
					} else {
						$("#left-sq-i").text(' 收起');
						$("#menue12").animate({
							opacity : '1'
						});
						$("#left-cx").animate({
							opacity : '1'
						});
						$("#left-xj").animate({
							opacity : '1'
						});
						$("#myleft").animate({
							width : '200px'
						});
						$("#zb-find").animate({
							left : '200px'
						});
						$("#zb-find-body").animate({
							left : '200px'
						});
						$("#zb-add-body").animate({
							left : '200px'
						});
						$("#left-sq-i").removeClass("layui-icon-spread-left");
						$("#left-sq-i").addClass("layui-icon-shrink-right");
					}

					setTimeout(function() {
						table.render({
							elem : '#warehouse',
							url : 'selectWarehouse?key=' + $("#key").val()
									+ '&' + $('#w_form').serialize(),
							cols : [ [ {
								field : 'w_number',
								title : '商品单号',
								sort : true
							}, {
								field : 'type',
								title : '类型',
								sort : true
							}, {
								field : 'brand',
								title : '品牌',
								sort : true
							}, {
								field : 'model',
								title : '型号',
								sort : true
							}, {
								field : 'date',
								title : '入库日期',
								sort : true
							}, {
								field : 'price',
								title : '进货价',
								sort : true
							}, {
								field : 'sellprice',
								title : '出货价',
								sort : true
							}, {
								field : 'number',
								title : '库存',
								sort : true
							} ] ],
							page : true
						});
						table.render({
							elem : '#pout',
							url : 'selectProductOut?key=' + $("#key").val()
									+ '&' + $('#pout_form').serialize(),
							cols : [ [ {
								field : 'out_number',
								title : '出库单号',
								sort : true
							}, {
								field : 'warranty_number',
								title : '保修单号',
								sort : true
							}, {
								field : 'type',
								title : '类型',
								sort : true
							}, {
								field : 'brand',
								title : '品牌',
								sort : true
							}, {
								field : 'model',
								title : '型号',
								sort : true
							}, {
								field : 'date',
								title : '记录日期',
								sort : true
							}, {
								field : 'price',
								title : '单价',
								sort : true
							}, {
								field : 'number',
								title : '数量',
								sort : true
							}, {
								field : 'customer_name',
								title : '客户姓名',
								sort : true
							}, {
								field : 'customer_phone',
								title : '客户电话',
								sort : true
							}, {
								field : 'recorder',
								title : '记录人',
								sort : true
							}, {
								field : 'salesman_name',
								title : '销售员',
								sort : true
							} , {
								title : '查看单据',
								fixed : 'right',
								align : 'center',
								toolbar : '#pout-bar'
							}] ],
							page : true
						});

						table.render({
							elem : '#pin',
							url : 'selectProductIn?key=' + $("#key").val()
									+ '&' + $('#pin_form').serialize(),
							cols : [ [ {
								field : 'in_number',
								title : '入库单号',
								sort : true
							}, {
								field : 'type',
								title : '类型',
								sort : true
							}, {
								field : 'brand',
								title : '品牌',
								sort : true
							}, {
								field : 'model',
								title : '型号',
								sort : true
							}, {
								field : 'date',
								title : '记录日期',
								sort : true
							}, {
								field : 'price',
								title : '单价',
								sort : true
							}, {
								field : 'number',
								title : '数量',
								sort : true
							}, {
								field : 'recorder',
								title : '记录人',
								sort : true
							} ] ],
							page : true
						});

						table.render({
							elem : '#rep',
							url : 'selectRepair?key=' + $("#key").val() + '&'
									+ $('#rep_form').serialize(),
							cols : [ [ {
								field : 'repair_number',
								title : '维修单号',
								sort : true
							}, {
								field : 'warranty_number',
								title : '保修单号',
								sort : true
							}, {
								field : 'type',
								title : '类型',
								sort : true
							}, {
								field : 'brand',
								title : '品牌',
								sort : true
							}, {
								field : 'model',
								title : '型号',
								sort : true
							}, {
								field : 'date',
								title : '记录日期',
								sort : true
							}, {
								field : 'problem',
								title : '问题描述',
								sort : true
							}, {
								field : 'customer_phone',
								title : ' 客户电话',
								sort : true
							}, {
								field : 'customer_name',
								title : '客户姓名',
								sort : true
							}, {
								field : 'recorder',
								title : '记录人',
								sort : true
							}, {
								field : 'state',
								title : '状态',
								sort : true
							} ] ],
							page : true
						});

						table.render({
							elem : '#gua',
							url : 'selectGuarantee?key=' + $("#key").val()
									+ '&' + $('#gua_form').serialize(),
							cols : [ [ {
								field : 'out_number',
								title : '出库单号',
								sort : true
							}, {
								field : 'warranty_number',
								title : '保修单号',
								sort : true
							}, {
								field : 'start_date',
								title : '开始日期',
								sort : true
							}, {
								field : 'end_date',
								title : '结束日期',
								sort : true
							}, {
								field : 'day',
								title : '保修天数(天)',
								sort : true
							}, {
								field : 'money',
								title : '入保金额(元)',
								sort : true
							}, {
								field : 'customer_phone',
								title : ' 客户电话',
								sort : true
							}, {
								field : 'customer_name',
								title : '客户姓名',
								sort : true
							}, {
								field : 'recorder',
								title : '记录人',
								sort : true
							} ] ],
							page : true
						});

						table.render({
							elem : '#acc',
							url : 'selectAccounting?key=' + $("#key").val()
									+ '&' + $('#acc_form').serialize(),
							cols : [ [ {
								field : 'account_number',
								title : '帐单号',
								sort : true
							}, {
								field : 'type',
								title : '类型',
								sort : true
							}, {
								field : 'date',
								title : '日期',
								sort : true
							}, {
								field : 'money',
								title : '金额(元)',
								sort : true
							}, {
								field : 'describe',
								title : '描述',
								sort : true
							}, {
								field : 'recorder',
								title : '记录人',
								sort : true
							} ] ],
							page : true
						});

						table.render({
							elem : '#sta',
							url : 'selectStaff?key=' + $("#key").val() + '&'
									+ $('#sta_form').serialize(),
							cols : [ [ {
								field : 'number',
								title : '工号',
								sort : true
							}, {
								field : 'name',
								title : '姓名',
								sort : true
							}, {
								field : 'phone',
								title : '电话',
								sort : true
							}, {
								field : 'address',
								title : '地址',
								sort : true
							}, {
								field : 'in_date',
								title : '入职日期',
								sort : true
							}, {
								field : 'post',
								title : '职位',
								sort : true
							}, {
								field : 'out_money',
								title : '累计出账金额',
								sort : true
							}, {
								field : 'stateString',
								title : '账号状态',
								sort : true
							} ] ],
							page : true
						});
						opensq = false;
					}, 500);
				}
			});
});