layui.use([ 'layer', "jquery", 'element', 'table', 'form' ], function() {
	var table = layui.table;
	var layer = layui.layer;
	var $ = layui.jquery;
	var form = layui.form;
	var menue = 0;// 菜单选择
	// 点击左侧菜单事件
	function init() {
		var left = $('#left-value').val();
		if (left == '') {
			left = 0;
		}
		$('#menue' + left).addClass('layui-this');
		menue = parseInt(left);
	}

	function showmenue() {
		if (!isNaN(menue)) {
			history.pushState({}, "ncsm 尼创商贸", "gotoIndex?num=" + menue);
		}
		if (menue < 8) {
			$("#find").attr("style", "display:block;");
			$("#add").attr("style", "display:none;");
			switch (menue) {
			case 0:
				$("#div0").attr("style", "display:block;");
				$("#div1").attr("style", "display:block;");
				$("#div2").attr("style", "display:block;");
				$("#div3").attr("style", "display:block;");
				$("#div4").attr("style", "display:block;");
				$("#div5").attr("style", "display:block;");
				$("#div6").attr("style", "display:block;");
				break;
			case 1:
				$("#div0").attr("style", "display:block;");
				$("#div1").attr("style", "display:none;");
				$("#div2").attr("style", "display:none;");
				$("#div3").attr("style", "display:none;");
				$("#div4").attr("style", "display:none;");
				$("#div5").attr("style", "display:none;");
				$("#div6").attr("style", "display:none;");
				break;
			case 2:
				$("#div0").attr("style", "display:none;");
				$("#div1").attr("style", "display:block;");
				$("#div2").attr("style", "display:none;");
				$("#div3").attr("style", "display:none;");
				$("#div4").attr("style", "display:none;");
				$("#div5").attr("style", "display:none;");
				$("#div6").attr("style", "display:none;");
				break;
			case 3:
				$("#div0").attr("style", "display:none;");
				$("#div1").attr("style", "display:none;");
				$("#div2").attr("style", "display:block;");
				$("#div3").attr("style", "display:none;");
				$("#div4").attr("style", "display:none;");
				$("#div5").attr("style", "display:none;");
				$("#div6").attr("style", "display:none;");
				break;
			case 4:
				$("#div0").attr("style", "display:none;");
				$("#div1").attr("style", "display:none;");
				$("#div2").attr("style", "display:none;");
				$("#div3").attr("style", "display:block;");
				$("#div4").attr("style", "display:none;");
				$("#div5").attr("style", "display:none;");
				$("#div6").attr("style", "display:none;");
				break;
			case 5:
				$("#div0").attr("style", "display:none;");
				$("#div1").attr("style", "display:none;");
				$("#div2").attr("style", "display:none;");
				$("#div3").attr("style", "display:none;");
				$("#div4").attr("style", "display:block;");
				$("#div5").attr("style", "display:none;");
				$("#div6").attr("style", "display:none;");
				break;
			case 6:
				$("#div0").attr("style", "display:none;");
				$("#div1").attr("style", "display:none;");
				$("#div2").attr("style", "display:none;");
				$("#div3").attr("style", "display:none;");
				$("#div4").attr("style", "display:none;");
				$("#div5").attr("style", "display:block;");
				$("#div6").attr("style", "display:none;");
				break;
			case 7:
				$("#div0").attr("style", "display:none;");
				$("#div1").attr("style", "display:none;");
				$("#div2").attr("style", "display:none;");
				$("#div3").attr("style", "display:none;");
				$("#div4").attr("style", "display:none;");
				$("#div5").attr("style", "display:none;");
				$("#div6").attr("style", "display:block;");
				break;
			}
		} else {
			$("#find").attr("style", "display:none;");
			$("#add").attr("style", "display:block;");
			switch (menue) {
			case 8:
				$("#myouttype").html("<option value=''>搜索或者选择</option>");
				$("#myoutbrand").html("<option value=''>搜索或者选择</option>");
				$("#myoutmodel").html("<option value=''>搜索或者选择</option>");
				$.ajax({
					type : "get",
					url : "gettype",
					async : false,
					success : function(data) {
						jsonData = JSON.parse(data);
						$('#out_number').val('out_' + jsonData.onumber);
						$('#bao_number').val('bao_' + jsonData.onumber);
						for (x in jsonData.typelist) { // 遍历JSON格式的数组取元素, x代表下标
							var option = $("<option></option>").text(
									jsonData.typelist[x]);
							$("#myouttype").append(option);
						}
						form.render('select');
					},
					error : function(jqObj) {
						layer.open({
							title : '连接失败！',
							content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
						});
					}
				});
				$("#add1").attr("style", "display:block;");
				$("#add2").attr("style", "display:none;");
				$("#add3").attr("style", "display:none;");
				$("#add4").attr("style", "display:none;");
				$("#add5").attr("style", "display:none;");
				break;
			case 9:
				$("#mypintype").html("<option value=''>搜索或者选择</option>");
				$("#mypinbrand").html("<option value=''>搜索或者选择</option>");
				$("#mypinmodel").html("<option value=''>搜索或者选择</option>");
				$.ajax({
					type : "get",
					url : "gettype",
					async : false,
					success : function(data) {
						jsonData = JSON.parse(data);
						$('#pin_number').val('in_' + jsonData.onumber);
						for (x in jsonData.typelist) { // 遍历JSON格式的数组取元素, x代表下标
							var option = $("<option></option>").text(
									jsonData.typelist[x]);
							$("#mypintype").append(option);
						}
						form.render('select');
					},
					error : function(jqObj) {
						layer.open({
							title : '连接失败！',
							content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
						});
					}
				});
				$("#add1").attr("style", "display:none;");
				$("#add2").attr("style", "display:block;");
				$("#add3").attr("style", "display:none;");
				$("#add4").attr("style", "display:none;");
				$("#add5").attr("style", "display:none;");
				break;
			case 10:
				$("#myreptype").html("<option value=''>搜索或者选择</option>");
				$("#myrepbrand").html("<option value=''>搜索或者选择</option>");
				$("#myrepmodel").html("<option value=''>搜索或者选择</option>");
				$.ajax({
					type : "get",
					url : "gettype",
					async : false,
					success : function(data) {
						jsonData = JSON.parse(data);
						$('#rep_number').val('rep_' + jsonData.onumber);
						for (x in jsonData.typelist) { // 遍历JSON格式的数组取元素, x代表下标
							var option = $("<option></option>").text(
									jsonData.typelist[x]);
							$("#myreptype").append(option);
						}
						form.render('select');
					},
					error : function(jqObj) {
						layer.open({
							title : '连接失败！',
							content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
						});
					}
				});
				$("#add1").attr("style", "display:none;");
				$("#add2").attr("style", "display:none;");
				$("#add3").attr("style", "display:block;");
				$("#add4").attr("style", "display:none;");
				$("#add5").attr("style", "display:none;");
				break;
			case 11:
				$.ajax({
					type : "get",
					url : "gettype",
					async : false,
					success : function(data) {
						jsonData = JSON.parse(data);
						$('#acc_number').val('acc_' + jsonData.onumber);
					},
					error : function(jqObj) {
						layer.open({
							title : '连接失败！',
							content : '对不起！我们无法获取数据！请重新尝试！如多次尝试仍无法恢复请联系我们！'
						});
					}
				});
				$("#add1").attr("style", "display:none;");
				$("#add2").attr("style", "display:none;");
				$("#add3").attr("style", "display:none;");
				$("#add4").attr("style", "display:block;");
				$("#add5").attr("style", "display:none;");
				break;
			case 12:
				$("#add1").attr("style", "display:none;");
				$("#add2").attr("style", "display:none;");
				$("#add3").attr("style", "display:none;");
				$("#add4").attr("style", "display:none;");
				$("#add5").attr("style", "display:block;");
				break;
			}
		}

	}
	// 查询
	function selectW() {
		var key = $("#key").val();
		var w_form = $('#w_form').serialize();
		var pout_form = $('#pout_form').serialize();
		var pin_form = $('#pin_form').serialize();
		var rep_form = $('#rep_form').serialize();
		var gua_form = $('#gua_form').serialize();
		var acc_form = $('#acc_form').serialize();
		var sta_form = $('#sta_form').serialize();
		if (w_form == '' && (menue == 0 || menue == 1)) {
			layer.msg('请勾选“仓库”需要搜索的内容！', {
				icon : 5
			});
		} else if (pout_form == '' && (menue == 0 || menue == 2)) {
			layer.msg('请勾选“出库记录”需要搜索的内容！', {
				icon : 5
			});
		} else if (pin_form == '' && (menue == 0 || menue == 3)) {
			layer.msg('请勾选“入库记录”需要搜索的内容！', {
				icon : 5
			});
		} else if (rep_form == '' && (menue == 0 || menue == 4)) {
			layer.msg('请勾选“维修记录”需要搜索的内容！', {
				icon : 5
			});
		} else if (gua_form == '' && (menue == 0 || menue == 5)) {
			layer.msg('请勾选“保单记录”需要搜索的内容！', {
				icon : 5
			});
		} else if (acc_form == '' && (menue == 0 || menue == 6)) {
			layer.msg('请勾选“账单记录”需要搜索的内容！', {
				icon : 5
			});
		} else if (sta_form == '' && (menue == 0 || menue == 7)) {
			layer.msg('请勾选“账单记录”需要搜索的内容！', {
				icon : 5
			});
		} else {
			if (menue == 0 || menue == 1) {
				table.reload('warehouse', {
					url : 'selectWarehouse?key=' + key + '&' + w_form
				});
			}
			if (menue == 0 || menue == 2) {
				table.reload('pout', {
					url : 'selectProductOut?key=' + key + '&' + pout_form
				});
			}
			if (menue == 0 || menue == 3) {
				table.reload('pin', {
					url : 'selectProductIn?key=' + key + '&' + pin_form
				});
			}
			if (menue == 0 || menue == 4) {
				table.reload('rep', {
					url : 'selectRepair?key=' + key + '&' + rep_form
				});
			}
			if (menue == 0 || menue == 5) {
				table.reload('gua', {
					url : 'selectGuarantee?key=' + key + '&' + gua_form
				});
			}
			if (menue == 0 || menue == 6) {
				table.reload('acc', {
					url : 'selectAccounting?key=' + key + '&' + acc_form
				});
			}
			if (menue == 0 || menue == 7) {
				table.reload('sta', {
					url : 'selectStaff?key=' + key + '&' + sta_form
				});
			}
		}
	}
	//
	table.render({
		elem : '#warehouse',
		url : 'selectWarehouse?key=&' + $('#w_form').serialize(),
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
		}] ],
		page : true
	});

	table.render({
		elem : '#pout',
		url : 'selectProductOut?key=&' + $('#pout_form').serialize(),
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
		}, {
			title : '操作',
			fixed : 'right',
			align : 'center',
			toolbar : '#pout-bar'
		} ] ],
		page : true
	});

	table.render({
		elem : '#pin',
		url : 'selectProductIn?key=&' + $('#pin_form').serialize(),
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
		}, {
			title : '操作',
			fixed : 'right',
			align : 'center',
			toolbar : '#del'
		} ] ],
		page : true
	});

	table.render({
		elem : '#rep',
		url : 'selectRepair?key=&' + $('#rep_form').serialize(),
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
		} , {
			title : '操作',
			fixed : 'right',
			align : 'center',
			toolbar : '#del'
		}] ],
		page : true
	});

	table.render({
		elem : '#gua',
		url : 'selectGuarantee?key=&' + $('#gua_form').serialize(),
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
		url : 'selectAccounting?key=&' + $('#acc_form').serialize(),
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
		}, {
			title : '操作',
			fixed : 'right',
			align : 'center',
			toolbar : '#del'
		} ] ],
		page : true
	});

	table.render({
		elem : '#sta',
		url : 'selectStaff?key=&' + $('#sta_form').serialize(),
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
	// 事件绑定
	/* 左侧菜单 */
	$("#menue0").click(function() {
		menue = 0;
		showmenue();
	});

	$("#menue1").click(function() {
		menue = 1;
		showmenue();
	});

	$("#menue2").click(function() {
		menue = 2;
		showmenue();
	});

	$("#menue3").click(function() {
		menue = 3;
		showmenue();
	});

	$("#menue4").click(function() {
		menue = 4;
		showmenue();
	});

	$("#menue5").click(function() {
		menue = 5;
		showmenue();
	});

	$("#menue6").click(function() {
		menue = 6;
		showmenue();
	});

	$("#menue7").click(function() {
		menue = 7;
		showmenue();
	});

	$("#menue8").click(function() {
		menue = 8;
		showmenue();
	});

	$("#menue9").click(function() {
		menue = 9;
		showmenue();
	});

	$("#menue10").click(function() {
		menue = 10;
		showmenue();
	});

	$("#menue11").click(function() {
		menue = 11;
		showmenue();
	});

	$("#menue12").click(function() {
		menue = 12;
		showmenue();
	});
	/* 左侧菜单 */
	$("#search").click(function() {
		selectW();
	});

	$('#key').bind('keypress', function(event) {
		if (event.keyCode == "13") {
			selectW();
		}
	});

	table.on('sort(w_table)', function(obj) {
		table.reload('warehouse', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	table.on('sort(pout_table)', function(obj) {
		table.reload('pout', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	table.on('sort(pin_table)', function(obj) {
		table.reload('pin', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	table.on('sort(rep_table)', function(obj) {
		table.reload('rep', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	table.on('sort(gua_table)', function(obj) {
		table.reload('gua', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	table.on('sort(acc_table)', function(obj) {
		table.reload('acc', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	table.on('sort(sta_table)', function(obj) {
		table.reload('sta', {
			initSort : obj // 记录初始排序，如果不设的话，将无法标记表头的排序状态。 layui 2.1.1 新增参数
			,
			where : { // 请求参数（注意：这里面的参数可任意定义，并非下面固定的格式）
				field : obj.field // 排序字段
				,
				order : obj.type
			// 排序方式
			}
		});
	});

	//监听工具条
	table.on('tool(pout_table)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data //获得当前行数据
		, layEvent = obj.event; //获得 lay-event 对应的值
		if (layEvent === 'detail') {
			//data.out_number;
			//通过这种方式弹出的层，每当它被选择，就会置顶。
			layer.open({
				type : 2,
				shade : false,
				area : [ '970px', '510px' ],
				maxmin : true,
				content : 'gotoBiaodan?out_number=' + data.out_number,
				zIndex : layer.zIndex, //重点1
				success : function(layero) {
					layer.setTop(layero); //重点2
				}
			});
		} else if (layEvent === 'del') {
			//data.out_number;
			//通过这种方式弹出的层，每当它被选择，就会置顶。
			if($('#staff_name').val()==data.recorder || $('#staff_name').val()=="系统管理员"){
				layer.open({
					type : 2,
					shade : false,
					area : [ '400px', '300px' ],
					maxmin : true,
					content : 'gotodelect?msg=删除出库记录将同步删除单号对应的账单和保修，会导致财务和产品库存的变化，此操作无法恢复！！请确认是否继续？&&number='+ data.out_number+'&&url=delectPout',
					zIndex : layer.zIndex, //重点1
					success : function(layero) {
						layer.setTop(layero); //重点2
					}
				});
				
			}else{
				layer.msg("无权操作");
			}
		}
	});

	//监听工具条
	table.on('tool(pin_table)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data //获得当前行数据
		, layEvent = obj.event; //获得 lay-event 对应的值
		if (layEvent === 'del') {
			//data.out_number;
			//通过这种方式弹出的层，每当它被选择，就会置顶。
			if($('#staff_name').val()==data.recorder || $('#staff_name').val()=="系统管理员"){
				layer.open({
					type : 2,
					shade : false,
					area : [ '400px', '300px' ],
					maxmin : true,
					content : 'gotodelect?msg=删除入库记录将同步删除单号对应的账单，会导致财务和产品库存的变化，此操作无法恢复！！请确认是否继续？&&number='+ data.in_number+'&&url=delectPin',
					zIndex : layer.zIndex, //重点1
					success : function(layero) {
						layer.setTop(layero); //重点2
					}
				});
			}else{
				layer.msg("无权操作");
			}
		}
	});
	
	table.on('tool(rep_table)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data //获得当前行数据
		, layEvent = obj.event; //获得 lay-event 对应的值
		if (layEvent === 'del') {
			//data.out_number;
			//通过这种方式弹出的层，每当它被选择，就会置顶。
			if($('#staff_name').val()==data.recorder || $('#staff_name').val()=="系统管理员"){
				layer.open({
					type : 2,
					shade : false,
					area : [ '400px', '300px' ],
					maxmin : true,
					content : 'gotodelect?msg=删除维修记录将无法恢复，此操作无法恢复！！请确认是否继续？&&number='+ data.repair_number+'&&url=delectRep',
					zIndex : layer.zIndex, //重点1
					success : function(layero) {
						layer.setTop(layero); //重点2
					}
				});
				
			}else{
				layer.msg("无权操作");
			}
		}
	});
	
	table.on('tool(acc_table)', function(obj) { //注：tool是工具条事件名，test是table原始容器的属性 lay-filter="对应的值"
		var data = obj.data //获得当前行数据
		, layEvent = obj.event; //获得 lay-event 对应的值
		if (layEvent === 'del') {
			//data.out_number;
			//通过这种方式弹出的层，每当它被选择，就会置顶。
			if($('#staff_name').val()==data.recorder || $('#staff_name').val()=="系统管理员"){
				layer.open({
					type : 2,
					shade : false,
					area : [ '400px', '300px' ],
					maxmin : true,
					content : 'gotodelect?msg=删除账单会导致财务的变化，甚至影响出入库的匹配信息，如果您出入库记录有误，则操作出入库记录即可，不建议您删除账单，此操作无法恢复！！，请确认是否继续？&&number='+ data.account_number+'&&url=delectAcc',
					zIndex : layer.zIndex, //重点1
					success : function(layero) {
						layer.setTop(layero); //重点2
					}
				});
				
			}else{
				layer.msg("无权操作");
			}
		}
	});
	init();
	showmenue();
});
