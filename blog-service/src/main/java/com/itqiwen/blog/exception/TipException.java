package com.itqiwen.blog.exception;

/**
 * @author liqiwen
 */
public class TipException extends Exception{
    public TipException() {
    }

    public TipException(String message) {
        super(message);
    }

    public TipException(String message, Throwable cause) {
        super(message, cause);
    }

    public TipException(Throwable cause) {
        super(cause);
    }

}
