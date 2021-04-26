package com.hibernate.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.hibernate.util.HibernateUtil;
import com.projet.beans.Reservation;

public class ReservationDAO {
	@SuppressWarnings("unchecked")
	public List<Reservation> showALL() {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Reservation> showMine(int id) {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where idPersonne=" + id).list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}
	
	public Reservation showById(int id) {
		Transaction transaction = null;
		Reservation reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = (Reservation) session.createQuery("FROM reservation where id=" + id).uniqueResult();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> showMineRefused(int id) {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where idPersonne=" + id + " and etat=-1").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Reservation> showMineTraited(int id) {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where idPersonne=" + id + " and etat=1").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}
	@SuppressWarnings("unchecked")
	public List<Reservation> showMineNotTraited(int id) {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where idPersonne=" + id + " and etat=0").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Reservation> showNotTraited() {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where etat=0").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> showTraited() {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where etat=1").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Reservation> showRefused() {
		Transaction transaction = null;
		List<Reservation> reservation = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			reservation = session.createQuery("FROM reservation where etat=-1").list();

			// commit transaction
			transaction.commit();

			return reservation;

		} finally {
			session.close();
		}
	}

	public void saveReservation(Reservation reservation) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			session.save(reservation);

			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}

	public void validerReservation(int reservation) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			session.createQuery("update reservation set etat = 1 where id=" + reservation).executeUpdate();

			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}
	
	public void refuserReservation(int reservation) {
		Transaction transaction = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object

			session.createQuery("update reservation set etat = -1 where id=" + reservation).executeUpdate();

			// commit transaction
			transaction.commit();
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("unchecked")
	public List<Reservation> isExist(Reservation reservation) {
		Transaction transaction = null;
		List<Reservation> list = null;
		Session session = HibernateUtil.getSessionFactory().openSession();
		try {
			// start a transaction
			transaction = session.beginTransaction();
			// save the student object
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = null;
			try {
				date = sdf.parse(reservation.getDate());
			} catch (ParseException e) {
				e.printStackTrace();
			}

			SimpleDateFormat timing = new SimpleDateFormat("HH:mm:ss");
			Date hd = null;
			try {
				hd = timing.parse(reservation.getHeureDebut());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			Date hf = null;
			try {
				hf = timing.parse(reservation.getHeureFin());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			int salle = reservation.getSalle().getId();

			list = session.createSQLQuery(
					"SELECT * FROM(SELECT IF(((heureDebut<= :hd AND heureFin>= :hd) OR (heureDebut>= :hd AND heureDebut<= :hf)) AND idSalle= :salle AND date= :date,'yes','no') as status FROM reservation) as T where status='yes'")
					.setParameter("hd", hd).setParameter("hf", hf).setParameter("salle", salle)
					.setParameter("date", date).list();
			transaction.commit();
			return list;
		} finally {
			session.close();
		}
	}
}
