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
import com.novel.osp.manager.entity.City;
import com.novel.osp.manager.service.CityService;

@Service
@Transactional
public class CityServiceImpl implements CityService {

	@Autowired
	private CityRepository cityRepository;

	public CityServiceImpl() {

	}

	@Override
	public void save(City city) {
		cityRepository.save(city);
	}

	@Override
	public Page<City> findAll(Pageable pageable) {
		return cityRepository.findAll(pageable);
	}

	@Override
	public City findOne(Integer id) {
		return cityRepository.findOne(id);
	}

	@Override
	public void delete(Integer id) {
		cityRepository.delete(id);
	}

	@Override
	public Page<City> findAll(final City city, Pageable pageable) {
		return cityRepository.findAll(new Specification<City>() {
			public Predicate toPredicate(Root<City> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (city.getName() != null && !city.getName().trim().equals("")) {
					list.add(cb.like(root.get("name").as(String.class), "%" + city.getName() + "%"));
				}

				Predicate[] p = new Predicate[list.size()];
				query.where(list.toArray(p));
				query.orderBy(cb.desc(root.get("id").as(Integer.class)));
				return query.getRestriction();
			}
		}, pageable);
	}
}
