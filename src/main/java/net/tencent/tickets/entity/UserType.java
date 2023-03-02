package net.tencent.tickets.entity;

/**
 * 
* <p>Title: UserType</p>  
* <p>
*	Description: 
*	用户实体类
* </p> 
* @author xianxian 
* @date 2019年9月2日
 */
public class UserType {
	
	private Integer id;
	private String content;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getContent() {
		return content;
	}
	
	@Override
	public String toString() {
		return "UserType [id=" + id + ", content=" + content + "]";
	}
	public UserType(Integer id, String content) {
		super();
		this.id = id;
		this.content = content;
	}
	public UserType() {
		super();
	}
}
