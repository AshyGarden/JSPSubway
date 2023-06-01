package com.spring.JspSubway.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageVO {
	
	private int pageNum; //페이지 번호
	private int cpp; // 한화면에 보여질 게시물 개수
	
	public PageVO() { //초기값 셋팅
		this.pageNum = 1;
		this.cpp = 10;
	}
	
	
}
