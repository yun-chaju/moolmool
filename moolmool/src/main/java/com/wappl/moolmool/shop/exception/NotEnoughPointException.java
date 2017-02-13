package com.wappl.moolmool.shop.exception;

import com.wappl.moolmool.common.exception.JavascriptAlertException;

@SuppressWarnings("serial")
public class NotEnoughPointException extends JavascriptAlertException{

	public NotEnoughPointException(){}
	
	public NotEnoughPointException(String message){
		super(message);
	}
}
