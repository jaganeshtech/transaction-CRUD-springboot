package com.transaction.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Transaction") // parent table
public class Transaction implements Serializable {
    private static final long serialVersionUID = 2L;

	public Transaction() {
	}

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	@Column(name = "transactiontype")
	private String transactionType;
	@Column(name = "vouchertype")
	private String voucherType;

//	@OneToMany(targetEntity = TransactionItem.class, fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER,orphanRemoval = true)
	@JoinColumn(name = "ts_id",referencedColumnName ="id")
	private List<TransactionItem> transactions=new ArrayList<>();

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}

	public String getVoucherType() {
		return voucherType;
	}

	public void setVoucherType(String voucherType) {
		this.voucherType = voucherType;
	}

	public List<TransactionItem> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<TransactionItem> transactions) {
		this.transactions = transactions;
	}

}
