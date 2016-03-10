package com.novel.osp.manager.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.novel.osp.manager.entity.City;
import com.novel.osp.manager.entity.Log;
import com.novel.osp.manager.entity.Monitor;
import com.novel.osp.manager.entity.PowerData1;
import com.novel.osp.manager.entity.Station;
import com.novel.osp.manager.service.CityService;
import com.novel.osp.manager.service.PowerData1Service;
import com.novel.osp.manager.service.StationService;
import com.novel.osp.manager.util.IConstants;

@Controller
@RequestMapping(value = "/monitor")
public class MonitorController extends AbstractController<Monitor, Integer> {
	@Autowired
	private CityService cityService;

	@Autowired 
	private StationService stationService;
	
	@Autowired
	private PowerData1Service powerData1Service;
	
	@Override
	public String list(Monitor monitor, Model model, Integer pageno) {
		model.addAttribute("active", IConstants.CHANNEL_MGR);
		Page<City> citys = cityService.findAll(null);
		Page<Station> stations = stationService.findAll(null);
		ObjectMapper mapper = new ObjectMapper();
		try {
			model.addAttribute("citysJson", mapper.writeValueAsString(citys.getContent()));
			model.addAttribute("stationsJson", mapper.writeValueAsString(stations.getContent()));
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "monitor/list";
	}
	
	@RequestMapping("/tableList")
	public String tableList(Model model, Integer pageno, String cityId, String name, String id) {
		model.addAttribute("active", IConstants.PAGE_BACKGROUND_MGR);
		model.addAttribute("citys", cityService.findAll(null).getContent());
		model.addAttribute("cityId", cityId);
		model.addAttribute("name", name);
		model.addAttribute("id", id);
		model.addAttribute("stations", stationService.getStationByParam(cityId, name, id));
		model.addAttribute("chargeSourceTypes", IConstants.CHARGE_SOURCE_TYPE);
		model.addAttribute("supplyCeelTypes", IConstants.SUPPLY_CEEL_TYPE);
		return "monitor/tableList";
	}
	
	@RequestMapping("export")
	public void export(HttpServletResponse resp) {
		ServletOutputStream out = null;
		try {
			byte[] b = null;
			String fileName = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".csv";
			resp.setHeader("content-type", "application/json");
			resp.addHeader("content-disposition", "attachment;filename=" + fileName);
			out = resp.getOutputStream();
			out.write(b);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@RequestMapping("/powerData")
	@ResponseBody
	public List<PowerData1> powerData() {
		return powerData1Service.findAll(null).getContent();
	}

	@RequestMapping("/log")
	public String logs(Log log, Model model, Integer pageno) {
		pageno = pageno == null ? 1 : pageno;
		model.addAttribute("log", log);
		model.addAttribute("pageno", pageno);
		// model.addAttribute("page", logService.findAll(log, new
		// PageRequest(--pageno, 10)));
		return "system/log/logList";
	}

	@Override
	public String add(Monitor t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String form(Integer id, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(Monitor t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Integer[] id, RedirectAttributes redirectAttributes) {
		// TODO Auto-generated method stub
		return null;
	}

}

