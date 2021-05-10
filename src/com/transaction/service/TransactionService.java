package com.transaction.service;

import java.util.List;

import com.transaction.pojo.Transaction;

public interface TransactionService {

	 public void add(Transaction t);
	 public void update(Transaction t);

	 public List<Transaction> list();
	 
	 public Transaction get(int id);
	 
	 public void delete(int id);
	List<Transaction> listquery(String transaction, String voucher);
	
}
