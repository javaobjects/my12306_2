package net.tencent.my12306.entity;

/**
 * 
* <p>Title: City</p>  
* <p>
*	Description: 
*	城市类
* </p> 
* @author xianxian 
* @date 2019年9月2日
 */
public class City {

	//id cityid city father
	private Integer id;
	private String cityId;
	/**城市名称,对应数据库city字段**/
	private String cityName;
	private Province province;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public Province getProvince() {
		return province;
	}
	public void setProvince(Province province) {
		this.province = province;
	}
	public City(Integer id, String cityId, String cityName, Province province) {
		super();
		this.id = id;
		this.cityId = cityId;
		this.cityName = cityName;
		this.province = province;
	}
	public City() {
		super();
	}
	public City(Integer id) {
		super();
		this.id = id;
	}
	@Override
	public String toString() {
		return "City [id=" + id + ", cityId=" + cityId + ", cityName=" + cityName + ", province=" + province + "]";
	}
	
	
	
}
