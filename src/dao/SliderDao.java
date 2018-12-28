package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Slider;

@Repository
public class SliderDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<Slider> getItems(){
		return jdbcTemplate.query("select * from slider",
				new BeanPropertyRowMapper<Slider>(Slider.class)); 
	}
	public int addItem(Slider objCat) {
		return jdbcTemplate.update("insert into slider(picture, text1, text2, text3, text_shopnow) value(?,?,?,?,?)", new Object[]{objCat.getPicture(),objCat.getText1(),objCat.getText2(),objCat.getText3(),objCat.getText_shopnow()});
	}
	public Slider getItem(int id){
		return jdbcTemplate.queryForObject("select * from slider where id_slider = ?",
				new Object[]{id},
				new BeanPropertyRowMapper<Slider>(Slider.class)); 
	}
	public int editItem(Slider objCat) {
		return jdbcTemplate.update("update slider set picture = ?, text1 = ?, text2 = ?, text3 = ?, text_shopnow = ? where id_slider = ?", new Object[]{objCat.getPicture(),objCat.getText1(),objCat.getText2(),objCat.getText3(),objCat.getText_shopnow(),objCat.getId_slider()});
	}
	public int delItem(int id) {
		return jdbcTemplate.update("delete from slider where id_slider = ?", new Object[]{id});
	}
}
