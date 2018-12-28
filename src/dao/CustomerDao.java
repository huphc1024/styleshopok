package dao;

import java.util.List;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Customer;
import entities.CustomerEdit;

@Repository
public class CustomerDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Customer> getItems() {
		return jdbcTemplate.query("select * from customer", new BeanPropertyRowMapper<Customer>(Customer.class));
	}
	
	public List<Customer> getItem() {
		return jdbcTemplate.query("select * from customer order by id_customer desc limit 1", new BeanPropertyRowMapper<Customer>(Customer.class));
	}

	public int addItem(Customer objCat) {
		return jdbcTemplate.update(
				"insert into customer(username, password, ho, ten, andress, email, telephone, newsletter, active, city, postcode, country) values(?,?,?,?,?,?,?,?,?,?,?,?)",
				new Object[] { objCat.getUsername(), objCat.getPassword(), objCat.getHo(), objCat.getTen(),
						objCat.getAndress(), objCat.getEmail(), objCat.getTelephone(), objCat.getNewsletter(),
						objCat.getActive(), objCat.getCity(), objCat.getPostcode(), objCat.getCountry() });
	}

	public Customer getItem(int id) {
		return jdbcTemplate.queryForObject("select * from customer where id_customer = ?", new Object[] { id },
				new BeanPropertyRowMapper<Customer>(Customer.class));
	}

	public int editItem(CustomerEdit objItem) {
		return jdbcTemplate.update(
				"update customer set  ho = ?, ten = ?, andress = ?, email = ?, telephone = ?, newsletter = ?, active = 1, city = ?, postcode = ?, country = ? where id_customer = ?",
				new Object[] { objItem.getHo(), objItem.getTen(), objItem.getAndress(),
						objItem.getEmail(), objItem.getTelephone(), objItem.getNewsletter(), 
						objItem.getCity(), objItem.getPostcode(), objItem.getCountry(), objItem.getId_customer() });
	}

	public int delItem(int id) {
		return jdbcTemplate.update("delete from customer where id_customer = ?", new Object[] { id });
	}

	public int checkItem(String username, String password) {
		String sql = "select count(*) as sum from customer where username = ? and password = ? and active = 1";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[] { username,password }, Integer.class);
		return sum;
	}

	public Customer getUserLogin(String username, String password) {
		return jdbcTemplate.queryForObject("select * from customer where username = ? and password = ?", new Object[] { username, password },
				new BeanPropertyRowMapper<Customer>(Customer.class));
	}

}
