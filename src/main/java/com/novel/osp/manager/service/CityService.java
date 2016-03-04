package com.novel.osp.manager.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.novel.osp.manager.entity.City;

public interface CityService extends BaseService<City, Integer> {

	Page<City> findAll(City city, Pageable pageable);

}
