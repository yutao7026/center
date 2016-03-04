package com.novel.osp.manager.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;
@SuppressWarnings("unchecked")
@Repository
public class NativeRepository {

	@PersistenceContext
	private EntityManager em;
	
	
	
	public List<Object[]> getStationByParam(String cityId, String name, String id) {
		StringBuffer sql = new StringBuffer("select id, name, lng, lat, cityId, ip, port, type from station where 1=1 ");
		if(cityId != null && !cityId.trim().equals("-1")){
			sql.append(" and cityId=" + cityId);
		}
		if(name != null && !name.trim().equals("")){
			sql.append(" and name like '%" + name + "%' ");
		}
		if(id != null && !id.trim().equals("")){
			sql.append(" and id like '%" + id + "%' ");
		}
		Query q = em.createNativeQuery(sql.toString());
		return q.getResultList();
	}

}
