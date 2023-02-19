package net.tencent.tickets.entity;

/**
 * 
* <p>Title: Province</p>  
* <p>
*	Description: 
*	省份实体类
* </p> 
* @author xianxian 
* @date 2019年9月2日
 */
public class Province {

	/**id*/
	private Integer id;
	/**省份id 字符串类型**/
	private String provinceId;
	/**省份名称 对应数据库的province字段**/
	private String provinceName;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getProvinceId() {
		return provinceId;
	}
	public void setProvinceId(String provinceId) {
		this.provinceId = provinceId;
	}
	public String getProvinceName() {
		return provinceName;
	}
	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}
	public Province(Integer id, String provinceId, String provinceName) {
		super();
		this.id = id;
		this.provinceId = provinceId;
		this.provinceName = provinceName;
	}
	public Province() {
		super();
	}
	@Override
	public String toString() {
		return "Province [id=" + id + ", provinceId=" + provinceId + ", provinceName=" + provinceName + "]";
	}
	
	
	
}
