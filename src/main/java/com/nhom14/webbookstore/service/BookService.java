package com.nhom14.webbookstore.service;

import java.util.List;

import com.nhom14.webbookstore.entity.Book;

public interface BookService {

	// Phương thức lấy sách theo Id
	Book getBookById(int id);
		
	// Phương thức để lấy danh sách tất cả các quyển sách còn kinh doanh
	List<Book> getActiveBooks();

	// Phương thức để lấy danh sách tất cả các quyển sách còn kinh doanh theo danh mục
	List<Book> getActiveBooksByCategory(int categoryId);

	// Phương thức tìm kiếm sách dựa trên từ khóa
	List<Book> searchBooksByKeyword(List<Book> books, String searchKeyword);

	// Phương thức lấy sách còn kinh doanh theo Id
	Book getActiveBookById(int id);

}
