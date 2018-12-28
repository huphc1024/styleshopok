package entities;

import javax.validation.constraints.Digits;

import org.hibernate.validator.constraints.NotEmpty;

public class Category {
	private int id_cat;
	@NotEmpty(message="Không được để trống!")
	private String name;
	@NotEmpty(message="Không được để trống!")
	private String meta_title;
	private int parent_id;
	private int active;
	private String picture;
	@Digits(integer=6, fraction=0, message="Nhập số nha")
	private int thu_tu;
	public Category(int id_cat, String name, String meta_title, int parent_id, int active, String picture, int thu_tu) {
		super();
		this.id_cat = id_cat;
		this.name = name;
		this.meta_title = meta_title;
		this.parent_id = parent_id;
		this.active = active;
		this.picture = picture;
		this.thu_tu = thu_tu;
	}
	public int getThu_tu() {
		return thu_tu;
	}
	public void setThu_tu(int thu_tu) {
		this.thu_tu = thu_tu;
	}
	public int getId_cat() {
		return id_cat;
	}
	public void setId_cat(int id_cat) {
		this.id_cat = id_cat;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMeta_title() {
		return meta_title;
	}
	public void setMeta_title(String meta_title) {
		this.meta_title = meta_title;
	}
	public int getParent_id() {
		return parent_id;
	}
	public void setParent_id(int parent_id) {
		this.parent_id = parent_id;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Category() {
		super();
	}
}
