package com.nhom14.webbookstore.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Author;
import com.nhom14.webbookstore.repository.AuthorRepository;
import com.nhom14.webbookstore.service.AuthorService;

@Service
public class AuthorServiceImpl implements AuthorService {

	private AuthorRepository authorRepository;

	@Autowired
	public AuthorServiceImpl(AuthorRepository authorRepository) {
		super();
		this.authorRepository = authorRepository;
	}

	@Override
	public List<Author> getAllAuthors() {
		return authorRepository.findAll();
	}

	@Override
	public Author getAuthorById(int id) {
		Optional<Author> author = authorRepository.findById(id);
	    return author.orElse(null);
	}
	
	
}
