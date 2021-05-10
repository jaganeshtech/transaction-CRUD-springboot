package com.transaction.config;

import org.springframework.beans.factory.annotation.Autowired;

import com.transaction.dao.TransactionDao;

public class Maintest {

	@Autowired
	private TransactionDao tdao;
	
	
	
	public static void main(String[] args) {
	
		Maintest mt=new Maintest();
		mt.tdao.get(47);
	}
}
