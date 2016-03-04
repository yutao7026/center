package com.novel.osp.manager.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.novel.osp.manager.entity.PowerData;

@Repository
public interface PowerDataRepository extends CrudRepository<PowerData, String> {

	Page<PowerData> findAll(Pageable pageable);
	
	Page<PowerData> findAll(Specification<PowerData> specification, Pageable pageable);

}  