package entities;

import java.sql.Timestamp;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class LienHe {
	private int id_lien_he;
	@NotEmpty(message="Không được để trống")
	private String name;
	@NotEmpty(message="Không được để trống")
	@Email(message="Email không đúng định dạng")
	private String email;
	@NotEmpty(message="Không được để trống")
	private String noidung;
	private Timestamp date_create;
	public LienHe(int id_lien_he, String name, String email, String noidung, Timestamp date_create) {
		super();
		this.id_lien_he = id_lien_he;
		this.name = name;
		this.email = email;
		this.noidung = noidung;
		this.date_create = date_create;
	}
	public Timestamp getDate_create() {
		return date_create;
	}
	public void setDate_create(Timestamp date_create) {
		this.date_create = date_create;
	}
	public LienHe() {
		super();
	}
	public int getId_lien_he() {
		return id_lien_he;
	}
	public void setId_lien_he(int id_lien_he) {
		this.id_lien_he = id_lien_he;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNoidung() {
		return noidung;
	}
	public void setNoidung(String noidung) {
		this.noidung = noidung;
	}
}
