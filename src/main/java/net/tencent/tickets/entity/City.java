package net.tencent.tickets.entity;

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
	private String cityNum;
	/**城市名称,对应数据库city字段**/
	private String cityName;
	private String provinceNum;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCityNum() {
		return cityNum;
	}
	public void setCityNum(String cityNum) {
		this.cityNum = cityNum;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getProvinceNum() {
		return provinceNum;
	}
	public void setProvinceNum(String provinceNum) {
		this.provinceNum = provinceNum;
	}
	public City(Integer id, String cityNum, String cityName, String provinceNum) {
		super();
		this.id = id;
		this.cityNum = cityNum;
		this.cityName = cityName;
		this.provinceNum = provinceNum;
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
		return "City [id=" + id + ", cityId=" + cityNum + ", cityName=" + cityName + ", provinceNum=" + provinceNum + "]";
	}
}
