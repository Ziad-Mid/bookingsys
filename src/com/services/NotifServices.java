package com.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hibernate.dao.NotifDAO;
import com.projet.beans.Notification;
import com.projet.beans.Personne;

public class NotifServices {

	public void ShowMyNotif(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Personne personne = (Personne) session.getAttribute("personne");

		NotifDAO reservation = new NotifDAO();
		List<Notification> notifications = reservation.showMyNotif(personne.getId());

		List<Notification> us = new ArrayList<Notification>();
		for (int i = 0; i < notifications.size(); i++) {
			us.add(notifications.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeMyNotif", size);
		request.setAttribute("notifications", us);
	}

	public void SaveMyNotif(HttpServletRequest request, String Text,Personne personne) {
		NotifDAO dao = new NotifDAO();
		Notification notification = new Notification(Text);

		notification.setPersonne(personne);

		dao.saveNotif(notification);
	}
}
