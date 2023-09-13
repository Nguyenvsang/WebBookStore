package com.nhom14.webbookstore.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.entity.Order;
import com.nhom14.webbookstore.repository.OrderRepository;
import com.nhom14.webbookstore.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	private OrderRepository orderRepository;

	@Autowired
	public OrderServiceImpl(OrderRepository orderRepository) {
		super();
		this.orderRepository = orderRepository;
	}

	@Override
	public void addOrder(Order order) {
		orderRepository.save(order);
	}

	@Override
	public Order getLastOrder(Account account) {
		return orderRepository.findFirstByAccountOrderByIdDesc(account);
	}

	@Override
	public List<Order> getOrdersByAccount(Account account) {
		return orderRepository.findByAccount(account);
	}

	@Override
	public Order getOrderById(int orderId) {
		Optional<Order> order = orderRepository.findById(orderId);
	    return order.orElse(null);
	}
	
	
}
