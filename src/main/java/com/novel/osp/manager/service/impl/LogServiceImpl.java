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

import com.novel.osp.manager.dao.LogRepository;
import com.novel.osp.manager.entity.Log;
import com.novel.osp.manager.service.LogService;

@Service
@Transactional
public class LogServiceImpl implements LogService {

	@Autowired
	private LogRepository logRepository;

	public LogServiceImpl() {

	}

	@Override
	public void save(Log log) {
		logRepository.save(log);
	}

	@Override
	public Page<Log> findAll(Pageable pageable) {
		return logRepository.findAll(pageable);
	}

	@Override
	public Log findOne(Integer id) {
		return logRepository.findOne(id);
	}

	@Override
	public void delete(Integer id) {
		logRepository.delete(id);
	}

	@Override
	public Page<Log> findAll(final Log log, Pageable pageable) {
		return logRepository.findAll(new Specification<Log>() {
			public Predicate toPredicate(Root<Log> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (log.getName() != null && !log.getName().trim().equals("")) {
					list.add(cb.like(root.get("name").as(String.class), "%" + log.getName() + "%"));
				}
				if (log.getText() != null && !log.getText().trim().equals("")) {
					list.add(cb.like(root.get("text").as(String.class), "%" + log.getText() + "%"));
				}
				Predicate[] p = new Predicate[list.size()];
				query.where(list.toArray(p));
				query.orderBy(cb.desc(root.get("id").as(Integer.class)));
				return query.getRestriction();
			}
		}, pageable);
	}
}
