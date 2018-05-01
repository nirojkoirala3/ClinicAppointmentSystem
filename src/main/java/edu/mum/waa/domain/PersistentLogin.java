package edu.mum.waa.domain;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity(name = "persistent_logins")
public class PersistentLogin {
	@Id
	@Column(name = "series")
	private String series;
	
	@Column(name = "username")
	private String username;
	
	@Column(name = "token")
	private String token;

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_used", insertable = false, updatable = false)
	private Date last_used;

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public Date getLast_used() {
		return last_used;
	}

	public void setLast_used(Date last_used) {
		this.last_used = last_used;
	}
}