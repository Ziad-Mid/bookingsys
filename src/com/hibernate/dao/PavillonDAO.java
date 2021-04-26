package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.pavillonSalle;

public class PavillonDAO {
	@SuppressWarnings("unchecked")
	public List<pavillonSalle> displayPavillon() {
		Transaction transaction = null;
		List<pavillonSalle> pavillon = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			pavillon = session.createQuery("FROM pavillonsalle").getResultList();
			// commit transaction
			transaction.commit();
			
			return pavillon;
		} finally {
			session.close();
		}
	}
}
