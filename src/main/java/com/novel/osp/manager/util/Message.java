package com.novel.osp.manager.util;

import java.text.MessageFormat;
import java.util.Locale;
import java.util.ResourceBundle;

public class Message {

	private static ResourceBundle bundle;

	static {
//		Locale myLocale = Locale.getDefault();
		bundle = ResourceBundle.getBundle("Message", new Locale("zh", "CN"));
	}

	public static String getValue(String key) {
		return bundle.getString(key); 
	}

	public static String getValue(String key, Object... obj) {
		return MessageFormat.format(getValue(key), obj);
	}
}
