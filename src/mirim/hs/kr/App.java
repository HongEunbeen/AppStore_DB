package mirim.hs.kr;

public class App {
	int no;
	String title;
	String email;
	String cdate;
	String category;
	String content;
	String device;
	public App() {}
	public App(int no, String title, String email, String cdate, String category, String content, String device) {
		super();
		this.no = no;
		this.title = title;
		this.email = email;
		this.cdate = cdate;
		this.category = category;
		this.content = content;
		this.device = device;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	public int getNo() {
		return no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	
	
}