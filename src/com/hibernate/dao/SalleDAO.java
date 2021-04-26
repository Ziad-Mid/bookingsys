package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.Salle;

public class SalleDAO {
	@SuppressWarnings("unchecked")
	public List<Salle> showSalleByPavillon(int id) {
		Transaction transaction = null;
		List<Salle> salleList = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();

			salleList = (List<Salle>) session.createQuery("FROM salle where idPavillon="+id).getResultList();
			// commit transaction
			transaction.commit();

			return salleList;

		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Salle> displaySalle(int pavillon) {
		Transaction transaction = null;
		List<Salle> salle = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			salle = session.createQuery("FROM salle where idPavillon=" + pavillon).getResultList();
			// commit transaction
			transaction.commit();

			return salle;
		} finally {
			session.close();

		}
	}

	@SuppressWarnings("unchecked")
	public List<Salle> displayAll() {
		Transaction transaction = null;
		List<Salle> salle = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			salle = session.createQuery("FROM salle").list();
			// commit transaction
			transaction.commit();

			return salle;
		} finally {
			session.close();

		}
	}

	public Salle showSalle(String salle) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			Salle sal = (Salle) session.createQuery("FROM salle s WHERE s.nom = :nom").setParameter("nom", salle).uniqueResult();
			// commit transaction
			transaction.commit();

			return sal;
		} finally {
			session.close();

		}
	}
}
