package site.liuye.dao.impl;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import site.liuye.dao.GoodsDao;
import site.liuye.entity.Goods;
import site.liuye.entity.Recommend;
import site.liuye.utils.JDBCUtils;

public class GoodsDaoImpl implements GoodsDao {
	private QueryRunner runner = new QueryRunner(JDBCUtils.getDataSource());

	@Override
	public List<Map<String, Object>> getGoodsList(int recommendType) throws SQLException {
		String sql = "select g.id,g.name,g.cover,g.price,t.name typename from recommend r,goods g,type t where type=? and r.goods_id=g.id and g.type_id=t.id";
		return runner.query(sql, new MapListHandler(), recommendType);
	}

	@Override
	public List<Map<String, Object>> getHotGoodsList() throws SQLException {
		// TODO Auto-generated method stub
		String sql = "select g.id,g.name,g.cover,g.price,g.intro,t.name typename from recommend r,goods g,type t where type = 2 and r.goods_id = g.id";
		return runner.query(sql, new MapListHandler());
	}

	@Override
	public List<Goods> selectGoods(int typeId, int pageNo, int pageSize) throws SQLException {
		QueryRunner r = new QueryRunner(JDBCUtils.getDataSource());
		if (typeId == 0) {
			String sql = "select * from goods limit ?,?";
			return r.query(sql, new BeanListHandler<Goods>(Goods.class), (pageNo - 1) * pageSize, pageSize);
		} else {
			String sql = "select * from goods where type_id=? limit ?,?";
			return r.query(sql, new BeanListHandler<Goods>(Goods.class), typeId, (pageNo - 1) * pageSize, pageSize);
		}
	}

	@Override
	public int getGoodsCount(int typeId) throws SQLException {
		QueryRunner r = new QueryRunner(JDBCUtils.getDataSource());
		String sql = "";
		if (typeId == 0) {
			sql = "select count(*) from goods";
			return r.query(sql, new ScalarHandler<Long>()).intValue();
		} else {
			sql = "select count(*) from goods where type_id = ?";
			return r.query(sql, new ScalarHandler<Long>(), typeId).intValue();
		}
	}

	@Override
	public List<Goods> selectGoodsRecommend(int type, int pageNo, int pageSize) throws SQLException {
		if (type == 0) {
			String sql = "select g.id,g.name,g.cover,g.image1,g.image2,g.intro,g.price,g.stock,t.name typename from goods g,type t where g.type_id=t.id limit ?,?";
			return runner.query(sql, new BeanListHandler<Goods>(Goods.class), (pageNo - 1) * pageSize, pageSize);
		}
		String sql = "select g.id,g.name,g.cover,g.image1,g.image2,g.intro,g.price,g.stock,t.name typename from goods g,recommend r,type t where g.id=r.goods_id and g.type_id=t.id and r.type=? limit ?,?";
		return runner.query(sql, new BeanListHandler<Goods>(Goods.class), type, (pageNo - 1) * pageSize, pageSize);
	}

	@Override
	public int selectGoodsRecommendCount(int type) throws SQLException {
		if (type == 0)
			return getGoodsCount(0);
		String sql = "select count(*) from recommend where type=?";
		return runner.query(sql, new ScalarHandler<Long>(), type).intValue();
	}

	@Override
	public Goods getById(int id) throws SQLException {
		String sql = "select g.id,g.name,g.cover,g.image1,g.image2,g.price,g.intro,g.stock,t.id as typeid,t.name as typename from goods g,type t where g.id = ? and g.type_id=t.id";
		return runner.query(sql, new BeanHandler<Goods>(Goods.class), id);
	}

	@Override
	public int getSearchCount(String keyword) throws SQLException {
		String sql = "select count(*) from goods where name like ?";
		return runner.query(sql, new ScalarHandler<Long>(), "%" + keyword + "%").intValue();
	}

	@Override
	public List<Goods> selectSearchGoods(String keyword, int pageNo, int pageSize) throws SQLException {
		String sql = "select * from goods where name like ? limit ?,?";
		return runner.query(sql, new BeanListHandler<Goods>(Goods.class), "%" + keyword + "%", (pageNo - 1) * pageSize,
				pageSize);
	}

	@Override
	public boolean isScroll(Goods g) throws SQLException {
		return isRecommend(g, 1);
	}

	@Override
	public boolean isHot(Goods g) throws SQLException {
		return isRecommend(g, 2);
	}

	@Override
	public boolean isNew(Goods g) throws SQLException {
		return isRecommend(g, 3);
	}

	@Override
	public boolean isRecommend(Goods g, int type) throws SQLException {
		String sql = "select * from recommend where type=? and goods_id=?";
		Recommend recommend = runner.query(sql, new BeanHandler<Recommend>(Recommend.class), type, g.getId());
		if (recommend == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public int addRecommend(int id, int type) throws SQLException {
		String sql = "insert into recommend(type,goods_id) values(?,?)";
		return runner.update(sql, type, id);
	}

	@Override
	public int removeRecommend(int id, int type) throws SQLException {
		String sql = "delete from recommend where type=? and goods_id=?";
		return runner.update(sql, type, id);
	}

	@Override
	public int insert(Goods g) throws SQLException {
		String sql = "insert into goods(name,cover,image1,image2,price,intro,stock,type_id) values(?,?,?,?,?,?,?,?)";
		return runner.update(sql, g.getName(), g.getCover(), g.getImage1(), g.getImage2(), g.getPrice(), g.getIntro(),
				g.getStock(), g.getType().getId());
	}

	@Override
	public int update(Goods g) throws SQLException {
		String sql = "update goods set name=?,cover=?,image1=?,image2=?,price=?,intro=?,stock=?,type_id=? where id=?";
		return runner.update(sql, g.getName(), g.getCover(), g.getImage1(), g.getImage2(), g.getPrice(), g.getIntro(),
				g.getStock(), g.getType().getId(), g.getId());
	}

	@Override
	public int delete(int id) throws SQLException {
		String sql = "delete from goods where id = ?";
		return runner.update(sql, id);
	}
}
