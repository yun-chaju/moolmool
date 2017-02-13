package com.wappl.moolmool.common.exception;

@SuppressWarnings("serial")
public class JavascriptAlertException extends RuntimeException{

	public JavascriptAlertException() {}
	
	public JavascriptAlertException(String message) {
		super(message);
	}
}
