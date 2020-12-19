/**
 * 加入购物车
 */
function buy(goodid) {
	$.post("./GoodsBuyServlet", {
		goodsid : goodid
	}, function(data) {
		if (data == "ok") {
			alert("添加到购物车!");
			window.location.reload();
		} else if (data == "fail") {
			alert("库存不足，请购买其他商品!");
		}
	});
}
/**
 * 购物车减去
 */
function lessen(goodsid) {
	$.post("./GoodsLessenServlet", {
		goodsid : goodsid
	}, function(data) {
		if (data == "ok") {
			alert("操作成功!");
			window.location.reload();
		}
	});
}

/**
 * 购物车删除
 */
function deletes(goodsid) {
	$.post("./GoodsDeleteServlet", {
		goodsid : goodsid
	}, function(data) {
		if (data == "ok") {
			alert("删除成功!");
			window.location.reload();
		}
	});
}