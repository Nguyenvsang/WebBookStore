package com.nhom14.webbookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.BookImage;
import com.nhom14.webbookstore.repository.BookImageRepository;
import com.nhom14.webbookstore.service.bookImageService;

@Service
public class bookImageServiceImpl implements bookImageService {

	private BookImageRepository bookImageRepository;

	@Autowired
	public bookImageServiceImpl(BookImageRepository bookImageRepository) {
		super();
		this.bookImageRepository = bookImageRepository;
	}

	@Override
	public List<BookImage> getByBook(Book book) {
		return bookImageRepository.findByBook(book);
	}
	
	
}
