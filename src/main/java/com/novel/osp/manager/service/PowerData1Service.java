package com.novel.osp.manager.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.novel.osp.manager.entity.PowerData1;

public interface PowerData1Service extends BaseService<PowerData1, String> {

	Page<PowerData1> findAll(PowerData1 powerData, Pageable pageable);

}
