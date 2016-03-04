package com.novel.osp.manager.controller;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.osp.manager.entity.PowerData;
import com.novel.osp.manager.entity.Station;
import com.novel.osp.manager.service.CityService;
import com.novel.osp.manager.service.PowerDataService;
import com.novel.osp.manager.service.StationService;
import com.novel.osp.manager.util.IConstants;

@Controller
@RequestMapping(value = "/powerData")
public class PowerDataController extends AbstractController<PowerData, String> {
	@Autowired
	private PowerDataService powerDataService;

	@Autowired
	private CityService cityService;
	
	@Autowired
	private StationService stationService;

	@Override
	public String list(PowerData powerData, Model model, Integer pageno) {
		pageno = pageno == null ? 1 : pageno;
		model.addAttribute("powerData", powerData);
		model.addAttribute("pageno", pageno);
		model.addAttribute("chargeSourceTypes", IConstants.CHARGE_SOURCE_TYPE);
		model.addAttribute("supplyCeelTypes", IConstants.SUPPLY_CEEL_TYPE);
		model.addAttribute("citys", cityService.findAll(null).getContent());
		model.addAttribute("page", powerDataService.findAll(powerData, new PageRequest(--pageno, 15)));
		model.addAttribute("active", IConstants.RECOMMEND_MGR);
		List<Station> stations = new ArrayList<Station>();
		if(powerData != null && powerData.getStation() != null && powerData.getStation().getpId() != null){
			Station s = new Station();
			s.setpId(powerData.getStation().getpId());
			stations = stationService.findAll(s, null).getContent();
		}
		model.addAttribute("stations", stations);
		return "powerData/list";
	}

	@RequestMapping("export")
	public void export(PowerData powerData, HttpServletResponse resp) {
		ServletOutputStream out = null;
		try {
			byte[] b = null;
			Page<PowerData> datas = powerDataService.findAll(powerData, new PageRequest(0, Integer.MAX_VALUE));
			StringBuffer result = new StringBuffer();
			result.append("最近更新时间,");
			result.append("省份,");
			result.append("台站编号,");
			result.append("台站名称,");
			result.append("运行模式,");
			result.append("设备号,");
			result.append("AC,");
			result.append("太阳能电压,");
			result.append("供电电压,");
			result.append("供电电流,");
			result.append("充电电压,");
			result.append("充电电流,");
			result.append("设备温度,");
			result.append("环境温度,");
			result.append("环境湿度,");
			result.append("供电源,");
			result.append("供电电池组,");
			result.append("负载1电压,");
			result.append("负载1电流,");
			result.append("负载2电压,");
			result.append("负载2电流,");
			result.append("负载3电压,");
			result.append("负载3电流,");
			result.append("负载4电压,");
			result.append("负载4电流,");
			result.append("负载5电压,");
			result.append("负载5电流,");
			
			result.append("内阻A状态,");
			result.append("内阻A阴值,");
			result.append("内阻B状态,");
			result.append("内阻B阴值,");
			result.append("内阻C状态,");
			result.append("内阻C阴值,");
			result.append("内阻D状态,");
			result.append("内阻D阴值,");
			
			result.append("门磁,");
			result.append("红外,");
			result.append("浸水,");
			result.append("雷击,");
			result.append("SD卡,");
			result.append("坐标,");
			result.append("IP地址,");
			result.append("端口号,");
			result.append("下位机设备ping状态,");
			result.append("冗余数采分钟值数据");
			result.append("\n");
			
			for (PowerData data : datas) {
				result.append(data.getRecvdatatime()).append(",");
				result.append(data.getStation().getpId()).append(",");
				result.append(data.getStation().getId()).append(",");
				result.append(data.getStation().getName()).append(",");
				result.append(data.getPowerstatus()).append(",");
				result.append(data.getDevno()).append(",");
				result.append(data.getAc()).append(",");
				result.append(data.getVoltagesolarceel()).append(",");
				result.append(data.getSupplyvoltage()).append(",");
				result.append(data.getSupplycurrent()).append(",");
				result.append(data.getChargevoltage()).append(",");
				result.append(data.getChargecurrent()).append(",");
				result.append(data.getDevtemp()).append(",");
				
				result.append(data.getEnvtemp()).append(",");
				result.append(data.getEnvhum()).append(",");
				result.append(data.getChargesource()).append(",");
				
				result.append(data.getSupplyceel()).append(",");
				
				result.append(data.getLoadvoltage1()).append(",");
				result.append(data.getLoadcurrent1()).append(",");
				result.append(data.getLoadvoltage2()).append(",");
				result.append(data.getLoadcurrent2()).append(",");
				result.append(data.getLoadvoltage3()).append(",");
				result.append(data.getLoadcurrent3()).append(",");
				result.append(data.getLoadvoltage4()).append(",");
				result.append(data.getLoadcurrent4()).append(",");
				result.append(data.getLoadvoltage5()).append(",");
				result.append(data.getLoadcurrent5()).append(",");
				
				result.append(data.getInnerstatus1()).append(",");
				result.append(data.getInnervalue1()).append(",");
				result.append(data.getInnerstatus2()).append(",");
				result.append(data.getInnervalue2()).append(",");
				result.append(data.getInnerstatus3()).append(",");
				result.append(data.getInnervalue3()).append(",");
				result.append(data.getInnerstatus4()).append(",");
				result.append(data.getInnervalue4()).append(",");
				
				result.append(data.getFlagdoor()).append(",");
				result.append(data.getFlagIR()).append(",");
				result.append(data.getFlagwater()).append(",");
				result.append(data.getFlaglight()).append(",");
				result.append(data.getFlagSD()).append(",");
				result.append(data.getStation().getLat()).append(", ").append(data.getStation().getLng()).append(",");
				
				result.append(data.getStation().getIp()).append(",");
				result.append(data.getStation().getPort()).append(",");
				result.append(data.getPingstatus()).append(",");
				result.append(data.getThdccminvalue()).append("\n");
			}
			b = stringToByte(result.toString());
			String fileName = "history_" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ".csv";
			resp.setHeader("content-type", "application/csv");
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

	public static byte[] stringToByte(String in) {
		ByteArrayInputStream is = null;
		ByteArrayOutputStream out = null;
		try {
			is = new ByteArrayInputStream(in.getBytes());
			out = new ByteArrayOutputStream();
			byte[] data = new byte[4096];
			int count = -1;
			while ((count = is.read(data, 0, 4096)) != -1)
				out.write(data, 0, count);

			data = null;
			return out.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (out != null) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (in != null) {
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return null;

	}

	@Override
	public String add(PowerData t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String form(String id, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(PowerData t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(String[] id, RedirectAttributes redirectAttributes) {
		// TODO Auto-generated method stub
		return null;
	}

}
