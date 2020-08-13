package DTO;

import com.google.cloud.Timestamp;

public class ServicesDTO {
	String name;
	String address;
	String mobile;
	String servicename;
	String uid;
	Boolean checked;
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	Timestamp bookingtime;
	public Timestamp getBookingtime() {
		return bookingtime;
	}
	public void setBookingtime(Timestamp bookingtime) {
		this.bookingtime = bookingtime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getServicename() {
		return servicename;
	}
	public void setServicename(String servicename) {
		this.servicename = servicename;
	}
	
}
