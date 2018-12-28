package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Orders;
import entities.OrdersDetail;
import entities.OrdersIndex;
import entities.Product;

@Repository
public class OrderDetailDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<OrdersDetail> getItems() {
		return jdbcTemplate.query("SELECT p.name, p.picture, o.gia, o.soluong, o.giaohang, c.username, c.ho,"
				+ " c.ten, c.andress, c.email, c.telephone, c.city, c.postcode, c.country FROM ordersdetail as o "
				+ "inner join customer as c on c.id_customer = o.id_customer inner join product as p on p.id_product = o.id_product",
				new BeanPropertyRowMapper<OrdersDetail>(OrdersDetail.class));
	}

	public List<Orders> getItemsOrders() {
		return jdbcTemplate.query(
				"SELECT od.id_orders, od.id_customer, od.date_create, c.ho, c.ten, c.andress, c.email,"
						+ " c.telephone, c.city, c.postcode, c.country, o.gia, o.name, o.soluong, o.giaohang, od.active FROM orders as od "
						+ "JOIN ordersdetail as o on o.id_customer = od.id_customer JOIN customer as c on c.id_customer = od.id_customer",
				new BeanPropertyRowMapper<Orders>(Orders.class));
	}

	public int addItem(OrdersDetail objCat) {
		return jdbcTemplate.update(
				"insert into ordersdetail(id_orders, id_product, name, gia, soluong, giaohang) values(?,?,?,?,?,?)",
				new Object[] { objCat.getId_orders(), objCat.getId_product(), objCat.getName(), objCat.getGia(),
						objCat.getSoluong(), objCat.getGiaohang() });
	}

	// update trạng thái
	public int updateactive(OrdersIndex objCat) {
		return jdbcTemplate.update("UPDATE orders SET active = ? WHERE id_orders = ?",
				new Object[] { objCat.getActive(), objCat.getId_orders() });
	}

	public int delItem(int id) {
		return jdbcTemplate.update("delete from orders where id_orders = ?", new Object[] { id });
	}

	public int addItemOrder(int id_customer) {
		return jdbcTemplate.update("insert into orders(id_customer) values(?)", new Object[] { id_customer });

	}

	public Orders getItemOrderTopbyidcus(int id_customer) {
		return jdbcTemplate.queryForObject("SELECT * FROM orders where id_customer = ? order by id_orders DESC limit 1",
				new Object[] { id_customer }, new BeanPropertyRowMapper<Orders>(Orders.class));

	}

	public List<OrdersIndex> getItemsOrdersIndex() {
		return jdbcTemplate.query(
				"SELECT od.id_orders, od.id_customer, od.date_create, c.ho, c.ten, od.active" + " FROM orders as od "
						+ " JOIN customer as c on c.id_customer = od.id_customer",
				new BeanPropertyRowMapper<OrdersIndex>(OrdersIndex.class));
	}

	public List<OrdersIndex> getItemsOrdersByIdCus(int id_customer) {
		return jdbcTemplate.query(
				"SELECT od.id_orders, od.id_customer, c.ho, c.ten, od.date_create, od.active" + " FROM orders as od "
						+ " JOIN customer as c on c.id_customer = od.id_customer where c.id_customer = ?",
				new Object[] { id_customer }, new BeanPropertyRowMapper<OrdersIndex>(OrdersIndex.class));
	}

	public List<Orders> getItemOrder(int id, int uid) {
		return jdbcTemplate.query(
				"SELECT od.id_orders, od.id_customer, od.date_create, c.ho, c.ten, c.andress, c.email,"
						+ " c.telephone, c.city, c.postcode, c.country, o.gia, o.name, o.soluong, o.giaohang, o.id_product, od.active FROM orders as od "
						+ "JOIN ordersdetail as o on o.id_orders = od.id_orders JOIN customer as c on c.id_customer = od.id_customer where od.id_orders = ? AND od.id_customer = ?",
				new Object[] { id, uid }, new BeanPropertyRowMapper<Orders>(Orders.class));
	}

	public List<Orders> getItemOrder(int id) {
		return jdbcTemplate.query(
				"SELECT od.id_orders, od.id_customer, od.date_create, c.ho, c.ten, c.andress, c.email,"
						+ " c.telephone, c.city, c.postcode, c.country, o.gia, o.name, o.soluong, o.giaohang, o.id_product, od.active FROM orders as od "
						+ "JOIN ordersdetail as o on o.id_orders = od.id_orders JOIN customer as c on c.id_customer = od.id_customer where od.id_orders = ?",
				new Object[] { id }, new BeanPropertyRowMapper<Orders>(Orders.class));
	}

}
