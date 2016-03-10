package com.novel.osp.manager.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.novel.osp.manager.dao.CityRepository;
import com.novel.osp.manager.dao.PowerData1Repository;
import com.novel.osp.manager.dao.StationRepository;
import com.novel.osp.manager.entity.City;
import com.novel.osp.manager.entity.PowerData1;
import com.novel.osp.manager.entity.Station;
import com.novel.osp.manager.service.PowerData1Service;


@Service
@Transactional
public class PowerData1ServiceImpl implements PowerData1Service {

	@Autowired
	private PowerData1Repository powerData1Repository;

	@Autowired
	private StationRepository stationRepository;

	@Autowired
	private CityRepository cityRepository;

	public PowerData1ServiceImpl() {

	}

	@Override
	public void save(PowerData1 powerData1) {
		powerData1Repository.save(powerData1);
	}

	public static void main(String[] args) {
		try {
			Date d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse("2016-03-09 12:12:10");
			long s = (System.currentTimeMillis() - d.getTime()) / 1000;
			long N = s / 3600;
			s = s % 3600;
			long K = s / 60;
			s = s % 60;
			long M = s;
			System.out.println(N + "小时 " + K + "分钟 " + M + "秒");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Page<PowerData1> findAll(Pageable pageable) {
		Page<PowerData1> datas = powerData1Repository.findAll(pageable);
		for (Iterator<PowerData1> iterator = datas.iterator(); iterator.hasNext();) {
			PowerData1 data = iterator.next();
			if (data.getRecvdatatime() != null) {
				try {
					Date d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(data.getRecvdatatime());
					long s = (System.currentTimeMillis() - d.getTime()) / 1000;
					long N = s / 3600;
					s = s % 3600;
					long K = s / 60;
					s = s % 60;
					long M = s;
					data.setD(N + "小时 " + K + "分钟 " + M + "秒");
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			Station s = stationRepository.findOne(data.getStationId());
			if (s != null) {
				City c = cityRepository.findOne(s.getpId());
				s.setCity(c);
				data.setStation(s);
			}else{
				iterator.remove();
			}
			
		}
		return datas;
	}

	@Override
	public PowerData1 findOne(String id) {
		return powerData1Repository.findOne(id);
	}

	@Override
	public void delete(String id) {
		powerData1Repository.delete(id);
	}

	@Override
	public Page<PowerData1> findAll(final PowerData1 powerData1, Pageable pageable) {
		return null;
	}
}
