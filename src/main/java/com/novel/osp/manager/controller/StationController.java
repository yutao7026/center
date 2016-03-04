package com.novel.osp.manager.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.osp.manager.entity.Log;
import com.novel.osp.manager.entity.PowerData1;
import com.novel.osp.manager.entity.Station;
import com.novel.osp.manager.service.CityService;
import com.novel.osp.manager.service.LogService;
import com.novel.osp.manager.service.StationService;
import com.novel.osp.manager.util.IConstants;
import com.novel.osp.manager.util.Message;

@Controller
@RequestMapping(value = "/station")
public class StationController extends AbstractController<Station, String> {
	@Autowired
	private CityService cityService;

	@Autowired
	private StationService stationService;

	@Autowired
	private LogService logService;

	@Override
	public String list(Station station, Model model, Integer pageno) {
		pageno = pageno == null ? 1 : pageno;
		model.addAttribute("station", station);
		model.addAttribute("pageno", pageno);
		model.addAttribute("citys", cityService.findAll(null).getContent());
		model.addAttribute("page", stationService.findAll(station, new PageRequest(--pageno, 15)));
		model.addAttribute("active", IConstants.STATION_MGR);
		return "station/list";
	}

	@Override
	public String add(Station station, RedirectAttributes redirectAttributes, Model model) {
		stationService.save(station);
		String msg = Message.getValue("station.add.success");
		redirectAttributes.addFlashAttribute("msgType", MSG_TYPE_SUCCESS).addFlashAttribute("message", msg);
		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));
		return "redirect:/station";
	}

	@Override
	public String form(@PathVariable("id") String id, RedirectAttributes redirectAttributes, Model model) {
		if (!id.equals("0")) {
			Station station = stationService.findOne(id);
			model.addAttribute("station", station);
			model.addAttribute("action", "update");
		} else {
			Station s = new Station();
			s.setType("1");
			model.addAttribute("station", s);
			model.addAttribute("action", "add");
		}
		model.addAttribute("active", IConstants.STATION_MGR);
		model.addAttribute("citys", cityService.findAll(null).getContent());
		return "station/form";
	}
	
	@RequestMapping("/stationsByCityId/{cityId}")
	@ResponseBody
	public List<Station> stationsByCityId(@PathVariable("cityId") Integer cityId) {
		Station s = new Station();
		s.setpId(cityId);
		return stationService.findAll(s, null).getContent();
	}

	@Override
	public String update(Station station, RedirectAttributes redirectAttributes, Model model) {
		stationService.save(station);
		String msg = Message.getValue("station.update.success");
		redirectAttributes.addFlashAttribute("msgType", MSG_TYPE_SUCCESS).addFlashAttribute("message", msg);
		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));
		return "redirect:/station";
	}

	@Override
	public String delete(String[] ids, RedirectAttributes redirectAttributes) {
		if (ids == null) {
			return "redirect:/station/";
		}
		for (String id : ids) {
			stationService.delete(id);
		}
		String msg = Message.getValue("station.del.success");
		redirectAttributes.addFlashAttribute("msgType", MSG_TYPE_SUCCESS).addFlashAttribute("message", msg);

		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));

		return "redirect:/station/";
	}

}
