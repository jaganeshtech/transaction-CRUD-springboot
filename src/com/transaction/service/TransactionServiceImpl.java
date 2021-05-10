package com.transaction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.transaction.dao.TransactionDao;
import com.transaction.pojo.Transaction;

@Service
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionDao transactionDao;

	@Override
	public void add(Transaction t) {
		transactionDao.add(t);
	}

	@Override
	public List<Transaction> list() {
		return transactionDao.list();
	}

	@Override
	public Transaction get(int id) {
		// TODO Auto-generated method stub
		return transactionDao.get(id);
	}

	@Override
	public void delete(int id) {
		transactionDao.delete(id);
	}

	@Override
	public void update(Transaction t) {
		transactionDao.update(t);
	}

	@Override
	public List<Transaction> listquery(String transaction, String voucher) {

		return transactionDao.listquery(transaction, voucher);
	}

}
