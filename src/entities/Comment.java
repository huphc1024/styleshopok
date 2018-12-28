package entities;

import java.sql.Timestamp;

public class Comment {
	private int id_comment;
	private String ho_ten;
	private String noi_dung;
	private int id_product;
	private Timestamp date_create;
	public Comment(int id_comment, String ho_ten, String noi_dung, int id_product, Timestamp date_create,
			String pname) {
		super();
		this.id_comment = id_comment;
		this.ho_ten = ho_ten;
		this.noi_dung = noi_dung;
		this.id_product = id_product;
		this.date_create = date_create;
		this.pname = pname;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	private String pname;
	public Comment() {
		super();
	}
	public int getId_comment() {
		return id_comment;
	}
	public void setId_comment(int id_comment) {
		this.id_comment = id_comment;
	}
	public String getHo_ten() {
		return ho_ten;
	}
	public void setHo_ten(String ho_ten) {
		this.ho_ten = ho_ten;
	}
	public String getNoi_dung() {
		return noi_dung;
	}
	public void setNoi_dung(String noi_dung) {
		this.noi_dung = noi_dung;
	}
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
}
