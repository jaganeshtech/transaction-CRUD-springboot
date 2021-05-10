package com.transaction.dao;

import java.util.List;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.transaction.pojo.Transaction;
@Repository
@Transactional
public class TransactionDaoImpl implements TransactionDao {

	
@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}

	
	
	@Override
	public void add(Transaction t) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(t);	
		
	}

	@Override
	public List<Transaction> list() {
		Session session = sessionFactory.getCurrentSession();
        List<Transaction> list = session.createQuery("from Transaction").list();
        return list;
	}

	@Override
	public Transaction get(int id) {
		 Session session = sessionFactory.getCurrentSession();      
		 Transaction trans = (Transaction) session.get(Transaction.class, new Long(id));
	        return trans;
	}

	@Override
	public void delete(int id) {
		Session session = sessionFactory.getCurrentSession();
		Transaction trans= (Transaction) session.get(Transaction.class, new Long(id));
        if(null != trans){
            session.delete(trans);
        }		
	}



	@Override
	public void update(Transaction t) {
		Session session = sessionFactory.getCurrentSession();

        session.update(t);

        }
	
	

	@Override
	public List<Transaction> listquery(String transaction,String voucher) { // for search
		Session session = sessionFactory.getCurrentSession();
		
		String hql = "from Transaction t where t.transactionType=:transaction and t.voucherType=:voucher";
	Query query = session.createQuery(hql);
	query.setParameter("transaction", transaction);
	query.setParameter("voucher", voucher);
		
		
        List<Transaction> list = query.list();
        return list;
	}

	
	
}
