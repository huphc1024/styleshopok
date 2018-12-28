package entities;

import java.sql.Timestamp;

public class OrdersIndex {
	private int id_orders;
	private int id_customer;
	private String ho;
	private String ten;
	private String active;
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	private Timestamp date_create;
	public OrdersIndex() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersIndex(int id_orders, int id_customer, String ho, String ten, Timestamp date_create, String active) {
		super();
		this.id_orders = id_orders;
		this.id_customer = id_customer;
		this.ho = ho;
		this.ten = ten;
		this.date_create = date_create;
		this.active = active;
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
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
}
