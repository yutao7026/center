package com.novel.osp.manager.entity;

public class Progress {

	private long pBytesRead = 0L; // 到目前为止读取文件的比特数

	private long pContentLength = 0L; // 文件总大小

	private int pItems; // 目前正在读取第几个文件

	public long getpBytesRead() {

		return pBytesRead;

	}

	public void setpBytesRead(long pBytesRead) {

		this.pBytesRead = pBytesRead;

	}

	public long getpContentLength() {

		return pContentLength;

	}

	public void setpContentLength(long pContentLength) {

		this.pContentLength = pContentLength;

	}

	public int getpItems() {

		return pItems;

	}

	public void setpItems(int pItems) {

		this.pItems = pItems;

	}

	@Override
	public String toString() {

		return "ProgressEntity [pBytesRead=" + pBytesRead + ", pContentLength="

		+ pContentLength + ", pItems=" + pItems + "]";

	}
}