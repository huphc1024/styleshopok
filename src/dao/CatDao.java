package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Category;

@Repository
public class CatDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Category> getItems(){
		return jdbcTemplate.query("select * from categories",
				new BeanPropertyRowMapper<Category>(Category.class)); 
	}
	public List<Category> getItemsParent(){
		return jdbcTemplate.query("select * from categories where parent_id = 0",
				new BeanPropertyRowMapper<Category>(Category.class)); 
	}
	public List<Category> getItemsIndex(){
		return jdbcTemplate.query("select * from categories order by thu_tu asc limit 4",
				new BeanPropertyRowMapper<Category>(Category.class)); 
	}
	public int addItem(Category objCat) {
		return jdbcTemplate.update("insert into categories(name, meta_title, parent_id, active, picture, thu_tu) value(?,?,?,?,?,?)", new Object[]{objCat.getName(),objCat.getMeta_title(), objCat.getParent_id(), objCat.getActive(), objCat.getPicture(), objCat.getThu_tu()});
	}
	public Category getItem(int id){
		return jdbcTemplate.queryForObject("select * from categories where id_cat = ?",
				new Object[]{id},
				new BeanPropertyRowMapper<Category>(Category.class)); 
	}
	public int editItem(Category objCat) {
		return jdbcTemplate.update("update categories set name = ?, meta_title = ?, thu_tu = ?, parent_id = ?, picture = ?, active = ? where id_cat = ?", new Object[]{objCat.getName(),objCat.getMeta_title(),objCat.getThu_tu(), objCat.getParent_id(), objCat.getPicture(), objCat.getActive(), objCat.getId_cat()});
	}
	public int delItem(int id) {
		return jdbcTemplate.update("delete from categories where id_cat = ?", new Object[]{id});
	}
	public int checkItem(int nid) {
		String sql = "select count(*) as sum from categories where id_cat = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[]{nid}, Integer.class);
		return sum;
	}
}
