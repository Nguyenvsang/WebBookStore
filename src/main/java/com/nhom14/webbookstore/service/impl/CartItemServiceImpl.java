package com.nhom14.webbookstore.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Book;
import com.nhom14.webbookstore.entity.Cart;
import com.nhom14.webbookstore.entity.CartItem;
import com.nhom14.webbookstore.repository.CartItemRepository;
import com.nhom14.webbookstore.service.CartItemService;

@Service
public class CartItemServiceImpl implements CartItemService {

	private CartItemRepository cartItemRepository;

	@Autowired
	public CartItemServiceImpl(CartItemRepository cartItemRepository) {
		super();
		this.cartItemRepository = cartItemRepository;
	}

	@Override
	public CartItem getCartItemByCartAndBook(Cart cart, Book book) {
		return cartItemRepository.findByCartAndBook(cart, book);
	}

	@Override
	public void addCartItem(CartItem cartItem) {
		cartItemRepository.save(cartItem);		
	}

	@Override
	public void updateCartItem(CartItem cartItem) {
		cartItemRepository.save(cartItem);
	}

	@Override
	public List<CartItem> getCartItemsByCart(Cart cart) {
		return cartItemRepository.findByCart(cart);
	}

	@Override
	public CartItem getCartItemById(int itemId) {
		return cartItemRepository.findById(itemId).get();
	}
	
	
}
