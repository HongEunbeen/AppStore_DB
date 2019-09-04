package mirim.hs.kr;


public class User {
	
	private String name;
	private String company;
	private String gender;
	private String email;
	private String password;
	private String phone;
	private String comphone;
	private String age;
	
	public User(){
		
	}
	public String getName() {
		return name;
	}
	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	public User(String name,String gender, String email, String password, String phone,String age) {
		super();
		this.name = name;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.age = age;
	}
	
	public User(String name, String company, String gender, String email, String password, String phone, String comphone, String age) {
		super();
		this.name = name;
		this.company = company;
		this.gender = gender;
		this.email = email;
		this.password = password;
		this.phone = phone;
		this.comphone = comphone;
		this.age = age;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getComphone() {
		return comphone;
	}
	public void setComphone(String comphone) {
		this.comphone = comphone;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
}