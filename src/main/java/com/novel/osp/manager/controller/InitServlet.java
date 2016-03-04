package com.novel.osp.manager.controller;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;

import org.springframework.web.servlet.DispatcherServlet;

import com.novel.osp.manager.util.IConstants;

public class InitServlet extends DispatcherServlet {

	private static final long serialVersionUID = 1L;

	public static String WEB_ROOT = "";

	public static String ip = null;

 
	@Override
	public void init(ServletConfig config) throws ServletException {
		super.init(config);
		IConstants.CHARGE_SOURCE_TYPE.put("A", "AC充电");
		IConstants.CHARGE_SOURCE_TYPE.put("B", "太阳能充电");
		IConstants.CHARGE_SOURCE_TYPE.put("Z", "未充电");
		
		IConstants.SUPPLY_CEEL_TYPE.put("C", "A组电池");
		IConstants.SUPPLY_CEEL_TYPE.put("D", "B组电池");
		IConstants.SUPPLY_CEEL_TYPE.put("Y", "电池未接入");
		
		IConstants.LOCATION_TYPE.put(1, "左上");
		IConstants.LOCATION_TYPE.put(2, "右上");
		IConstants.LOCATION_TYPE.put(3, "左下");
		IConstants.LOCATION_TYPE.put(4, "右下");
		IConstants.LOCATION_TYPE.put(5, "视频");
		
		IConstants.RECOMMEND_MARK.put(0, "最新");
		IConstants.RECOMMEND_MARK.put(1, "最热");
		
		IConstants.MEMBER_PURVIEW.put(1, "地图监测");
		IConstants.MEMBER_PURVIEW.put(2, "台站管理");
		IConstants.MEMBER_PURVIEW.put(3, "历史数据");
		IConstants.MEMBER_PURVIEW.put(4, "状态列表");
		IConstants.MEMBER_PURVIEW.put(5, "日志管理");
		
		
		
	}


	@Override
	public void destroy() {
		super.destroy();
	}
}
