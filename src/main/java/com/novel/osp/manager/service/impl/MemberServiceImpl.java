package com.novel.osp.manager.service.impl;

import java.rmi.RemoteException;
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

import com.novel.osp.manager.dao.MemberRepository;
import com.novel.osp.manager.entity.Member;
import com.novel.osp.manager.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public MemberServiceImpl() {

	}

	@Override
	public void save(Member member) {
		memberRepository.save(member);
	}

	@Override
	public Page<Member> findAll(Pageable pageable) {
		return memberRepository.findAll(pageable);
	}

	@Override
	public Member findOne(Integer id) {
		return memberRepository.findOne(id);
	}

	@Override
	public void delete(Integer id) {
		memberRepository.delete(id);
	}

	@Override
	public Member findByLoginNameAllIgnoringCase(String loginName) {
		return memberRepository.findByLoginNameAllIgnoringCase(loginName);
	}

	@Override
	public Page<Member> findAll(Member member, Pageable pageable) throws RemoteException {
		return memberRepository.findAll(new Specification<Member>() {
			public Predicate toPredicate(Root<Member> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				List<Predicate> list = new ArrayList<Predicate>();
				if (member.getLoginName() != null && !member.getLoginName().trim().equals("")) {
					list.add(cb.like(root.get("loginName").as(String.class), "%" + member.getLoginName() + "%"));
				}
				if (member.getMe_username() != null && !member.getMe_username().trim().equals("")) {
					list.add(cb.like(root.get("me_username").as(String.class), "%" + member.getMe_username() + "%"));
				}
				Predicate[] p = new Predicate[list.size()];
				query.where(list.toArray(p));
				query.orderBy(cb.asc(root.get("id").as(Integer.class)));
				return query.getRestriction();
			}
		}, pageable);
	}
}
