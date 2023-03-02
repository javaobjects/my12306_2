package net.tencent.tickets.service;

import net.tencent.tickets.dao.CertTypeDao;
import net.tencent.tickets.entity.CertType;

public class CertTypeService {

	//属性依赖certTypeDao
	private CertTypeDao certTypeDao = CertTypeDao.getInstance();
	
	
	/**
	 * <p>Title: queryCertTypeById</p>
	 * <p>
	 *    Description:
	 * </p>
	 * <p>Copyright: Copyright (c) 2017</p>
	 * <p>Company: www.baidudu.com</p>
	 * @param certTypeId
	 * @return
	 * @author xianxian
	 * @date 2023年3月2日下午7:43:13
	 * @version 1.0
	 */
	public CertType queryCertTypeById(String certTypeId) {
		return certTypeDao.queryCeryTypeById(certTypeId);
	}
	
	
	private CertTypeService(){}
	
	private static CertTypeService certTypeService;
	
	public static CertTypeService getInstance() {
		if (certTypeService == null) {
			certTypeService = new CertTypeService();
		}
		return certTypeService;
	}
	
}
