package com.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.PersonneDAO;
import com.hibernate.dao.ReservationDAO;
import com.projet.beans.Personne;
import com.projet.beans.Reservation;

public class ValideService {
	public void valide(HttpServletRequest request) {
		ReservationDAO res = new ReservationDAO();
		int id = Integer.parseInt(request.getParameter("id"));
		res.validerReservation(id);
		ReservationDAO reser = new ReservationDAO();
		Reservation r = reser.showById(id);
		String text = "Bonjour " + r.getPersonne().getNomComplet()
				+ ".<br>Votre r�servation qui porte l'identifiant <strong>#" + id
				+ "</strong> � �t� valid�e avec succ�s.<br>Vous pouvez mettre en place le <strong>" + r.getDate()
				+ "</strong> de <strong>" + r.getHeureDebut() + "</strong> jusqu'� <strong>" + r.getHeureFin()
				+ "</strong>.<br>Cordialement.";

		String texte = "La r�servation qui porte l'identifiant <strong>#" + id
				+ "</strong> � �t� valid�e avec succ�s.<br>" + r.getPersonne().getNomComplet()
				+ " sera mettre en place le <strong>" + r.getDate() + "</strong> de <strong>" + r.getHeureDebut()
				+ "</strong> jusqu'� <strong>" + r.getHeureFin() + "</strong>.<br>Cordialement.";

		NotifServices srv = new NotifServices();
		PersonneDAO personne = new PersonneDAO();
		List<Personne> personnes = personne.showAdmins();
		for (int i = 0; i < personnes.size(); i++) {
			srv.SaveMyNotif(request, texte, personnes.get(i));
		}

		srv.SaveMyNotif(request, text, r.getPersonne());
	}
}
