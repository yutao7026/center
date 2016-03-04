package com.novel.osp.manager.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.novel.osp.manager.dao.CityRepository;
import com.novel.osp.manager.dao.PowerDataRepository;
import com.novel.osp.manager.entity.City;
import com.novel.osp.manager.entity.PowerData;
import com.novel.osp.manager.entity.Station;
import com.novel.osp.manager.service.PowerDataService;

@Service
@Transactional
public class PowerDataServiceImpl implements PowerDataService {

	@Autowired
	private PowerDataRepository powerDataRepository;

	@Autowired
	private CityRepository cityRepository;

	public PowerDataServiceImpl() {

	}

	@Override
	public void save(PowerData powerData) {
		powerDataRepository.save(powerData);
	}

	@Override
	public Page<PowerData> findAll(Pageable pageable) {
		return powerDataRepository.findAll(pageable);
	}

	@Override
	public PowerData findOne(String id) {
		return powerDataRepository.findOne(id);
	}

	@Override
	public void delete(String id) {
		powerDataRepository.delete(id);
	}

	@Override
	public Page<PowerData> findAll(final PowerData powerData, Pageable pageable) {
		Page<PowerData> datas = powerDataRepository.findAll(new Specification<PowerData>() {
			public Predicate toPredicate(Root<PowerData> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				Join<PowerData, Station> stationJoin = root
						.join(root.getModel().getSingularAttribute("station", Station.class), JoinType.LEFT);
				if (powerData.getStation() != null && powerData.getStation().getpId() != null) {
					list.add(cb.equal(stationJoin.get("pId").as(Integer.class), powerData.getStation().getpId()));
				}

				if (powerData.getStation() != null && powerData.getStation().getId() != null) {
					list.add(cb.like(stationJoin.get("id").as(String.class),
							"%" + powerData.getStation().getId() + "%"));
				}

				if (powerData.getStation() != null && powerData.getStation().getName() != null) {
					list.add(cb.like(stationJoin.get("name").as(String.class),
							"%" + powerData.getStation().getName() + "%"));
				}
				if (powerData.getStart() != null && !powerData.getStart().trim().equals("")) {
					list.add(cb.greaterThanOrEqualTo(root.get("recvdatatime").as(String.class), powerData.getStart()));
				}

				if (powerData.getEnd() != null && !powerData.getEnd().trim().equals("")) {
					list.add(cb.lessThanOrEqualTo(root.get("recvdatatime").as(String.class), powerData.getEnd()));
				}
				// if (powerData.getStation().getpId() != null) {
				// list.add(cb.equal(root.get("cityid").as(Integer.class),
				// powerData.getCityid()));
				// }

				// if (powerData.getStation().getName() != null &&
				// !powerData.getStation().getName().trim().equals("")) {
				// list.add(cb.like(root.get("stationId").as(String.class), "%"
				// + powerData.getStationId() + "%"));
				// }

				Predicate[] p = new Predicate[list.size()];
				query.where(list.toArray(p));
				if (powerData.getSortValue().equals("desc")) {
					if (powerData.getSortField().equals("pId") || powerData.getSortField().equals("id") || powerData.getSortField().equals("name")) {
						query.orderBy(cb.desc(stationJoin.get(powerData.getSortField()).as(String.class)));
					} else {
						query.orderBy(cb.desc(root.get(powerData.getSortField()).as(String.class)));
					}
				} else if (powerData.getSortValue().equals("asc")) {
					if (powerData.getSortField().equals("pId") || powerData.getSortField().equals("id") || powerData.getSortField().equals("name")) {
						query.orderBy(cb.asc(stationJoin.get(powerData.getSortField()).as(String.class)));
					} else {
						query.orderBy(cb.asc(root.get(powerData.getSortField()).as(String.class)));
					}
				}

				return query.getRestriction();
			}
		}, pageable);
		for (PowerData data : datas) {
			Station s = data.getStation();
			if (s != null) {
				City c = cityRepository.findOne(s.getpId());
				s.setCity(c);
				data.setStation(s);
			}
		}
		return datas;
	}
}
