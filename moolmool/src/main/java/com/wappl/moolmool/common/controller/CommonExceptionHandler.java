package com.wappl.moolmool.common.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import com.wappl.moolmool.common.exception.JavascriptAlertException;

@ControllerAdvice
public class CommonExceptionHandler {
	
    @ExceptionHandler(JavascriptAlertException.class)
    public ResponseEntity<String> messageExceptionHandler(Exception e) {  
    	HttpHeaders responseHeaders = new HttpHeaders();
    	responseHeaders.add("Content-Type", "text/html; charset=UTF-8");
    	return new ResponseEntity<String>("<script>alert('"+ e.getMessage() +"');"
    			+ "history.back();</script>", responseHeaders, HttpStatus.OK); 
    	// HttpStatus는 추후 변경
    }

}
