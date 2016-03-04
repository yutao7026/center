package com.novel.osp.manager.controller;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.rmi.RemoteException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.remoting.RemoteLookupFailureException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.novel.osp.manager.exception.BusinessException;
import com.novel.osp.manager.util.IConstants;

public abstract class AbstractController<T, PK extends Serializable> {

	private static final Logger log = Logger.getLogger(AbstractController.class);

	public static final String MSG_TYPE_SUCCESS = "success";
	public static final String MSG_TYPE_WARNING = "warning";
	public static final String MSG_TYPE_DANGER = "danger";

	@RequestMapping(value = "add", method = RequestMethod.POST)
	public abstract String add(T t, RedirectAttributes redirectAttributes, Model model);

	@RequestMapping(value = "update/{id}", method = RequestMethod.GET)
	public abstract String form(@PathVariable("id") PK id, RedirectAttributes redirectAttributes, Model model);

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public abstract String update(T t, RedirectAttributes redirectAttributes, Model model);

	@RequestMapping(value = "delete")
	public abstract String delete(PK[] id, RedirectAttributes redirectAttributes);

	@RequestMapping
	public abstract String list(T t, Model model, Integer pageno);

	public HttpSession getSession() {
		return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest().getSession();
	}

	public String getValueByKey(String key) {
		String value = (String) getSession().getAttribute(key);
		return value == null ? "" : value;
	}

	public void setAttribute(String key, Object value) {
		getSession().setAttribute(key, value);
	}

	public void removeAttribute(String key) {
		getSession().removeAttribute(key);
	}

	@ExceptionHandler
	public String exp(HttpServletRequest request, Exception ex) {
		request.setAttribute("ex", ex);
		log.error(ex);
		if (ex instanceof BusinessException) {
			
		} else if (ex instanceof RemoteException) {
			
		} else if (ex instanceof RemoteLookupFailureException) {
		}
		return "error/error";
	}

	public void fileUpload(String contextPath, MultipartFile file, String fileName)
			throws IllegalStateException, IOException {
		File filepath = new File(contextPath);
		if (!filepath.exists()) {
			filepath.mkdirs();
		}
		File orgFile = new File(contextPath, fileName);
		file.transferTo(orgFile);
	}

	public String upload(String path, MultipartFile file) {
		try {
			String fileName = UUID.randomUUID().toString().toUpperCase().replaceAll("-", "")
					+ file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			fileUpload(IConstants.UPLOAD_PATH + path, file, fileName);
			return "1:" + path + fileName;
		} catch (Exception e) {
			e.printStackTrace();
			return "2:";
		}
	}
}
