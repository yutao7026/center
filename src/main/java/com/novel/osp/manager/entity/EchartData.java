package com.novel.osp.manager.entity;

import java.util.ArrayList;
import java.util.List;

public class EchartData {
	public List<String> legend = new ArrayList<String>();
	public List<String> category = new ArrayList<String>();
	public List<Series> series = new ArrayList<Series>();

	public EchartData(List<String> legendList, List<String> categoryList, List<Series> seriesList) {
		this.legend = legendList;
		this.category = categoryList;
		this.series = seriesList;
	}
 
	public List<String> getLegend() {
		return legend;
	} 

	public void setLegend(List<String> legend) {
		this.legend = legend;
	}

	public List<String> getCategory() {
		return category;
	}

	public void setCategory(List<String> category) {
		this.category = category;
	}

	public List<Series> getSeries() {
		return series;
	}

	public void setSeries(List<Series> series) {
		this.series = series;
	}

}