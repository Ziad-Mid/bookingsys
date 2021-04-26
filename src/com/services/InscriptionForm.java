/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.services;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.util.*;
import java.util.regex.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hibernate.dao.PersonneDAO;
import com.projet.beans.Personne;

/**
 *
 * @author hp
 */
public class InscriptionForm {

	private static final String CHAMP_NOM = "nom";
	private static final String CHAMP_EMAIL = "email";
	private static final String CHAMP_EMAIL_CHECK = "email_check";
	private static final String CHAMP_TYPE = "type";
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
		String password = request.getParameter(CHAMP_PASSWORD);
		String passconf = request.getParameter(CHAMP_PASSCONF);

		Personne personne = new Personne();

		try {
			valdNom(nom);
		} catch (Exception e) {
			setErreur(CHAMP_NOM, e.getMessage());
		}
		personne.setNomComplet(nom);
		try {
			valdEmail(email);
		} catch (Exception e) {
			setErreur(CHAMP_EMAIL, e.getMessage());
		}
		try {
			valdEmailCheck(email);
		} catch (Exception e) {
			setErreur(CHAMP_EMAIL_CHECK, e.getMessage());
		}
		personne.setEmail(email);
		try {
			valdType(type);
		} catch (Exception e) {
			setErreur(CHAMP_TYPE, e.getMessage());
		}
		personne.setType(type);
		try {
			valdPassword(password, passconf);
		} catch (Exception e) {
			setErreur(CHAMP_PASSWORD, e.getMessage());
		}
		personne.setPassword(password);

	
		return personne;
	}
	
	public void savePersonne(Personne personne) throws Exception {
		 PersonneDAO mydao = new PersonneDAO();
   
		 String pswd = personne.getPassword();
		 
		
	        personne.setPassword(passwordSecure(pswd)); 
	        
       	mydao.savePersonne(personne);
       	
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response,Personne pers)
            throws ServletException, IOException {
    	
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            //feth form value
           
           String email = request.getParameter(CHAMP_EMAIL);
           
      		//create instance object of the SendEmail Class
           SendEmail sm = new SendEmail();
           
      		//get the 6-digit code
           String code = sm.getRandom();
           
           
      		//craete new user using all information
           Personne   person = pers;
           
           //call the send email method
           boolean test = sm.sendEmail(email,code);
           
      		//check if the email send successfully
           if(test){
               HttpSession session  = request.getSession();
               //code generer
               session.setAttribute("codecreated", code);
               //user info
               session.setAttribute("person", person);
               
               request.getRequestDispatcher("/WEB-INF/verify.jsp").forward(request, response);
           }else{
      		  out.println("L'envoie d'email de verification a echoué. Veuillez verifier votre connexion internet.");
      	   }
           
        }
    }
	

	   public boolean VerifCode(HttpServletRequest request)
	            throws ServletException, IOException {
	       
	    
	            
	            HttpSession session = request.getSession();
	            String codecreated = (String) session.getAttribute("codecreated");
	            
	            String code = request.getParameter("authcode");
	            
	            boolean result = false ; 
	            
	            if(code.equals(codecreated)){
	               
	              
	                result = true;
	                return result ;
	              
	            }else{
	            
	            	  result = false;
		                return result ;
	            }
	            
	           
	      
	    }
	    
	
	   private String passwordSecure(String pswd) throws Exception {
	    	 
	    	MessageDigest md = MessageDigest.getInstance("SHA-256");
	          md.update(pswd.getBytes());

	          byte byteData[] = md.digest();

	          //convertir le tableau de bits en une format hexadï¿½cimal - mï¿½thode 1
	          StringBuffer sb = new StringBuffer();
	          for (int i = 0; i < byteData.length; i++) {
	           sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
	          }
	          
	          return sb.toString();
	    }
	
	
	public Personne recupPers(HttpServletRequest request) {
		
		    String nom = request.getParameter(CHAMP_NOM);
	        String email = request.getParameter(CHAMP_EMAIL);
	        String type = request.getParameter(CHAMP_TYPE);
	        String password = request.getParameter(CHAMP_PASSWORD);
		
		Personne pers = new Personne(nom,email,type,password);
		
		
	return pers;	
	}
	
	
	
	private void valdNom(String nom) throws Exception {
		if (nom.equals("")) {
			throw new Exception("Merci de saisir votre nom complet.");
		}
	}

	private void valdEmail(String email) throws Exception {
		if (email.equals("")) {
			throw new Exception("Merci de saisir votre email.");
		}
		
	}

	private void valdEmailCheck(String email) throws Exception {
		
		if (!email.equals("")) {
			PersonneDAO dao = new PersonneDAO();
			if (dao.showPersonne(email) != null) {
				throw new Exception("Un compte est déja crée avec cet email.");
			}
		}
	}

	private void valdType(String type) throws Exception {
		if (type.equals("none")) {
			throw new Exception("Merci de saisir votre type.");
		}
	}

	private void valdPassword(String password, String passconf) throws Exception {
		if (password.equals("")) {
			throw new Exception("Merci de saisir un mot de passe.");
		} else {
			if (password.equals(passconf)) {
				String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%!,._-]).{8,20}$";
				if (!isValidPassword(password, regex)) {
					throw new Exception("Le mot de passe que vous avez saisi est faible. Veuillez saisir un mot de passe avec : Au moin 8 caractere dont 1 chiffre, 1 lettre MAJ, 1 lettre min, 1 caractere(@#$%!,._-). ");
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

	private void setErreur(String champ, String message) {
		erreurs.put(champ, message);
	}
}
