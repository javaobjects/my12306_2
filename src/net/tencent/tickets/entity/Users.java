package net.tencent.tickets.entity;

import java.util.Date;

/**
 * 
* <p>Title: Users</p>  
* <p>
*	Description: 
*	用户实体类
* </p> 
* @author xianxian 
* @date 2019年9月2日
 */
public class Users {
	private Integer id;
	private String userName;
	private String userPassword;
	private String userRule;// 1、管理员 2、普通用户
	private String userRealName;
	private Character userSex;//性别(1、男 2、女)
	private City city;
	private CertType certType;
	private String userCert;//证件号码
	private Date userBirthday;
	private UserType userType;
	private String userContent;
	private Character userStatus;//用户状态（0、无效  1、有效 ）
	private String userLoginIp;
	private String userImagePath;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserRule() {
		return userRule;
	}
	public void setUserRule(String userRule) {
		this.userRule = userRule;
	}
	public String getUserRealName() {
		return userRealName;
	}
	public void setUserRealName(String userRealName) {
		this.userRealName = userRealName;
	}
	public Character getUserSex() {
		return userSex;
	}
	public void setUserSex(Character userSex) {
		this.userSex = userSex;
	}
	public City getCity() {
		return city;
	}
	public void setCity(City city) {
		this.city = city;
	}
	public CertType getCertType() {
		return certType;
	}
	public void setCertType(CertType certType) {
		this.certType = certType;
	}
	public String getUserCert() {
		return userCert;
	}
	public void setUserCert(String userCert) {
		this.userCert = userCert;
	}
	public Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	public UserType getUserType() {
		return userType;
	}
	public void setUserType(UserType userType) {
		this.userType = userType;
	}
	public String getUserContent() {
		return userContent;
	}
	public void setUserContent(String userContent) {
		this.userContent = userContent;
	}
	public Character getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(Character userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserLoginIp() {
		return userLoginIp;
	}
	public void setUserLoginIp(String userLoginIp) {
		this.userLoginIp = userLoginIp;
	}
	public String getUserImagePath() {
		return userImagePath;
	}
	public void setUserImagePath(String userImagePath) {
		this.userImagePath = userImagePath;
	}
	public Users() {
		super();
	}
	public Users(Integer id, String userName, String userPassword, String userRule,
			String userRealName, Character userSex, City city, CertType certType,
			String userCert, Date userBirthday, UserType userType, String userContent,
			Character userStatus, String userLoginIp, String userImagePath) {
		super();
		this.id = id;
		this.userName = userName;
		this.userPassword = userPassword;
		this.userRule = userRule;
		this.userRealName = userRealName;
		this.userSex = userSex;
		this.city = city;
		this.certType = certType;
		this.userCert = userCert;
		this.userBirthday = userBirthday;
		this.userType = userType;
		this.userContent = userContent;
		this.userStatus = userStatus;
		this.userLoginIp = userLoginIp;
		this.userImagePath = userImagePath;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", userName=" + userName + ", userPassword="
				+ userPassword + ", userRule=" + userRule + ", userRealName=" + userRealName
				+ ", userSex=" + userSex + ", city=" + city + ", certType=" + certType
				+ ", userCert=" + userCert + ", userBirthday=" + userBirthday + ", userType="
				+ userType + ", userContent=" + userContent + ", userStatus=" + userStatus
				+ ", userLoginIp=" + userLoginIp + ", userImagePath=" + userImagePath + "]\n";
	}
	public Users(String userName, String userPassword, Character userSex, Date userBirthday) {
		super();
		this.userName = userName;
		this.userPassword = userPassword;
		this.userSex = userSex;
		this.userBirthday = userBirthday;
	}
}
