package com.nhom14.webbookstore.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.Category;
import com.nhom14.webbookstore.repository.BookRepository;
import com.nhom14.webbookstore.repository.CategoryRepository;
import com.nhom14.webbookstore.service.BookService;

@Service
public class BookServiceImpl implements BookService {

	private BookRepository bookRepository;
	private CategoryRepository categoryRepository;
	
	@Autowired
	public BookServiceImpl(BookRepository bookRepository, CategoryRepository categoryRepository) {
		super();
		this.bookRepository = bookRepository;
		this.categoryRepository = categoryRepository;
	}

	@Override
	public List<Book> getActiveBooks() {
		return bookRepository.findByStatus(1);
	}

	@Override
	public List<Book> getActiveBooksByCategory(int categoryId) {
		Category category = categoryRepository.findById(categoryId).orElse(null);
	    if (category != null) {
	        return bookRepository.findByCategoryAndStatus(category, 1);
	    }
	    return Collections.emptyList();
	}

	@Override
	public List<Book> searchBooksByKeyword(List<Book> books, String searchKeyword) {
	    List<Book> result = new ArrayList<>();
	    Set<Integer> addedBookIds = new HashSet<>();
	    String lowercaseKeyword = searchKeyword.toLowerCase();
	    
	    for (Book book : books) {
	        Category category = book.getCategory();
	        if (containsIgnoreCase(book.getAuthor(), lowercaseKeyword)
	                || containsIgnoreCase(book.getName(), lowercaseKeyword)
	                || containsIgnoreCase(book.getDescription(), lowercaseKeyword)
	                || containsIgnoreCase(book.getPublisher(), lowercaseKeyword)
	                || (category != null && containsIgnoreCase(category.getName(), lowercaseKeyword))) {
	            if (!addedBookIds.contains(book.getId())) {
	                result.add(book);
	                addedBookIds.add(book.getId());
	            }
	        }
	    }
	    
	    return result;
	}

	// Kiểm tra xem một chuỗi có chứa một chuỗi con cụ thể hay không, 
	// mà không phân biệt chữ hoa chữ thường trong quá trình so sánh
	private boolean containsIgnoreCase(String text, String keyword) {
	    return text.toLowerCase().contains(keyword);
	}

	@Override
	public Book getActiveBookById(int id) {
		try {
	        return bookRepository.findByIdAndStatus(id, 1);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return null; // Trả về null nếu không tìm thấy cuốn sách
	}

	@Override
	public Book getBookById(int id) {
		Optional<Book> book = bookRepository.findById(id);
	    return book.orElse(null);
	}

	@Override
	public void updateBook(Book book) {
		bookRepository.save(book);
		
	}

	@Override
	public List<Book> getAllBooks() {
		return bookRepository.findAll(); // Nếu không có sách sẽ trả về empty list
	}

	@Override
	public List<Book> getBooksByCategory(Integer categoryId) {
		Category category = categoryRepository.findById(categoryId).orElse(null);
	    if (category != null) {
	        return bookRepository.findByCategory(category);
	    }
	    return Collections.emptyList();
	}

	@Override
	public void addBook(Book newBook) {
		bookRepository.save(newBook);
	}

	@Override
	public Book getLastBook() {
		return bookRepository.findFirstByOrderByIdDesc();// trả null nếu không tìm thấy
	}
}
