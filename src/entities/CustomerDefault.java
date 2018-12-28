package entities;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class CustomerDefault {
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
	@NotEmpty(message="Không được để trống")
	private String city;
	@NotEmpty(message="Không được để trống")
	private String postcode;
	@NotEmpty(message="Không được để trống")
	private String country;
	public CustomerDefault() {
		super();
	}
	public CustomerDefault(String ho, String ten, String andress, String email, String telephone, String city,
			String postcode, String country) {
		super();
		this.ho = ho;
		this.ten = ten;
		this.andress = andress;
		this.email = email;
		this.telephone = telephone;
		this.city = city;
		this.postcode = postcode;
		this.country = country;
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
}
