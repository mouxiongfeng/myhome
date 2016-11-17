package com.mxf.cuit.page;

public class PageCountToToatal {

	public static int getTotalPage(int pageCount,int pageSize){
		int countindex = pageCount % pageSize > 0 ? (pageCount / pageSize) + 1 : (pageCount / pageSize);
		return countindex;
	}
}
