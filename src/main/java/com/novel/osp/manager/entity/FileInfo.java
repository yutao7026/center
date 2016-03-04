package com.novel.osp.manager.entity;

import java.util.List;

public class FileInfo {
	private Long id;
	private Integer broadcastId;
	private Long parentId;
	private Byte type;
	private String name;
	private boolean open = true;
	private List<FileInfo> children;
	private boolean isParent = false;

	public FileInfo() {

	}

	public FileInfo(Integer broadcastId, Long parentId) {
		this.broadcastId = broadcastId;
		this.parentId = parentId;
	}

	public FileInfo(Long id, Integer broadcastId, Long parentId, Byte type, String name) {
		this.id = id;
		this.broadcastId = broadcastId;
		this.parentId = parentId;
		this.type = type;
		this.name = name;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getBroadcastId() {
		return broadcastId;
	}

	public void setBroadcastId(Integer broadcastId) {
		this.broadcastId = broadcastId;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<FileInfo> getChildren() {
		return children;
	}

	public void setChildren(List<FileInfo> children) {
		this.children = children;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isParent() {
		return isParent;
	}

	public void setParent(boolean isParent) {
		this.isParent = isParent;
	}

}
