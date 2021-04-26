package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.typeSalle;

public class TypeDAO {
	@SuppressWarnings("unchecked")
	public List<typeSalle> displayType(){
		Transaction transaction = null;
		List<typeSalle> type = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			type = session.createQuery("FROM typeSalle").list();
			// commit transaction
			transaction.commit();
			
			return type;
		} finally {
			session.close();
		}
	}
}
