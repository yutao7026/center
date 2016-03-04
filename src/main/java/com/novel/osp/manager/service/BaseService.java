package com.novel.osp.manager.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface BaseService<T, PK> {

	void delete(PK id);

	T findOne(PK id);

	void save(T t);

	Page<T> findAll(Pageable pageable);
}
