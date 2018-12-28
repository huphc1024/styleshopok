package dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import entities.Product;

@Repository
public class ProductDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Product> getItems() {
		return jdbcTemplate.query(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat",
				new BeanPropertyRowMapper<Product>(Product.class));
	}
	
	public List<Product> getItems(int offset) {
		return jdbcTemplate.query(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat limit ?,8", new Object[]{offset},
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsNew() {
		return jdbcTemplate.query(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat order by p.id_product desc limit 4",
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public Product getItem(int id) {
		return jdbcTemplate.queryForObject(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat where p.id_product = ?",
				new Object[] { id }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByCat(int cid, int offset) {
		return jdbcTemplate.query(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat where p.id_cat = ? limit ?,8",
				new Object[] { cid, offset }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public List<Product> getItemsByCatIndex(int id_cat) {
		return jdbcTemplate.query(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat where p.id_cat = ? order by p.id_product desc limit 8",
				new Object[] { id_cat }, new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int addItem(Product objItem) {
		String sql = "insert into product(name, preview, gia, gia_sale, color, size, tinh_trang, xuat_xu, diachikhohang,"
				+ "picture, picture2, picture3, id_cat, active) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,
				new Object[] { objItem.getName(), objItem.getPreview(), objItem.getGia(), objItem.getGia_sale()
						, objItem.getColor(), objItem.getSize(), objItem.getTinh_trang(),
						objItem.getXuat_xu(), objItem.getDiachikhohang(), objItem.getPicture(), objItem.getPicture2(),
						objItem.getPicture3(), objItem.getId_cat(), objItem.getActive() });
	}

	public int editItem(Product objItem) {
		String sql = "update product set name = ?,  preview=?, gia=?, gia_sale=?, color=?, size=?, tinh_trang=?, xuat_xu=?, diachikhohang=?,"
				+ "picture=?, picture2=?, picture3=?, id_cat=?, active=? where id_product = ?";
		return jdbcTemplate.update(sql,
				new Object[] { objItem.getName(), objItem.getPreview(), objItem.getGia(), objItem.getGia_sale()
						, objItem.getColor(), objItem.getSize(), objItem.getTinh_trang(),
						objItem.getXuat_xu(), objItem.getDiachikhohang(), objItem.getPicture(), objItem.getPicture2(),
						objItem.getPicture3(), objItem.getId_cat(), objItem.getActive(),objItem.getId_product() });
	}

	public List<Product> getItemsCatParent(int cid, int offset) {
		return jdbcTemplate.query(
				"select p.id_product, p.name, p.preview, p.gia,"
						+ " p.gia_sale, p.color, p.size, p.tinh_trang, p.xuat_xu,"
						+ " p.diachikhohang, p.picture,p.picture2,p.picture3, p.date_create, p.id_cat, p.active, c.name as cname  "
						+ "from product as p join categories as c on p.id_cat = c.id_cat where p.id_cat = ? or c.parent_id = ? limit ?,8",
						new Object[]{cid, cid,offset},
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int delItem(int id) {
		String sql = "delete from product where id_product = ?";
		return jdbcTemplate.update(sql,
				new Object[] { id});
	}

	public int countProductByCat(int cid) {
		String sql = "select count(*) as sum from product inner join categories on categories.id_cat = product.id_cat where product.id_cat = ?";
		int sum = this.jdbcTemplate.queryForObject(sql, new Object[]{cid} ,Integer.class);
		return sum;
	}

	public List<Product> getCurrentPagePublicByCat(int offset, int cid) {
		return jdbcTemplate.query("select * from stories where id_cat = ? order by id_news desc limit ?",
				new Object[]{cid, 8} ,
				new BeanPropertyRowMapper<Product>(Product.class));
	}

	public int countProduct() {
		String sql = "select count(*) as sum from product inner join categories on categories.id_cat = product.id_cat";
		int sum = this.jdbcTemplate.queryForObject(sql ,Integer.class);
		return sum;
	}
}
