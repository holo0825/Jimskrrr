package com.GroupOne.Albert.exception;
/*本範例示範自訂一個例外類別ProductNotFoundException，
 * 繼承父類別RuntimeException，對應例外頁面productNotFound.jsp
 * */

public class ProductNotFoundException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	Integer BookId;
	public ProductNotFoundException() {
	}
	
	public ProductNotFoundException(Integer bookId) {
		BookId = bookId;
	}
	
	public Integer getBookId() {
		return BookId;
	}

	public void setBookId(Integer bookId) {
		BookId = bookId;
	}


	public ProductNotFoundException(String message) {
		super(message);
	}

	public ProductNotFoundException(Throwable cause) {
		super(cause);
	}

	public ProductNotFoundException(String message, Throwable cause) {
		super(message, cause);
	}

	public ProductNotFoundException(String message, Throwable cause, boolean enableSuppression,
			boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
