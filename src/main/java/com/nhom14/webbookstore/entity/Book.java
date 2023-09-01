package com.nhom14.webbookstore.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "book")
public class Book {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "name", columnDefinition = "varchar(255) NOT NULL")
	private String name;
	@Column(name = "author", columnDefinition = "varchar(255) NOT NULL")
	private String author;
	@Column(name = "price", columnDefinition = "double NOT NULL")
	private double price;

	//bi-directional many-to-one association with Category
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;

	@Column(name = "img", columnDefinition = "char(255)")
	private String img;
	@Column(name = "publisher", columnDefinition = "varchar(255) NOT NULL")
	private String publisher;
	@Column(name = "description", columnDefinition = "text")
	private String description; // mô tả sơ lược
	@Column(name = "status", columnDefinition = "INT NOT NULL")
	private int status; //hoạt động:1, ngừng kd:0
	@Column(name = "detail", columnDefinition = "text")
	private String detail; // chi tiết nội dung 
	@Column(name = "quantity", columnDefinition = "INT NOT NULL")
	private int quantity;

	//bi-directional one-to-many association to OrderItem
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "book")
	private List<OrderItem> orderitems;

	//bi-directional one-to-many association with CartItem
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "book")
	private List<CartItem> cartitems;

    public Book() {
    }
    

	public Book(String name, String author, double price, Category category, String img, String publisher, String description, int status,
			String detail, int quantity, List<OrderItem> orderitems, List<CartItem> cartitems) {
		super();
		this.name = name;
		this.author = author;
		this.price = price;
		this.category = category;
		this.img = img;
		this.publisher = publisher;
		this.description = description;
		this.status = status;
		this.detail = detail;
		this.quantity = quantity;
		this.orderitems = orderitems;
		this.cartitems = cartitems;
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

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}
	

	public String getPublisher() {
		return publisher;
	}


	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public List<OrderItem> getOrderitems() {
		return orderitems;
	}

	public void setOrderitems(List<OrderItem> orderitems) {
		this.orderitems = orderitems;
	}

	public List<CartItem> getCartitems() {
		return cartitems;
	}

	public void setCartitems(List<CartItem> cartitems) {
		this.cartitems = cartitems;
	}

    
}