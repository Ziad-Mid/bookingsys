package com.services;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hibernate.dao.ReservationDAO;
import com.hibernate.dao.SalleDAO;
import com.projet.beans.Personne;
import com.projet.beans.Reservation;
import com.projet.beans.Salle;

public class NewReservationService {
	private static final String CHAMP_PAVILLON = "pavillon";
	private static final String CHAMP_DATE_RESERVATION = "dr";
	private static final String CHAMP_HEURE_DEBUT = "hd";
	private static final String CHAMP_HEURE_FIN = "hf";
	private static final String CHAMP_HEURE = "heure";
	private static final String CHAMP_PAVILLON_H = "Pavillon H";
	private static final String CHAMP_PAVILLON_F = "Pavillon F";
	private static final String CHAMP_PAVILLON_K = "Pavillon K";
	private static final String CHAMP_ESPACE = "Espace Amphis";
	private static final String CHAMP_MOTIF = "motif";

	private Map<String, String> erreurs = new HashMap<>();
	private String resultat;

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getResultat() {
		return resultat;
	}

	public Reservation creerReservation(HttpServletRequest request) {

		String pavillon = request.getParameter(CHAMP_PAVILLON);
		String CHAMP_SALLE = "salle1";
		
		if (pavillon.equals(CHAMP_PAVILLON_H)) {
			CHAMP_SALLE = "salle1";
		} else if (pavillon.equals(CHAMP_PAVILLON_F)) {
			CHAMP_SALLE = "salle2";
		} else if (pavillon.equals(CHAMP_PAVILLON_K)) {
			CHAMP_SALLE = "salle3";
		} else if (pavillon.equals(CHAMP_ESPACE)) {
			CHAMP_SALLE = "salle4";
		}
		
		String salle = request.getParameter(CHAMP_SALLE);
		String date = request.getParameter(CHAMP_DATE_RESERVATION);
		String h_debut = request.getParameter(CHAMP_HEURE_DEBUT);
		String h_fin = request.getParameter(CHAMP_HEURE_FIN);
		String motif = request.getParameter(CHAMP_MOTIF);

		Reservation reservation = new Reservation();

		SalleDAO dao_ = new SalleDAO();
		Salle mySalle = dao_.showSalle(salle);
		reservation.setSalle(mySalle);

		try {
			valdDate(date);
		} catch (Exception e) {
			setErreur(CHAMP_DATE_RESERVATION, e.getMessage());
		}
		reservation.setDate(date);

		try {
			vald_h_d(h_debut);
		} catch (Exception e) {
			setErreur(CHAMP_HEURE_DEBUT, e.getMessage());
		}
		reservation.setHeureDebut(h_debut);

		try {
			valdMotif(motif);
		} catch (Exception e) {
			setErreur(CHAMP_MOTIF, e.getMessage());
		}
		reservation.setMotif(motif);

		try {
			vald_h_f(h_fin);
		} catch (Exception e) {
			setErreur(CHAMP_HEURE_FIN, e.getMessage());
		}
		reservation.setHeureFin(h_fin);

		try {
			vald_h(h_debut, h_fin);
		} catch (Exception e) {
			setErreur(CHAMP_HEURE, e.getMessage());
		}

		ReservationDAO reseDAO = new ReservationDAO();

		if (erreurs.isEmpty()) {

			HttpSession session = request.getSession();

			Personne personne = (Personne) session.getAttribute("personne");

			reservation.setPersonne(personne);

			if (reseDAO.isExist(reservation).size() == 0) {
				reseDAO.saveReservation(reservation);
				setErreur("statut", "Votre réservation a été enregistrée avec succés.");
			}
			else {
				setErreur("statut", "Votre réservation n'a pas été enregistrée car une autre réservation a été mise en meme date.");
			}
			
			

		}

		return reservation;
	}

	private void valdDate(String date) throws Exception {
		if (date.equals("")) {
			throw new Exception("Merci de saisir une date.");
		}
	}

	private void valdMotif(String motif) throws Exception {
		if (motif.equals("")) {
			throw new Exception("Merci de saisir votre motif de réservation.");
		}
	}

	private void vald_h_d(String hd) throws Exception {
		if (hd.equals("")) {
			throw new Exception("Merci de saisir une heure.");
		}
	}

	private void vald_h_f(String hf) throws Exception {
		if (hf.equals("")) {
			throw new Exception("Merci de saisir une heure.");
		}
	}

	private void vald_h(String startTime, String endTime) throws Exception {

		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		Date d1 = null;
		Date d2 = null;
		try {
			d1 = sdf.parse(startTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			d2 = sdf.parse(endTime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long elapsed = d2.getTime() - d1.getTime();
		if (elapsed == 0) {
			throw new Exception("Vous avez saisi la meme heure.");
		} else if (elapsed < 0) {
			throw new Exception("Vous avez saisi la meme heure.");
		}
	}

	private void setErreur(String champ, String message) {
		erreurs.put(champ, message);
	}
}
