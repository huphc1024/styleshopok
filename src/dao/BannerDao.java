package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Banner;

@Repository
public class BannerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Banner> getItems(){
		return jdbcTemplate.query("select * from banner",
				new BeanPropertyRowMapper<Banner>(Banner.class)); 
	}
	public int addItem(Banner objCat) {
		return jdbcTemplate.update("insert into banner(name, title, link, picture, thu_tu) value(?,?,?,?,?)", new Object[]{objCat.getName(),objCat.getTitle(), objCat.getLink(), objCat.getPicture(), objCat.getThu_tu()});
	}
	public Banner getItem(int id){
		return jdbcTemplate.queryForObject("select * from banner where id_banner = ?",
				new Object[]{id},
				new BeanPropertyRowMapper<Banner>(Banner.class)); 
	}
	public int editItem(Banner objCat) {
		return jdbcTemplate.update("update banner set name = ?, title = ?, link = ?, picture = ?, thu_tu = ? where id_banner = ?", new Object[]{objCat.getName(),objCat.getTitle(),objCat.getLink(), objCat.getPicture(), objCat.getThu_tu(),objCat.getId_banner()});
	}
	public int delItem(int id) {
		return jdbcTemplate.update("delete from banner where id_banner = ?", new Object[]{id});
	}
}
