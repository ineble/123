package com.koreait.hotelfive.common;

public class PageMaker3 {
	
	public static String getPageView(String path, int page, int recordPerPage, int totalRecord, String query, String column) {
		
		StringBuffer sb = new StringBuffer();
		
		int totalPage = 0;
		int pagePerBlock = 5;
		int beginPageOfBlock = 0;
		int endPageOfBlock = 0;
		
		totalPage = (int)(totalRecord / recordPerPage);
		if ( totalRecord % recordPerPage != 0 ) {
			totalPage++;
		}
		
		if ( page > totalPage ) {
			totalPage = page;
		}
		
		beginPageOfBlock = (int)(((page - 1) / pagePerBlock) * pagePerBlock) + 1;
		endPageOfBlock = beginPageOfBlock + pagePerBlock - 1;
		
		if ( endPageOfBlock > totalPage ) {
			endPageOfBlock = totalPage;
		}
		
		// 이전 버튼 표시
		if ( beginPageOfBlock < pagePerBlock ) {
			sb.append("<span style='color: lightgray;'>◀</span>&nbsp;&nbsp;");
		} else {
			sb.append("<a href='" + path + "?page=" + (beginPageOfBlock - 1) + "&query=" + query + "&column=" + column + "'>◀</a>&nbsp;&nbsp;");
		}
		
		// 페이지 번호 표시
		for ( int p = beginPageOfBlock; p <= endPageOfBlock; p++ ) {
			if ( p == page ) {
				sb.append("<span style='color: lightgray;'>" + p + "</span>&nbsp;&nbsp;");
			} else {
				sb.append("<a href='" + path + "?page=" + p + "&query=" + query + "&column=" + column + "'>" + p + "</a>&nbsp;&nbsp;");
			}
		}
		
		// 다음 버튼 표시
		if ( endPageOfBlock == totalPage ) {
			sb.append("<span style='color: lightgray;'>▶</span>");
		} else {
			sb.append("<a href='" + path + "?page=" + (endPageOfBlock + 1) + "&query=" + query + "&column=" + column + "'>▶</a>");
		}
		
		return sb.toString();
		
	}

}
