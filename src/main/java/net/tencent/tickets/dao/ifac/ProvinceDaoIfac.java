package net.tencent.tickets.dao.ifac;

import java.util.List;

import net.tencent.tickets.entity.Province;

public interface ProvinceDaoIfac {

	/**
	 * <p>Title: queryAllProvince</p>
	 * <p>
	 *    Description:查询所有的省份
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @return
	 * @author xianxian
	 * @date 2023年2月25日下午6:27:17
	 * @version 1.0
	 */
	public abstract List<Province> queryAllProvince();
}
