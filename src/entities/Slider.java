package entities;

public class Slider {
	private int id_slider;
	private String picture;
	private String text1;
	private String text2;
	private String text3;
	private String text_shopnow;
	public Slider() {
		super();
	}
	public Slider(int id_slider, String picture, String text1, String text2, String text3, String text_shopnow) {
		super();
		this.id_slider = id_slider;
		this.picture = picture;
		this.text1 = text1;
		this.text2 = text2;
		this.text3 = text3;
		this.text_shopnow = text_shopnow;
	}
	public int getId_slider() {
		return id_slider;
	}
	public void setId_slider(int id_slider) {
		this.id_slider = id_slider;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getText1() {
		return text1;
	}
	public void setText1(String text1) {
		this.text1 = text1;
	}
	public String getText2() {
		return text2;
	}
	public void setText2(String text2) {
		this.text2 = text2;
	}
	public String getText3() {
		return text3;
	}
	public void setText3(String text3) {
		this.text3 = text3;
	}
	public String getText_shopnow() {
		return text_shopnow;
	}
	public void setText_shopnow(String text_shopnow) {
		this.text_shopnow = text_shopnow;
	}
	
}
