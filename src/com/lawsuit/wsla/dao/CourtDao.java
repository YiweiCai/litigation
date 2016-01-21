package com.lawsuit.wsla.dao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.core.base.web.Servlets;
import org.hibernate.SessionFactory;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.core.base.dao.hibernate.BaseHibernateDao;
import com.core.base.dao.utils.builder.HqlBuilder;
import com.core.base.entity.Page;
import com.lawsuit.wsla.entity.CourtOpenInfo;

@Repository
@Transactional
public class CourtDao {
	@Autowired
	protected SessionFactory sessionFactory;
	@Autowired
	private BaseHibernateDao baseHibernateDao;
	
	public Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	public void saveCourtOpenInfo(CourtOpenInfo courtOpenInfo){
		this.getSession().save(courtOpenInfo);
	}
	public List<CourtOpenInfo> getCourtOpenInfoList(){
		String hql = "from CourtOpenInfo";
		List<CourtOpenInfo> list = this.getSession().createQuery(hql).list();
		return list.size()>0?list:null;
	}
	public Page findPage(Page page,String requestNameSpace) {
		// TODO Auto-generated method stub

		String hql = "from CourtOpenInfo coi where coi.organization ='"+requestNameSpace+"' ORDER BY coi.startTime ASC";
		HqlBuilder hqlBuilder = new HqlBuilder(hql);
		try {
			return baseHibernateDao.findPage(page, hqlBuilder);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		
	}
	
}
