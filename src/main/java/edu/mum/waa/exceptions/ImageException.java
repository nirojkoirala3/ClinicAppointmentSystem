package edu.mum.waa.exceptions;

public class ImageException extends RuntimeException{

	private static final long serialVersionUID = 1L;
	
	String msg = "upload failed";

	public ImageException(String msg, Exception e) {
		super();
		this.msg = msg;
	}
	public String getMsg() {
		return msg;
	}
	
	
}
