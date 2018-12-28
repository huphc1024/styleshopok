package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.UserAdd;
import entities.UserEdit;

@Repository
public class UserDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<UserAdd> getItems(){
		return jdbcTemplate.query("select * from user",
				new BeanPropertyRowMapper<UserAdd>(UserAdd.class)); 
	}
	public int addItem(UserAdd objCat) {
		return jdbcTemplate.update("insert into user(username, password, fullname,role ,active) value(?,?,?,?,?)", new Object[]{objCat.getUsername(),objCat.getPassword(), objCat.getFullname(), objCat.getRole(), objCat.getActive()});
	}
	public UserAdd getItem(int id){
		return jdbcTemplate.queryForObject("select * from user where id_user = ?",
				new Object[]{id},
				new BeanPropertyRowMapper<UserAdd>(UserAdd.class)); 
	}
	public int editItem(UserEdit objCat) {
		return jdbcTemplate.update("update user set username = ?, password = ?, fullname = ?, role = ?, active = ? where id_user = ?", new Object[]{objCat.getUsername(),objCat.getPassword(),objCat.getFullname(), objCat.getRole(), objCat.getActive(), objCat.getId_user()});
	}
	public int delItem(int id) {
		return jdbcTemplate.update("delete from user where id_user = ?", new Object[]{id});
	}
	public int checkItem(int nid) {
		String sql = "select count(*) as sum from categories where id_cat = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[]{nid}, Integer.class);
		return sum;
	}
	public UserAdd getItemByName(String name) {
		return jdbcTemplate.queryForObject("select * from user where username = ?",
				new Object[]{name},
				new BeanPropertyRowMapper<UserAdd>(UserAdd.class)); 
	}
}
