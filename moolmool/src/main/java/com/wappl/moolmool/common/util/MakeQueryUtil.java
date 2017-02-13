package com.wappl.moolmool.common.util;

import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;

@JsonAutoDetect(fieldVisibility = Visibility.ANY)
public class MakeQueryUtil {
	
	public String makeQuery(int page, String sType, String sKeyword) {
		page = page > 0 ? page : 1;
		
		UriComponentsBuilder uri = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", page);
		if(sType != null && sType.length() > 0 
				&& sKeyword != null &&sKeyword.length() > 0) {
			uri.queryParam("sType", sType)
				.queryParam("sKeyword", sKeyword);
		}
		return uri.build().toUriString();
	}
	
	//TODO 임시.. 검토 필요함
	public String makeQuery(int page, int cpage, String sType, String sKeyword) {
		page = page > 0 ? page : 1;
		cpage = cpage > 0 ? cpage : 1;
		UriComponentsBuilder uri = 
				UriComponentsBuilder.newInstance()
				.queryParam("cpage", cpage)
				.queryParam("page", page);
		if(sType != null && sType.length() > 0 
				&& sKeyword != null &&sKeyword.length() > 0) {
			uri.queryParam("sType", sType)
				.queryParam("sKeyword", sKeyword);
		}
		return uri.build().toUriString();
	}

}
