package com.novel.osp.manager.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.novel.osp.manager.entity.Log;

@Repository
public interface LogRepository extends CrudRepository<Log, Integer> {

	Page<Log> findAll(Pageable pageable);
	
	Page<Log> findAll(Specification<Log> specification, Pageable pageable);

}  