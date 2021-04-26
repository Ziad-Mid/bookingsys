package com.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.PersonneDAO;
import com.hibernate.dao.ReservationDAO;
import com.projet.beans.Personne;
import com.projet.beans.Reservation;

public class RefuseService {

	public void Refuse(HttpServletRequest request) {
		ReservationDAO res = new ReservationDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		res.refuserReservation(id);
		ReservationDAO reser = new ReservationDAO();
		Reservation r = reser.showById(id);
		String text = "Bonjour " + r.getPersonne().getNomComplet() + ".<br> Votre réservation qui porte l'identifiant <strong>#"
				+ id
				+ "</strong> à  été refusée suite à  une activité qui s'oppose avec les termes et les politiques.<br>Pour plus d'informations <a href='terms-conditions'>cliquez-ici</a>.";

		String texte = "Bonjour.<br> La réservation qui porte l'identifiant <strong>#"
				+ id
				+ "</strong> à  été refusée suite à  une activité qui s'oppose avec les termes et les politiques.";
		
		NotifServices srv = new NotifServices();
		PersonneDAO personne = new PersonneDAO();
		List<Personne> personnes = personne.showAdmins();
		for (int i = 0; i < personnes.size(); i++) {
			srv.SaveMyNotif(request, texte, personnes.get(i));
		}

		srv.SaveMyNotif(request, text, r.getPersonne());

	}
}
