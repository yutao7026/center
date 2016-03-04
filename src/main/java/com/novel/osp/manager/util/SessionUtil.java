package com.novel.osp.manager.util;

import javax.servlet.http.HttpSession;

public class SessionUtil {
	public static boolean checkPurview(HttpSession session) {
		return true;
//		return !session.getAttribute(IConstants.PURVIEW).equals("2");
	}
}
