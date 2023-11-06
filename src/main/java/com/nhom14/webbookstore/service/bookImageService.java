package com.nhom14.webbookstore.service;

import java.util.List;

import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.BookImage;

public interface bookImageService {

	List<BookImage> getByBook(Book book);

}
