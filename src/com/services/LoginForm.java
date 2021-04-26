/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import java.security.MessageDigest;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.hibernate.dao.PersonneDAO;
import com.projet.beans.Personne;


/**
 *
 * @author hp
 */
public class LoginForm {

    private static final String CHAMP_EMAIL = "email";
    private static final String CHAMP_PASSWORD = "password";
    private static final String CHAMP_LOGIN = "login";

    private Map<String, String> erreurs = new HashMap<>();
    private String resultat;

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public String getResultat() {
        return resultat;
    }

    public Personne creerLogin(HttpServletRequest request) {

        String email = request.getParameter(CHAMP_EMAIL);
        String password = request.getParameter(CHAMP_PASSWORD);

        Personne personne = new Personne();

        try {
            valdEmail(email);
        } catch (Exception e) {
            setErreur(CHAMP_EMAIL, e.getMessage());
        }
        personne.setEmail(email);
        try {
            valdPassword(password);
            personne.setPassword(passwordSecure(password));
        } catch (Exception e) {
            setErreur(CHAMP_PASSWORD, e.getMessage()); 
            
        }
       
        
        PersonneDAO mydao = new PersonneDAO();
        String str = mydao.validate(email,personne.getPassword());
        
        if(erreurs.isEmpty()) {
        	if(str.equals("")) {
        		personne = mydao.showPersonne(email);
			}
        	else {
        		setErreur(CHAMP_LOGIN, str);
        	}
        }
        
        return personne;
    }
    
    private String passwordSecure(String pswd) throws Exception {
   	 
    	MessageDigest md = MessageDigest.getInstance("SHA-256");
          md.update(pswd.getBytes());

          byte byteData[] = md.digest();

          //convertir le tableau de bits en une format hexadécimal - méthode 1
          StringBuffer sb = new StringBuffer();
          for (int i = 0; i < byteData.length; i++) {
           sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
          }
          
          return sb.toString();
    }
   
    private void valdEmail(String email) throws Exception {
        if (email.equals("")) {
            throw new Exception("Merci de saisir votre email.");
        }
    }

    private void valdPassword(String password) throws Exception {
        if (password.equals("")) {
            throw new Exception("Merci de saisir un mot de passe.");
        }
    }

    private void setErreur(String champ, String message) {
        erreurs.put(champ, message);
    }
}
