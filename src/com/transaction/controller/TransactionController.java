package com.transaction.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.transaction.pojo.Transaction;
import com.transaction.pojo.TransactionItem;
import com.transaction.service.TransactionService;

@Controller
public class TransactionController {
	@Autowired
	private TransactionService service;

	private static List<String> transType;
	private static List<String> voucherType;
	static {

		transType = new ArrayList<>();// drop down values
		transType.add("Transaction1");
		transType.add("Transaction2");
		transType.add("Transaction3");

		transType.add("Transaction4");

		voucherType = new ArrayList<>();
		voucherType.add("Voucher1");
		voucherType.add("Voucher2");
		voucherType.add("Voucher4");
		voucherType.add("Voucher5");

	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute Transaction trans) {
		List<Transaction> list = null;
		if (trans.getTransactionType() == null && trans.getVoucherType() == null) {
			list = service.list();
		} else {
			list = service.listquery(trans.getTransactionType(), trans.getVoucherType());
		}
		model.addAttribute("list", list);
		System.out.println(voucherType.size());
		model.addAttribute("voc", voucherType);
		model.addAttribute("trx", transType);

		model.addAttribute("trans", new Transaction());

		return "list";

	}

	@RequestMapping(value = {"/","home"}, method = RequestMethod.GET)
	public String helloView(Map<String, Object> model) {

		List<TransactionItem> items = new ArrayList<>();
//		items.add(new TransactionItem());
		Transaction transItems = new Transaction();

//		transItems.setTransactions(items);

		model.put("trans", new Transaction());
		model.put("transType", transType);
		model.put("voucherType", voucherType);

		return "index";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String save(@ModelAttribute Transaction trans, Map<String, Object> model) {

		System.out.println(":" + trans.getTransactions().size());
		Transaction saveObj = new Transaction();
		saveObj.setTransactionType(trans.getTransactionType());
		saveObj.setVoucherType(trans.getVoucherType());
		List<TransactionItem> titems = new ArrayList<>();

		for (TransactionItem item : trans.getTransactions()) {
			if (null != item.getBranch()) {
				titems.add(item);
			}

		}
		System.out.println("Size:"+titems.size());
		saveObj.setTransactions(titems);
		service.add(saveObj);

		List<Transaction> list = service.list();
		System.out.println(list);
		model.put("list", list);

		return "redirect:/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(Map<String, Object> model, @RequestParam("id") int id) {

		service.delete(id);

		List<Transaction> list = service.list();
		System.out.println(list);
		model.put("list", list);
		return "redirect:/list";
	}

	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String edit(Map<String, Object> model, @RequestParam("id") int id) {
		Transaction ts = service.get(id);

		model.put("id", ts.getId());
		model.put("trx", transType);
		model.put("voc", voucherType);

		model.put("trans", ts);

		return "edit";
	}

	

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute Transaction trans, Map<String, Object> model) {


		System.out.println(":" + trans.getTransactions().size());
		Transaction saveObj = new Transaction();
		saveObj.setId(trans.getId());
		saveObj.setTransactionType(trans.getTransactionType());
		saveObj.setVoucherType(trans.getVoucherType());
		List<TransactionItem> titems = new ArrayList<>();

		for (TransactionItem item : trans.getTransactions()) {
			if (null != item.getBranch()) {
				titems.add(item);
			}

		}
		System.out.println("Size:"+titems.size());
		saveObj.setTransactions(titems);
		service.update(saveObj);

		List<Transaction> list = service.list();
		model.put("list", list);

		return "redirect:/list";
	}

	

}
