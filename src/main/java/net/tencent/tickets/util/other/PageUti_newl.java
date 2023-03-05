package net.tencent.tickets.util.other;

import java.util.List;

/**
 * 分页工具类
 */
public class PageUti_newl {

	//数据结果集
	private List data;
	
	//总行数
	private int rowCount;
	
	//每页显示条数
	private int pageSize = 5;
	
	//总页数
	private int pageCount;
	
	//当前页码
	private int pageNum;
	
	//开始下标
	private int beginIndex;
	
	//结束下标
	private int endIndex;
	
	public PageUti_newl(int rowCount)
	{
		//总行数
		this.rowCount = rowCount;
		
		//总行数，每页显示条数 -> 总页数   10/5=2  11/5=2+1
		if(this.rowCount % this.pageSize == 0)
		{
			this.pageCount = this.rowCount / this.pageSize;
		}
		else
		{
			this.pageCount = this.rowCount / this.pageSize + 1;
		}
		
		//默认显示第一页
		this.pageNum = 1;
		
		//当前页码，每页显示条数 -> 开始下标与结束下标   
		this.setPageNum(pageNum);
	}
	
	public PageUti_newl(List data)
	{
		//结果集
		this.data = data;
		
		//结果集 -> 总行数
		this.rowCount = data.size();
		
		//总行数，每页显示条数 -> 总页数   10/5=2  11/5=2+1
		if(this.rowCount % this.pageSize == 0)
		{
			this.pageCount = this.rowCount / this.pageSize;
		}
		else
		{
			this.pageCount = this.rowCount / this.pageSize + 1;
		}
		
		//默认显示第一页
		this.pageNum = 1;
		
		//当前页码，每页显示条数 -> 开始下标与结束下标   
		this.setPageNum(pageNum);
	}

	public List getData() {
		return data;
	}

	public void setData(List data) {
		this.data = data;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		//1  1-5  
		//2  6-10
		//3  11-15
		//开始下标
		this.beginIndex = (this.pageNum-1) * this.pageSize + 1;
		
		//结束下标
		this.endIndex = this.pageNum * this.pageSize;
		//当结束下标 > 总行数，默认取总行数
		if(this.endIndex > this.rowCount)
		{
			this.endIndex = this.rowCount;	
		}
	}

	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	@Override
	public String toString() {
		return "PageUtil [rowCount=" + rowCount + ", pageSize=" + pageSize + ", pageCount="
				+ pageCount + ", pageNum=" + pageNum + ", beginIndex=" + beginIndex + ", endIndex=" + endIndex + "]";
	}
}
