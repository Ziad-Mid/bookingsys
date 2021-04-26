package com.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.PavillonDAO;
import com.hibernate.dao.PersonneDAO;
import com.hibernate.dao.SalleDAO;
import com.projet.beans.Personne;
import com.projet.beans.Salle;
import com.projet.beans.pavillonSalle;

public class HomeSevices {
	
	public void MyHome(HttpServletRequest request) {
		PavillonDAO pavillon = new PavillonDAO();

		List<pavillonSalle> pavillons = pavillon.displayPavillon();

		List<pavillonSalle> urls = new ArrayList<pavillonSalle>();
		for (int i = 0; i < pavillons.size(); i++) {
			urls.add(pavillons.get(i));
		}

		SalleDAO salle = new SalleDAO();
		for (int i = 1; i <= 4; i++) {
			List<Salle> uris = null;
			List<Salle> salles = salle.displaySalle(i);

			uris = new ArrayList<Salle>();
			for (int j = 0; j < salles.size(); j++) {
				uris.add(salles.get(j));
			}
			request.setAttribute("salles" + i, uris);
		}

		request.setAttribute("pavillons", urls);
	}
	
	public void dash(HttpServletRequest request) {
		PersonneDAO personne = new PersonneDAO();
		List<Personne> personnes = personne.showAll();
		
		List<Personne> urls = new ArrayList<Personne>();
		
		for (int i = 0; i < personnes.size(); i++) {
			urls.add(personnes.get(i));
		}
		int size = urls.size();
		request.setAttribute("SizeUsers", size);
		request.setAttribute("personnes", urls);
	}
}
