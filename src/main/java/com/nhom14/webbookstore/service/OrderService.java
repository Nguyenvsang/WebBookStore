package com.nhom14.webbookstore.service;

import java.util.List;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.entity.Order;

public interface OrderService {

	// Phương thức để thêm một đơn hàng
	void addOrder(Order order);

	// Lấy đơn hàng cuối cùng theo account
	Order getLastOrder(Account account);

	// Phương thức lấy những đơn hàng theo mã người dùng
	List<Order> getOrdersByAccount(Account account);

	// Lấy đơn hàng theo Id
	Order getOrderById(int orderId);

}
