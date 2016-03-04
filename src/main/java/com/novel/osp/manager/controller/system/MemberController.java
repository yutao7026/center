package com.novel.osp.manager.controller.system;

import java.rmi.RemoteException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.osp.manager.controller.AbstractController;
import com.novel.osp.manager.entity.Log;
import com.novel.osp.manager.entity.Member;
import com.novel.osp.manager.service.LogService;
import com.novel.osp.manager.service.MemberService;
import com.novel.osp.manager.util.IConstants;
import com.novel.osp.manager.util.MD5;
import com.novel.osp.manager.util.Message;

@Controller
@RequestMapping(value = "/system/member")
public class MemberController extends AbstractController<Member, Integer> {

	@Autowired
	private MemberService memberService;

	@Autowired
	private LogService logService;

	private static final String PASSWORD = "123456";

	@Override
	public String add(Member member, RedirectAttributes redirectAttributes, Model model) {
		try {
			Member m = memberService.findByLoginNameAllIgnoringCase(member.getLoginName());
			if (m != null) {
				String msg = Message.getValue("system.member.loginName.exist");
				model.addAttribute("action", "add");
				model.addAttribute("message", msg);
				model.addAttribute("member", member);
				model.addAttribute("active", IConstants.MEMBER_MGR);
				model.addAttribute("purview", IConstants.MEMBER_PURVIEW);
				logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));
				return "system/member/form";
			}
			if (member.getP() != null && member.getP().length != 0) {
				for (int i = 0; i < member.getP().length; i++) {
					if (i == 0) {
						member.setMe_purview(String.valueOf(member.getP()[i]));
					} else {
						member.setMe_purview(member.getMe_purview() + "," + String.valueOf(member.getP()[i]));
					}
				}
			}
			member.setMe_loginpwd(MD5.toMD5(member.getLoginName() + " " + PASSWORD));
			memberService.save(member);
			String msg = Message.getValue("system.member.add.success");
			redirectAttributes.addFlashAttribute("message", msg);
			logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));

		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return "redirect:/system/member/";
	}

	@Override
	public String form(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes, Model model) {
		if (id != 0) {
			Member m = memberService.findOne(id);
			m.setP(m.getMe_purview().split(","));
			m.setMe_username(replace(m.getMe_username()));
			model.addAttribute("member", m);
			model.addAttribute("action", "update");
		} else {
			model.addAttribute("member", new Member());
			model.addAttribute("action", "add");
		}
		model.addAttribute("active", IConstants.MEMBER_MGR);
		model.addAttribute("purview", IConstants.MEMBER_PURVIEW);
		return "system/member/form";
	}

	@Override
	public String update(Member member, RedirectAttributes redirectAttributes, Model model) {
		if (member.getP() != null && member.getP().length != 0) {
			for (int i = 0; i < member.getP().length; i++) {
				if (i == 0) {
					member.setMe_purview(String.valueOf(member.getP()[i]));
				} else {
					member.setMe_purview(member.getMe_purview() + "," + String.valueOf(member.getP()[i]));
				}
			}
		}
		memberService.save(member);
		String msg = Message.getValue("system.member.update.success");
		redirectAttributes.addFlashAttribute("message", msg);
		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));
		return "redirect:/system/member/";
	}

	@Override
	public String delete(Integer[] ids, RedirectAttributes redirectAttributes) {
		if (ids == null) {
			return "redirect:/system/member/";
		}
		for (Integer id : ids) {
			memberService.delete(id);
		}

		String msg = Message.getValue("system.member.del.success");
		redirectAttributes.addFlashAttribute("message", msg);
		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));

		return "redirect:/system/member/";
	}

	@Override
	public String list(Member member, Model model, Integer pageno) {
		pageno = pageno == null ? 1 : pageno;
		try {
			Member m = new Member();
			m.setLoginName(member.getLoginName());
			m.setMe_username(member.getMe_username());
			if (m.getMe_username() != null && !m.getMe_username().equals("")) {
				m.setMe_username(m.getMe_username().replaceAll("\\\\", "\\\\\\\\"));
			}
			if (member.getMe_username() != null && !member.getMe_username().equals("")) {
				member.setMe_username(replace(member.getMe_username()));

			}
			model.addAttribute("member", member);
			model.addAttribute("pageno", pageno);
			model.addAttribute("page", memberService.findAll(m, new PageRequest(--pageno, 15)));
			model.addAttribute("active", IConstants.MEMBER_MGR);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return "system/member/list";
	}

	@RequestMapping(value = "resetPassword/{id}", method = RequestMethod.GET)
	public String resetPassword(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
		redirectAttributes.addAttribute("active", IConstants.MEMBER_MGR);
		Member member = memberService.findOne(id);
		member.setMe_loginpwd(MD5.toMD5(member.getLoginName() + " " + PASSWORD));
		memberService.save(member);
		String msg = Message.getValue("system.member.resetPassword", member.getMe_username());
		redirectAttributes.addFlashAttribute("message", msg);
		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));
		return "redirect:/system/member/";
	}

	@RequestMapping(value = "password", method = RequestMethod.GET)
	public String password(Model model) {
		Member member = memberService.findOne((Integer) getSession().getAttribute(IConstants.MEMBERID));
		model.addAttribute("member", member);
		return "system/member/passwordForm";
	}

	@RequestMapping(value = "updatePassword", method = RequestMethod.POST)
	public String updatePassword(Integer id, String password, RedirectAttributes redirectAttributes) {
		Member member = memberService.findOne(id);
		member.setMe_loginpwd(MD5.toMD5(member.getLoginName() + " " + password));
		memberService.save(member);
		String msg = Message.getValue("system.member.updatePassword.success", getValueByKey(IConstants.USERNAME));
		redirectAttributes.addFlashAttribute("message", msg);
		logService.save(new Log(getValueByKey(IConstants.USERNAME), msg));
		return "redirect:/system/member/password";
	}

	private String replace(String s) {
		if (s != null && !s.equals("")) {
			s = s.replaceAll("'", "&apos;").replaceAll("\"", "&quot;");
		}
		return s;
	}
}
