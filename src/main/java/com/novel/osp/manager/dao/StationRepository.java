package com.novel.osp.manager.dao;


import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.novel.osp.manager.entity.Station;

@Repository
public interface StationRepository extends CrudRepository<Station, String> {

	Page<Station> findAll(Pageable pageable);
	
	Page<Station> findAll(Specification<Station> specification, Pageable pageable);
	
}  