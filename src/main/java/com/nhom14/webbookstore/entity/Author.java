package com.nhom14.webbookstore.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "author")
public class Author {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "name", columnDefinition = "varchar(255) NOT NULL")
	private String name;
	@Column(name = "bio", columnDefinition = "varchar(255)")
	private String bio;
	
	//bi-directional one-to-many association to BookAuthor
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "author")
	private List<BookAuthor> bookAuthors;

	public Author() {
	}

	public Author(int id, String name, String bio, List<BookAuthor> bookAuthors) {
		super();
		this.id = id;
		this.name = name;
		this.bio = bio;
		this.bookAuthors = bookAuthors;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public List<BookAuthor> getBookAuthors() {
		return bookAuthors;
	}

	public void setBookAuthors(List<BookAuthor> bookAuthors) {
		this.bookAuthors = bookAuthors;
	}

	
}
