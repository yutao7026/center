package com.novel.osp.manager.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.novel.osp.manager.entity.PowerData;
import com.novel.osp.manager.entity.PowerData1;

@Repository
public interface PowerData1Repository extends CrudRepository<PowerData1, String> {

	Page<PowerData1> findAll(Pageable pageable);
	
	Page<PowerData1> findAll(Specification<PowerData> specification, Pageable pageable);

}  