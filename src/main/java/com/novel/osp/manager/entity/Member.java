package com.novel.osp.manager.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;

@Entity(name = "members")
public class Member implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	@Column(name = "me_id")
	private Integer id;
	@Column(name = "me_loginname")
	private String loginName;
	private String me_loginpwd;
	private Integer me_status;
	private String me_purview = "0";
	private String me_username;  
	private Long me_phone;
	private String me_email;
	private String me_company;
	@Column(name = "me_addtime")
	private Date time = new Date();
	@Transient
	private String[] p;

	public Member() {

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getMe_loginpwd() {
		return me_loginpwd;
	}

	public void setMe_loginpwd(String me_loginpwd) {
		this.me_loginpwd = me_loginpwd;
	}

	public Integer getMe_status() {
		return me_status;
	}

	public void setMe_status(Integer me_status) {
		this.me_status = me_status;
	}

	public String getMe_purview() {
		return me_purview;
	}

	public void setMe_purview(String me_purview) {
		this.me_purview = me_purview;
	}

	public String getMe_username() {
		return me_username;
	}

	public void setMe_username(String me_username) {
		this.me_username = me_username;
	}

	public Long getMe_phone() {
		return me_phone;
	}

	public void setMe_phone(Long me_phone) {
		this.me_phone = me_phone;
	}

	public String getMe_email() {
		return me_email;
	}

	public void setMe_email(String me_email) {
		this.me_email = me_email;
	}

	public String getMe_company() {
		return me_company;
	}

	public void setMe_company(String me_company) {
		this.me_company = me_company;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String[] getP() {
		return p;
	}

	public void setP(String[] p) {
		this.p = p;
	}

}