layui.use([ 'form', 'layedit', 'layer', "jquery", 'laydate' ],function() {
		var $ = layui.jquery;
		var layer = layui.layer;
		$("#printfdj").click(function() {
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
	});