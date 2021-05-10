package com.transaction.pojo;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
@Entity
@Table(name = "Transactionitem") // child table
public class TransactionItem implements Serializable {
    private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;
	@Column(name = "branch")
	private String branch;
	@Column(name = "groupName")
	private String group;
	@Column(name = "ledger")
	private String ledger;
	@Column(name = "type")
	private String type;

//	@ManyToOne(cascade = CascadeType.REMOVE)
//    @JoinColumn(name = "post_id", nullable = false)
//    @OnDelete(action = OnDeleteAction.CASCADE)
//	private Transaction transaction;
	
	public TransactionItem() {
	}

	public TransactionItem(String branch, String group, String ledger, String type) {
		this.branch = branch;
		this.group = group;
		this.ledger = ledger;
		this.type = type;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getLedger() {
		return ledger;
	}

	public void setLedger(String ledger) {
		this.ledger = ledger;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

//	public Transaction getTransaction() {
//		return transaction;
//	}
//
//	public void setTransaction(Transaction transaction) {
//		this.transaction = transaction;
//	}

	public void setId(Long id) {
		this.id = id;
	}

	
	
	
	

}
