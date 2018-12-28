package entities;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class CustomerEdit {
	private int id_customer;
	@NotEmpty(message="Không được để trống")
	@Size(min=6, message="Username không bé hơn 6 ký tự")
	private String username;
	private String password;
	@NotEmpty(message="Không được để trống")
	private String ho;
	@NotEmpty(message="Không được để trống")
	private String ten;
	@NotEmpty(message="Không được để trống")
	private String andress;
	@NotEmpty(message="Không được để trống")
	@Email(message="Phải đúng định dạng email")
	private String email;
	@NotEmpty(message="Không được để trống")
	private String telephone;
	private String newsletter;
	private int active;
	@NotEmpty(message="Không được để trống")
	private String city;
	@NotEmpty(message="Không được để trống")
	private String postcode;
	@NotEmpty(message="Không được để trống")
	private String country;
	public CustomerEdit() {
		super();
	}
	public CustomerEdit(int id_customer, String username, String password, String ho, String ten, String andress,
			String email, String telephone, String newsletter, int active, String city, String postcode, String country) {
		super();
		this.id_customer = id_customer;
		this.username = username;
		this.password = password;
		this.ho = ho;
		this.ten = ten;
		this.andress = andress;
		this.email = email;
		this.telephone = telephone;
		this.newsletter = newsletter;
		this.active = active;
		this.city = city;
		this.postcode = postcode;
		this.country = country;
	}
	public int getId_customer() {
		return id_customer;
	}
	public void setId_customer(int id_customer) {
		this.id_customer = id_customer;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getNewsletter() {
		return newsletter;
	}
	public void setNewsletter(String newsletter) {
		this.newsletter = newsletter;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
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
}
