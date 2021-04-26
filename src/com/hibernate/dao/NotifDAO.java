package com.hibernate.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.Notification;

public class NotifDAO {
	public void saveNotif(Notification notification) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			session.save(notification);

			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Notification> showMyNotif(int id) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		List<Notification> notification = null;
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			notification = session.createQuery("FROM notifications where idP=" + id + " ORDER BY time DESC").list();

			// commit transaction
			transaction.commit();

			return notification;
		} finally {
			session.close();
		}
	}
}
