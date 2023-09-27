package com.nhom14.webbookstore.service;

import java.util.List;

import com.nhom14.webbookstore.entity.Category;

public interface CategoryService {

	// Phương thức lấy tất cả các danh mục còn kinh doanh 
	List<Category> getActiveCategories();
	
	// Phương thức lấy tất cả các danh mục 
	List<Category> getAllCategories();

	// Phương thức lấy danh mục theo id
	Category getCategoryById(int id);

}
