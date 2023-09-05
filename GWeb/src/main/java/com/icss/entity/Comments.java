package com.icss.entity;

import java.util.Date;

public class Comments {
	private String cname;
	private String gname;
	private String headshot;
	private Date cdate;
	private String cpart;
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getHeadshot() {
		return headshot;
	}
	public void setHeadshot(String headshot) {
		this.headshot = headshot;
	}
	public Date getCdate() {
		return cdate;
	}
	public void setCdate(Date cdate) {
		this.cdate = cdate;
	}
	public String getCpart() {
		return cpart;
	}
	public void setCpart(String cpart) {
		this.cpart = cpart;
	}
	
}
