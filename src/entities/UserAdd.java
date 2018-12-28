package entities;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

public class UserAdd {
	private int id_user;
	@NotEmpty(message="Không được để trống")
	private String username;
	@NotEmpty(message="Không được để trống")
	@Size(min=6, message="Password phải lớn hơn 6 ký tự")
	private String password;
	@NotEmpty(message="Không được để trống")
	@Size(min=6, message="Fullname phải lớn hơn 6 ký tự")
	private String fullname;
	private String role;
	private int active;
	public UserAdd(int id_user, String username, String password, String fullname, String role, int active) {
		super();
		this.id_user = id_user;
		this.username = username;
		this.password = password;
		this.fullname = fullname;
		this.role = role;
		this.active = active;
	}
	public UserAdd() {
		super();
	}
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
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
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
}
