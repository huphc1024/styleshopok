package entities;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.NotEmpty;

public class Product {
	private int id_product;
	@NotEmpty(message="Không được để trống")
	private String name;
	private String preview;
	private float gia;
	private float gia_sale;
	@NotEmpty(message="Không được để trống")
	private String color;
	@NotEmpty(message="Không được để trống")
	private String size;
	@NotEmpty(message="Không được để trống")
	private String tinh_trang;
	@NotEmpty(message="Không được để trống")
	private String xuat_xu;
	@NotEmpty(message="Không được để trống")
	private String diachikhohang;
	private String picture;
	private String picture2;
	private String picture3;
	private Timestamp date_create;
	private int id_cat;
	private String cname;
	private int num;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Product(int id_product, String name, String preview, float gia, float gia_sale, String color,
			String size, String tinh_trang, String xuat_xu, String diachikhohang, String picture, String picture2,
			String picture3, Timestamp date_create, int id_cat, String cname, int active) {
		super();
		this.id_product = id_product;
		this.name = name;
		this.preview = preview;
		this.gia = gia;
		this.gia_sale = gia_sale;
		this.color = color;
		this.size = size;
		this.tinh_trang = tinh_trang;
		this.xuat_xu = xuat_xu;
		this.diachikhohang = diachikhohang;
		this.picture = picture;
		this.picture2 = picture2;
		this.picture3 = picture3;
		this.date_create = date_create;
		this.id_cat = id_cat;
		this.cname = cname;
		this.active = active;
	}
	public String getPicture2() {
		return picture2;
	}
	public void setPicture2(String picture2) {
		this.picture2 = picture2;
	}
	public String getPicture3() {
		return picture3;
	}
	public void setPicture3(String picture3) {
		this.picture3 = picture3;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	private int active;
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
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
	}
	public float getGia() {
		return gia;
	}
	public void setGia(float gia) {
		this.gia = gia;
	}
	public float getGia_sale() {
		return gia_sale;
	}
	public void setGia_sale(float gia_sale) {
		this.gia_sale = gia_sale;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getTinh_trang() {
		return tinh_trang;
	}
	public void setTinh_trang(String tinh_trang) {
		this.tinh_trang = tinh_trang;
	}
	public String getXuat_xu() {
		return xuat_xu;
	}
	public void setXuat_xu(String xuat_xu) {
		this.xuat_xu = xuat_xu;
	}
	public String getDiachikhohang() {
		return diachikhohang;
	}
	public void setDiachikhohang(String diachikhohang) {
		this.diachikhohang = diachikhohang;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public Product() {
		super();
	}
	
}
