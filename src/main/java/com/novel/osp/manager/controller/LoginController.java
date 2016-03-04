package com.novel.osp.manager.controller;

import java.rmi.RemoteException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.osp.manager.entity.Login;
import com.novel.osp.manager.entity.Member;
import com.novel.osp.manager.service.MemberService;
import com.novel.osp.manager.util.IConstants;
import com.novel.osp.manager.util.MD5;

@Controller
@RequestMapping(value = "/")
public class LoginController extends AbstractController<Login, Long> {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "index")
	public String index(Model model) {
		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public @ResponseBody String login(Model model, String username, String password) {
		if ((username == null || username.trim().equals("")) && (password == null || password.trim().equals(""))) {
			return "6";
		} else if (username == null || username.trim().equals("")) {
			return "5";
		} else if (password == null || password.trim().equals("")) {
			return "4";
		}
		Member member;
		try {
			member = memberService.findByLoginNameAllIgnoringCase(username);
			if (member == null) {
				return "3";
			} else if (!member.getMe_loginpwd().toUpperCase().equals(MD5.toMD5(username.trim() + " " + password.trim()))) {
				return "2";
			} else {
				if (member.getMe_status() == 2) {
					setAttribute(IConstants.USERNAME, member.getLoginName());
					setAttribute(IConstants.MEMBERID, member.getId());
					setAttribute(IConstants.PURVIEW, member.getMe_purview());
					setAttribute(IConstants.MEMBERNAME, member.getMe_username());
					setAttribute(IConstants.HOME, getMenuUrlById(member.getMe_purview().split(",")[0]));
					return "1," + getMenuUrlById(member.getMe_purview().split(",")[0]);
				} else {
					return "7";
				}

			}
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return "";
	}

	private String getMenuUrlById(String id) {
		switch (Integer.valueOf(id)) {
		case 1:
			return "monitor";
		case 2:
			return "station";
		case 3:
			return "powerData";
		case 4:
			return "monitor/tableList";
		case 5:
			return "report";
		default:
			return "system/log";
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(Model model) {
		removeAttribute(IConstants.USERNAME);
		removeAttribute(IConstants.MEMBERID);
		removeAttribute(IConstants.PURVIEW);
		removeAttribute(IConstants.MEMBERNAME);
		return "redirect:/";
	}

	@RequestMapping(value = "updatePasswordForm", method = RequestMethod.GET)
	public String updatePasswordForm(Model model, String password, String password1) {
		return "redirect:/";
	}

	@Override
	public String add(Login t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String form(Long id, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String update(Login t, RedirectAttributes redirectAttributes, Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Long[] id, RedirectAttributes redirectAttributes) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@RequestMapping(value = "a")
	public String list(Login t, Model model, Integer pageno) {
		// TODO Auto-generated method stub
		return null;
	}

}
