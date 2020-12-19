package site.liuye.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import site.liuye.entity.Goods;

public interface GoodsDao {
	List<Map<String, Object>> getHotGoodsList() throws SQLException;

	List<Goods> selectGoods(int typeId, int pageNo, int pageSize) throws SQLException;

	int getGoodsCount(int typeId) throws SQLException;

	int selectGoodsRecommendCount(int type) throws SQLException;

	Goods getById(int id) throws SQLException;

	List<Goods> selectGoodsRecommend(int type, int pageNo, int pageSize) throws SQLException;

	int addRecommend(int id, int type) throws SQLException;

	int removeRecommend(int id, int type) throws SQLException;

	int insert(Goods g) throws SQLException;

	int update(Goods g) throws SQLException;

	int delete(int id) throws SQLException;

	boolean isHot(Goods g) throws SQLException;

	boolean isScroll(Goods g) throws SQLException;

	boolean isNew(Goods g) throws SQLException;

	boolean isRecommend(Goods g, int type) throws SQLException;

	int getSearchCount(String keyword) throws SQLException;

	List<Goods> selectSearchGoods(String keyword, int pageNo, int pageSize) throws SQLException;

	List<Map<String, Object>> getGoodsList(int recommendType) throws SQLException;

}
