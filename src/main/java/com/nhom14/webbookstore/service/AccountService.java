package com.nhom14.webbookstore.service;

import com.nhom14.webbookstore.entity.Account;

public interface AccountService {
	// Phương thức để kiểm tra đăng nhập của một tài khoản
	boolean checkLogin(String username, String password);
	
	// Phương thức để tìm kiếm một tài khoản theo username
	Account findAccountByUsername(String username);
	
	// Phương thức để thêm một tài khoản mới
    void addAccount(Account account);

    // Phương thức để cập nhật thông tin của một tài khoản
	void updateAccount(Account account);

	// Phương thức để kiểm tra đăng nhập của một tài khoản admin 
	boolean checkLoginAdmin(String username, String password);
}
