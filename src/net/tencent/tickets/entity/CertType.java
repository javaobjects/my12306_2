package net.tencent.tickets.entity;

/**
 * 
* <p>Title: CertType</p>  
* <p>
*	Description: 
*	证件类型
* </p> 
* @author xianxian 
* @date 2019年9月2日
 */
public class CertType {

	private Integer id;
	private String content;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "CertType [id=" + id + ", content=" + content + "]";
	}
	public CertType(Integer id, String content) {
		super();
		this.id = id;
		this.content = content;
	}
	public CertType() {
		super();
	}
	
	
}
