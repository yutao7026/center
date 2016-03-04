package com.novel.osp.manager.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.novel.osp.manager.entity.PowerData;

public interface PowerDataService extends BaseService<PowerData, String> {

	Page<PowerData> findAll(PowerData powerData, Pageable pageable);

}
