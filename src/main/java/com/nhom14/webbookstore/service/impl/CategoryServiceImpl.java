package com.nhom14.webbookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Category;
import com.nhom14.webbookstore.repository.CategoryRepository;
import com.nhom14.webbookstore.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	private CategoryRepository categoryRepository;
	
	@Autowired
	public CategoryServiceImpl(CategoryRepository categoryRepository) {
		super();
		this.categoryRepository = categoryRepository;
	}


	@Override
	public List<Category> getActiveCategories() {
		return categoryRepository.findByStatus(1);
	}

}
