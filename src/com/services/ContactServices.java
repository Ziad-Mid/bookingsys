package com.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.ContactDAO;
import com.projet.beans.Contact;

public class ContactServices {
	private static final String CHAMP_NOM = "nom";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_OBJET = "objet";
	private static final String CHAMP_MESSAGE = "message";

	private Map<String, String> erreurs = new HashMap<>();
	private String resultat;

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getResultat() {
		return resultat;
	}

	public Contact Message(HttpServletRequest request) {

		String nom = request.getParameter(CHAMP_NOM);
		String email = request.getParameter(CHAMP_EMAIL);
		String objet = request.getParameter(CHAMP_OBJET);
		String message = request.getParameter(CHAMP_MESSAGE);

		Contact contact = new Contact();

		try {
			valdNom(nom);
		} catch (Exception e) {
			setErreur(CHAMP_NOM, e.getMessage());
		}
		contact.setNom(nom);
		
		try {
			valdEmail(email);
		} catch (Exception e) {
			setErreur(CHAMP_EMAIL, e.getMessage());
		}
		contact.setEmail(email);
		
		try {
			valdObjet(objet);
		} catch (Exception e) {
			setErreur(CHAMP_OBJET, e.getMessage());
		}
		contact.setObjet(objet);

		try {
			valdMessage(message);
		} catch (Exception e) {
			setErreur(CHAMP_MESSAGE, e.getMessage());
		}
		contact.setMessage(message);
		
		ContactDAO dao = new ContactDAO();
		if (erreurs.isEmpty()) {
			dao.saveContact(contact);
		}

		return contact;
	}
	
	public void ShowMessage(HttpServletRequest request) {

		ContactDAO reservation = new ContactDAO();
		List<Contact> reservations = reservation.showMessage();

		List<Contact> us = new ArrayList<Contact>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeMessage", size);
		request.setAttribute("Messages", us);
	}

	private void valdNom(String nom) throws Exception {
		if (nom.equals("")) {
			throw new Exception("Merci de saisir votre nom.");
		}
	}

	private void valdEmail(String email) throws Exception {
		if (email.equals("")) {
			throw new Exception("Merci de saisir votre email.");
		}
	}

	private void valdObjet(String objet) throws Exception {
		if (objet.equals("")) {
			throw new Exception("Merci de saisir un objet.");
		}
	}

	private void valdMessage(String message) throws Exception {
		if (message.equals("")) {
			throw new Exception("Merci de saisir un message.");
		}
	}

	private void setErreur(String champ, String message) {
		erreurs.put(champ, message);
	}
}