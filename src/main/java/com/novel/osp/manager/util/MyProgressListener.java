package com.novel.osp.manager.util;

import java.text.DecimalFormat;

import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.ProgressListener;

import com.novel.osp.manager.entity.Progress;


public class MyProgressListener implements ProgressListener {

	private HttpSession session;

	public MyProgressListener() {

	}

	public MyProgressListener(HttpSession session) {

		this.session = session;

		Progress ps = new Progress();

		session.setAttribute("upload_ps", ps);

	}

	public void setSession(HttpSession session) {

		this.session = session;

	}

	@Override
	public void update(long pBytesRead, long pContentLength, int pItems) {

		Progress ps = (Progress) session.getAttribute("upload_ps");

		ps.setpBytesRead(pBytesRead);

		ps.setpContentLength(pContentLength);

		ps.setpItems(pItems);
		if(pContentLength != 0){
			Double percent = (double) ps.getpBytesRead() / (double) ps.getpContentLength();
			if (percent != 0d) {
				DecimalFormat df = new DecimalFormat("0.0");
				percent = Double.parseDouble(df.format(percent));
				session.setAttribute("upload_percent", percent);
			}
		}
		
		
		session.setAttribute("upload_ps", ps);

	}

}