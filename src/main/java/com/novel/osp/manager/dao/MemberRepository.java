package com.novel.osp.manager.dao;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.novel.osp.manager.entity.Member;

@Repository
public interface MemberRepository extends CrudRepository<Member, Integer> {

	Page<Member> findAll(Pageable pageable);

	Member findByLoginNameAllIgnoringCase(String loginName);
	
	Page<Member> findAll(Specification<Member> specification, Pageable pageable);
}