package com.novel.osp.manager.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;


public class SpringContextUtil implements ApplicationContextAware {
	
	private static SpringContextUtil instance;

	public static SpringContextUtil getInstance() {
		if (instance == null) {
			instance = new SpringContextUtil();
		}
		return instance;
	}

	private SpringContextUtil() {

	}

	private static ApplicationContext applicationContext;

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		SpringContextUtil.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	@SuppressWarnings("unchecked")
	public static <T> T getBean(String bean, Class<T> c) {
		return (T) getApplicationContext().getBean(bean);
	}

}
