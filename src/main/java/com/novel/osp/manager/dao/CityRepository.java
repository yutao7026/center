package com.novel.osp.manager.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.novel.osp.manager.entity.City;

@Repository
public interface CityRepository extends CrudRepository<City, Integer> {

	Page<City> findAll(Pageable pageable);
	
	Page<City> findAll(Specification<City> specification, Pageable pageable);

}  