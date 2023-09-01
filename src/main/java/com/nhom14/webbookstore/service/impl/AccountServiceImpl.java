package com.nhom14.webbookstore.service.impl;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhom14.webbookstore.entity.Account;
import com.nhom14.webbookstore.repository.AccountRepository;
import com.nhom14.webbookstore.service.AccountService;

@Service
public class AccountServiceImpl implements AccountService {

	private AccountRepository accountRepository;
	
	@Autowired
	public AccountServiceImpl(AccountRepository accountRepository) {
		super();
		this.accountRepository = accountRepository;
	}

	@Override
	public boolean checkLogin(String username, String password) {
		Account account = accountRepository.findByUsernameAndAccountTypeAndStatus(username, 1, 1); // customer: 1, active: 1
	    if (account != null) {
	        String hashedPassword = account.getPassword();
	        return BCrypt.checkpw(password, hashedPassword);
	    }
	    return false;
	}

	@Override
	public Account findAccountByUsername(String username) {
		return accountRepository.findByUsername(username);
	}
	
	@Override
    public void addAccount(Account account) {
        accountRepository.save(account);
    }

}
