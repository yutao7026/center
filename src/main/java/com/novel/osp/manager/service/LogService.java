package com.novel.osp.manager.service;

import java.rmi.Remote;
import java.rmi.RemoteException;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.novel.osp.manager.entity.Log;

public interface LogService extends Remote, BaseService<Log, Integer> {

	Page<Log> findAll(Log log, Pageable pageable) throws RemoteException;

}
   