package com.spring.JspSubway.util;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;

@Getter
@Setter
@ToString
@Slf4j
public class PageCreator {

	private PageVO paging;
	private int articleTotalCount, endPage, beginPage; //게시물 총개수, 마지막페이지, 시작페이지
	private boolean prev, next;
	
	private final int buttonNum = 5; // 버튼개수
	
	public PageCreator(PageVO paging, int articleTotalCount) {
		this.paging = paging;
		this.articleTotalCount = articleTotalCount;
		calcDataOfPage();
	}
	
	private void calcDataOfPage() {
		
		endPage = (int) (Math.ceil(paging.getPageNum() / (double) buttonNum) * buttonNum);  //getPageNum:7, 7/5(올림=2)*5= 10(=endpage)
		
		beginPage = endPage - buttonNum + 1; // 시작페이지 = 끝페이지 - 버튼개수(5) + 1
	
		prev = (beginPage == 1) ? false : true; //시작페이지가 1이면 false, 아니면 true
		
		next = articleTotalCount <= (endPage * paging.getCpp()) ? false : true; //총 게시물수 <= 끝페이지 * cpp(10) 면 false
		if(!next) { 
			endPage = (int) Math.ceil(articleTotalCount / (double) paging.getCpp());   //  총게시물수 / cpp(10)
		}
	}
}