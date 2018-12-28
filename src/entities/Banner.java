package entities;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.URL;

public class Banner {
	private int id_banner;
	@NotEmpty(message="Không được để trống")
	private String name;
	@NotEmpty(message="Không được để trống")
	private String title;
	@NotEmpty(message="Không được để trống")
	@URL(message="Không đúng định dạng url")
	private String link;
	private String picture;
	@NotEmpty(message="Không được để trống")
	private String thu_tu;
	public Banner(int id_banner, String name, String title, String link, String picture, String thu_tu) {
		super();
		this.id_banner = id_banner;
		this.name = name;
		this.title = title;
		this.link = link;
		this.picture = picture;
		this.thu_tu = thu_tu;
	}
	public String getThu_tu() {
		return thu_tu;
	}
	public void setThu_tu(String thu_tu) {
		this.thu_tu = thu_tu;
	}
	public Banner() {
		super();
	}
	public int getId_banner() {
		return id_banner;
	}
	public void setId_banner(int id_banner) {
		this.id_banner = id_banner;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
}
