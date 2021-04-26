/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import java.security.MessageDigest;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.PersonneDAO;
import com.projet.beans.Personne;

/**
 *
 * @author hp
 */
public class AccountForm {

	private static final String CHAMP_NOM = "nom";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_TYPE = "type";
	private static final String CHAMP_LAST_PASSWORD = "lastpass";
	private static final String CHAMP_PASSWORD = "password";
	private static final String CHAMP_PASSCONF = "passconf";

	private Map<String, String> erreurs = new HashMap<>();
	private String resultat;

	public Map<String, String> getErreurs() {
		return erreurs;
	}

	public String getResultat() {
		return resultat;
	}

	public Personne creerInscription(HttpServletRequest request) {

		String nom = request.getParameter(CHAMP_NOM);
		String email = request.getParameter(CHAMP_EMAIL);
		String type = request.getParameter(CHAMP_TYPE);
		String lastpass = request.getParameter(CHAMP_LAST_PASSWORD);
		String password = request.getParameter(CHAMP_PASSWORD);
		String passconf = request.getParameter(CHAMP_PASSCONF);

		Personne personne = new Personne();

		try {
			valdNom(nom);
		} catch (Exception e) {
			setErreur(CHAMP_NOM, e.getMessage());
		}
		personne.setNomComplet(nom);

		personne.setEmail(email);

		personne.setType(type);

		try {
			lastpass = passwordSecure(lastpass);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		PersonneDAO mydao = new PersonneDAO();
		String str = mydao.validate(email, lastpass);
		if (erreurs.isEmpty()) {
			if (str.equals("")) {
				personne = mydao.showPersonne(email);
			} else {
				setErreur(CHAMP_LAST_PASSWORD, str);
			}
		}

		try {
			valdPassword(password, passconf);
		} catch (Exception e) {
			setErreur(CHAMP_PASSWORD, e.getMessage());
		}
		try {
			personne.setPassword(passwordSecure(password));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		if (erreurs.isEmpty()) {
			mydao.updatePersonne(email, personne);
		}

		return personne;
	}

	private void valdNom(String nom) throws Exception {
		if (nom.equals("")) {
			throw new Exception("Merci de saisir votre nom complet.");
		}
	}

	private void valdPassword(String password, String passconf) throws Exception {
		if (password.equals("")) {
			throw new Exception("Merci de saisir un mot de passe.");
		} else {
			if (password.equals(passconf)) {
				String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!,._-]).{8,20}$";
				if (!isValidPassword(password, regex)) {
					throw new Exception(
							"Le mot de passe que vous avez saisi est faible.<br> Veuillez saisir un mot de passe avec : Au moin 8 caractere dont 1 chiffre, 1 lettre MAJ, 1 lettre min, 1 caractere(@#$%!,._-). ");
				}
			} else if (!password.equals(passconf)) {
				throw new Exception("Mot de passe incorrect.");
			}
		}
	}

	public boolean isValidPassword(String password, String regex) {
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = pattern.matcher(password);
		return matcher.matches();
	}

	private String passwordSecure(String pswd) throws Exception {

		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(pswd.getBytes());

		byte byteData[] = md.digest();

		// convertir le tableau de bits en une format hexad�cimal - m�thode 1
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < byteData.length; i++) {
			sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
		}

		return sb.toString();
	}

	private void setErreur(String champ, String message) {
		erreurs.put(champ, message);
	}
}
