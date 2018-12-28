package entities;

public class OrdersDetail {
	private int id_orders;
	private int id_product;
	private String name;
	private float gia;
	private float soluong;
	private String giaohang;
	public OrdersDetail() {
		super();
	}
	public OrdersDetail(int id_orders, int id_product, String name, float gia, float soluong, String giaohang) {
		super();
		this.id_orders = id_orders;
		this.id_product = id_product;
		this.name = name;
		this.gia = gia;
		this.soluong = soluong;
		this.giaohang = giaohang;
	}
	public int getId_orders() {
		return id_orders;
	}
	public void setId_orders(int id_orders) {
		this.id_orders = id_orders;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public float getGia() {
		return gia;
	}
	public void setGia(float gia) {
		this.gia = gia;
	}
	public float getSoluong() {
		return soluong;
	}
	public void setSoluong(float soluong) {
		this.soluong = soluong;
	}
	public String getGiaohang() {
		return giaohang;
	}
	public void setGiaohang(String giaohang) {
		this.giaohang = giaohang;
	}
}
