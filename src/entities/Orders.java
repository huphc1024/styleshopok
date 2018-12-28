package entities;

import java.sql.Timestamp;


public class Orders {
	private int id_orders;
	private int id_customer;
	private Timestamp date_create;
	private String ho;
	private String ten;
	private String andress;
	private String email;
	private String telephone;
	private String city;
	private String postcode;
	private String country;
	private int id_product;
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	private String name;
	private float gia;
	private float soluong;
	private String giaohang;
	private String active;
	public Orders(int id_orders, int id_customer, Timestamp date_create, String ho, String ten, String andress,
			String email, String telephone, String city, String postcode, String country, int id_product, String name,
			float gia, float soluong, String giaohang, String active) {
		super();
		this.id_orders = id_orders;
		this.id_customer = id_customer;
		this.date_create = date_create;
		this.ho = ho;
		this.ten = ten;
		this.andress = andress;
		this.email = email;
		this.telephone = telephone;
		this.city = city;
		this.postcode = postcode;
		this.country = country;
		this.id_product = id_product;
		this.name = name;
		this.gia = gia;
		this.soluong = soluong;
		this.giaohang = giaohang;
		this.active = active;
	}
	public Orders() {
		super();
	}
	public int getId_orders() {
		return id_orders;
	}
	public void setId_orders(int id_orders) {
		this.id_orders = id_orders;
	}
	public int getId_customer() {
		return id_customer;
	}
	public void setId_customer(int id_customer) {
		this.id_customer = id_customer;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public String getHo() {
		return ho;
	}
	public void setHo(String ho) {
		this.ho = ho;
	}
	public String getTen() {
		return ten;
	}
	public void setTen(String ten) {
		this.ten = ten;
	}
	public String getAndress() {
		return andress;
	}
	public void setAndress(String andress) {
		this.andress = andress;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
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
