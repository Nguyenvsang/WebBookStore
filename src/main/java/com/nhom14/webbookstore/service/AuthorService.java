package com.nhom14.webbookstore.service;

import java.util.List;

import com.nhom14.webbookstore.entity.Author;

public interface AuthorService {

	// Lấy danh sách tất cả tác giả
	List<Author> getAllAuthors();

	// Lấy tác giả theo mã
	Author getAuthorById(int id);

}
