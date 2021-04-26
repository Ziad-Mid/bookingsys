package com.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.SalleDAO;
import com.projet.beans.Salle;
import com.projet.beans.pavillonSalle;

public class SallesServices {

	public void displaySalle(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));

		SalleDAO salle = new SalleDAO();

		List<Salle> salles = salle.showSalleByPavillon(id);

		pavillonSalle pavillon = null;

		List<Salle> urls = new ArrayList<Salle>();
		for (int i = 0; i < salles.size(); i++) {
			urls.add(salles.get(i));
			pavillon = salles.get(i).getPavillon();
		}
		
		request.setAttribute("salles", urls);

		request.setAttribute("pavillon", pavillon);
	}
}
