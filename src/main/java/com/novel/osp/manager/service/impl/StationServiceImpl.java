package com.novel.osp.manager.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.novel.osp.manager.dao.CityRepository;
import com.novel.osp.manager.dao.NativeRepository;
import com.novel.osp.manager.dao.StationRepository;
import com.novel.osp.manager.entity.City;
import com.novel.osp.manager.entity.Station;
import com.novel.osp.manager.service.StationService;

@Service
@Transactional
public class StationServiceImpl implements StationService {

	@Autowired
	private StationRepository stationRepository;

	@Autowired
	private CityRepository cityRepository;
	
	@Autowired
	private NativeRepository nativeRepository;
	
	public StationServiceImpl() {

	}

	@Override
	public void save(Station station) {
		stationRepository.save(station);
	}

	@Override
	public Page<Station> findAll(Pageable pageable) {
		Page<Station> stations = stationRepository.findAll(pageable);
		for (Station s : stations) {
			City c = cityRepository.findOne(s.getpId());
			s.setCity(c);
		}
		return stations;
	}

	@Override
	public Station findOne(String id) {
		return stationRepository.findOne(id);
	}

	@Override
	public void delete(String id) {
		stationRepository.delete(id);
	}

	@Override
	public Page<Station> findAll(final Station station, Pageable pageable) {
		Page<Station> stations = stationRepository.findAll(new Specification<Station>() {
			public Predicate toPredicate(Root<Station> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (station.getName() != null && !station.getName().trim().equals("")) {
					list.add(cb.like(root.get("name").as(String.class), "%" + station.getName() + "%"));
				}
				if (station.getpId() != null) {
					list.add(cb.equal(root.get("pId").as(Integer.class), station.getpId()));
				}
				Predicate[] p = new Predicate[list.size()];
				query.where(list.toArray(p));
				query.orderBy(cb.asc(root.get("pId").as(Integer.class)));
				return query.getRestriction();
			}
		}, pageable);

		for (Station s : stations) {
			City c = cityRepository.findOne(s.getpId());
			s.setCity(c);
		}
		return stations;
	}

	@Override
	public List<Station> getStationByParam(String cityId, String name, String id) {
		List<Station> stations = new ArrayList<Station>();
		List<Object[]> objs = nativeRepository.getStationByParam(cityId, name, id);
		for(Object[] obj : objs){
			Station s = new Station();
			s.setId(obj[0].toString());
			s.setName(obj[1].toString());
			s.setLng(obj[2].toString());
			s.setLat(obj[3].toString());
			City c = new City();
			c.setId(Integer.valueOf(obj[4].toString()));
			s.setCity(c);
			s.setIp(obj[5].toString());
			s.setPort(obj[6].toString());
			s.setType(obj[7].toString());
			stations.add(s);
		}
		return stations;
	}
}
