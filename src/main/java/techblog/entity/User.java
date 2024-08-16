package techblog.entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class User {
	

	private Integer id;
	private String name;
	private String email;
	private String password;
	private String gender;
	private String about;
	private Timestamp datetime;
	private String profile = "default.png";
	
	public User(String name, String email, String password, String gender, String about,
			Timestamp datetime) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.datetime = datetime;
	}
	
	public User() {}

	public User(String name, String email, String password, String gender, String about) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.gender = gender;
		this.about = about;
		this.datetime = getDateTime(); 
	}
	
	public User(String name, String email, String password, String gender, String about, String profile) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.about = about;
		this.profile = profile;
	}

	private Timestamp getDateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        String formattedDate = sdf.format(date);
        return Timestamp.valueOf(formattedDate);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public Timestamp getDatetime() {
		return datetime;
	}

	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
}
