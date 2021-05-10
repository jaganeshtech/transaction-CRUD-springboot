package com.transaction.dao;

import java.util.List;

import com.transaction.pojo.Transaction;

public interface TransactionDao {

	 public void add(Transaction t);

	 public List<Transaction> list();
	 
	 public Transaction get(int id);
	 
	 public void delete(int id);
	 public void update(Transaction t);

	List<Transaction> listquery(String transaction, String voucher);
	
}
