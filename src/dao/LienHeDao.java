package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.LienHe;

@Repository
public class LienHeDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	public List<LienHe> getItems(){
		return jdbcTemplate.query("select * from lien_he",
				new BeanPropertyRowMapper<LienHe>(LienHe.class)); 
	}
	public int addItem(LienHe objLH){
		return jdbcTemplate.update("insert into lien_he(name, email, noidung) values(?,?,?)", new Object[]{objLH.getName(), objLH.getEmail(), objLH.getNoidung()}); 
	}
	public int delItem(int id){
		return jdbcTemplate.update("delete from lien_he where id_lien_he = ?", new Object[]{id}); 
	}
}
