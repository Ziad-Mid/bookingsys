package com.hibernate.dao;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.Personne;

public class PersonneDAO {
	public void savePersonne(Personne personne) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.save(personne);
			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}

	public Personne showPersonne(String email) {
		Transaction transaction = null;
		Personne personne = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			personne = (Personne) session.createQuery("FROM personne p WHERE p.email = :email").setParameter("email", email).uniqueResult();
			// commit transaction
			transaction.commit();
			
			return personne;
		} finally {
			session.close();
		}
	}

	public String validate(String email, String password) {

		Transaction transaction = null;
		Personne personne = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// get an user object
			personne = (Personne) session.createQuery("FROM personne p WHERE p.email = :email")
					.setParameter("email", email).uniqueResult();

			if (personne == null )
			{
				return "Vous n'etes pas inscrits";
			}
			else if(!personne.getPassword().equals(password)) {
				return "Mot de passe incorrecte";
			}
			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
		return "";
	}
	public void deletePersonne(Personne personne) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.delete(personne);
			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}
	public void updatePersonne(String email,Personne personne) {
		
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			session.createQuery("update personne set nomComplet ='"+ personne.getNomComplet() +"', password ='"+personne.getPassword()+"' WHERE email = '"+email+"'").executeUpdate();
			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Personne> showAll() {
		Transaction transaction = null;
		List<Personne> personne = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			personne = (List<Personne>) session.createQuery("FROM personne").getResultList();
			// commit transaction
			transaction.commit();
			
			return personne;
		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Personne> showAdmins() {
		Transaction transaction = null;
		List<Personne> personne = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			personne = (List<Personne>) session.createQuery("FROM personne p WHERE p.type = :type").setParameter("type", "Admin").getResultList();
			// commit transaction
			transaction.commit();
			
			return personne;
		} finally {
			session.close();
		}
	}
}
