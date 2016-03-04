package com.novel.osp.manager.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.novel.osp.manager.entity.Station;

public interface StationService extends BaseService<Station, String> {

	Page<Station> findAll(Station station, Pageable pageable);

	List<Station> getStationByParam(String cityId, String name, String id);
}
