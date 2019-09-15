package mirim.hs.kr;

public class App {
	
	private int no;
	private String title;
	private String email;
	private String cdate;
	private String category;
	private String content;
	private int rank;
	private String company;
	private String device;
	private String icon;
	
	public App(int no, String title, String email, String cdate, String category, String content, int rank,
			String company, String device, String icon) {
		super();
		this.no = no;
		this.title = title;
		this.email = email;
		this.cdate = cdate;
		this.category = category;
		this.content = content;
		this.rank = rank;
		this.company = company;
		this.device = device;
		this.icon = icon;
	}
	
	public App(int no, String title, String email, String cdate, String category, String content, int rank,
			String company, String device) {
		super();
		this.no = no;
		this.title = title;
		this.email = email;
		this.cdate = cdate;
		this.category = category;
		this.content = content;
		this.rank = rank;
		this.company = company;
		this.device = device;
	}
	
	
	public App(String title, String category, String content, int rank, String device) {
		super();
		this.title = title;
		this.category = category;
		this.content = content;
		this.rank = rank;
		this.device = device;
	}
	

	public App() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	
}