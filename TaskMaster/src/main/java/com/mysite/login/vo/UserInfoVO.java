package com.mysite.login.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UserInfoVO {
	
	private String userId;
	private String userName;
	private String password;
	private String companyCd;
	private String authKey;
	private String authYn;
	private String compAdminYn;
	private Date joinDate;
	

}
