package com.novel.osp.manager.controller.system;

import java.rmi.RemoteException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.osp.manager.controller.AbstractController;
import com.novel.osp.manager.entity.Log;
import com.novel.osp.manager.service.LogService;
import com.novel.osp.manager.util.IConstants;

@Controller
@RequestMapping(value = "/system/log")
public class LogController extends AbstractController<Log, Long> {
	@Autowired
	private LogService logService;

	@Override
	public String add(Log t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String form(Long id, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(Log t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Long[] id, RedirectAttributes redirectAttributes) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String list(Log log, Model model, Integer pageno) {
		model.addAttribute("active", IConstants.LOG_MGR);
		return "system/log/list";
	}

	@RequestMapping("/log")
	public String logs(Log log, Model model, Integer pageno) {
		pageno = pageno == null ? 1 : pageno;
		try {
			model.addAttribute("log", log);
			model.addAttribute("pageno", pageno);
			model.addAttribute("page", logService.findAll(log, new PageRequest(--pageno, 15)));
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return "system/log/logList";
	}

	
}
