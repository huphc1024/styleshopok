package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Comment;

@Repository
public class CommentDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Comment> getItems(){
		return jdbcTemplate.query("select c.id_comment, c.ho_ten,"
				+ "c.noi_dung,"
				+ "c.id_product, c.date_create, p.name as pname  "
				+ "from comment as c join product as p on c.id_product = p.id_product", new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	public List<Comment> getItemsByDetail(int  pid){
		return jdbcTemplate.query("select c.id_comment, c.ho_ten,"
				+ "c.noi_dung,"
				+ "c.id_product, c.date_create, p.name as pname  "
				+ "from comment as c join product as p on c.id_product = p.id_product where c.id_product = ? limit 10", new Object[]{pid}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	public Comment getItem(int cid){
		return jdbcTemplate.queryForObject("select c.id_comment, c.ho_ten,"
				+ "c.noi_dung,"
				+ "c.id_product, c.date_create, p.name as pname  "
				+ "from comment as c join product as p on c.id_product = p.id_product where c.id_comment = ?", new Object[]{cid}, new BeanPropertyRowMapper<Comment>(Comment.class));
	}
	public int addItem(Comment objItem){
		return jdbcTemplate.update("insert into comment(ho_ten, noi_dung, id_product) values(?,?,?)",
				new Object[]{objItem.getHo_ten(), objItem.getNoi_dung(), objItem.getId_product()});
	}
	public int delItem(int cid){
		return jdbcTemplate.update("delete from comment where id_comment = ?",
				new Object[]{cid});
	}
	public int CountCmt(int nid) {
		String sql = "select count(*) as sum from comment where id_product = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[]{nid}, Integer.class);
		return sum;
	}
}
