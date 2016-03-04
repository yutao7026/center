package com.novel.osp.manager.service;

import java.rmi.Remote;
import java.rmi.RemoteException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.novel.osp.manager.entity.Member;

 
public interface MemberService extends Remote, BaseService<Member, Integer> {

	Member findByLoginNameAllIgnoringCase(String loginName) throws RemoteException;
	
	Page<Member> findAll(final Member member, Pageable pageable) throws RemoteException;
}
