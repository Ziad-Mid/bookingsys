package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.Contact;

public class ContactDAO {
	public void saveContact(Contact contact) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(contact);
			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Contact> showMessage() {
		Transaction transaction = null;
		List<Contact> contact = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			contact = (List<Contact>) session.createQuery("FROM contact ORDER BY time DESC").getResultList();
			// commit transaction
			transaction.commit();

			return contact;
		} finally {
			session.close();
		}
	}
}
