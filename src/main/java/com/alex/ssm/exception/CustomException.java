package com.alex.ssm.exception;

public class CustomException extends Exception {
    private static final long serialVersionUID = 1L;
    public String message;		  //错误信息
    public Throwable throwable;	  //Java中所有异常和错误的基类
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public Throwable getThrowable() {
        return throwable;
    }
    public void setThrowable(Throwable throwable) {
        this.throwable = throwable;
    }
    public CustomException(String message) {
        super();
        this.message = message;
    }
    public CustomException(Throwable throwable) {
        super();
        this.throwable = throwable;
    }
}
