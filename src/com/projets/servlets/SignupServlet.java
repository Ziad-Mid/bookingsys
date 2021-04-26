/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projets.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projet.beans.Personne;
import com.services.InscriptionForm;
import com.services.NotifServices;

/**
 *
 * @author hp
 */

@SuppressWarnings("serial")
public class SignupServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		if (request.getParameter("submitsignup") != null) {
				
			 
			 request.getRequestDispatcher("/WEB-INF/verify.jsp").forward(request, response);
			 
			 
	        } 
		 
		request.getRequestDispatcher("/WEB-INF/signup.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
 if (request.getParameter("submitsignup") != null) {
			 
			 InscriptionForm form = new InscriptionForm();

				Personne personne = form.creerInscription(request);

				  request.setAttribute("form", form);
			      request.setAttribute("personne", personne);
			        
				if (form.getErreurs().isEmpty()) {
					
					 form.processRequest(request,response,personne);
				}
				else {
					request.getRequestDispatcher("/WEB-INF/signup.jsp").forward(request, response);
				}
			
			 
			 
	        }
 
 else if (request.getParameter("submitverif") != null) {
 	//Code verification
	  InscriptionForm form = new InscriptionForm();
	 
boolean res = form.VerifCode(request);
	



request.setAttribute("form", form);


if (res) {
	
	/* Alors r√©cup√©ration de la map des clients dans la session */
	HttpSession session = request.getSession();


	Personne person =	(Personne) session.getAttribute("person");

	try {
		form.savePersonne(person);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

	String text = "Bonjour " + person.getNomComplet() + ".<br>Vous Ètes inscrits avec l'adresse e-mail <strong>"
			+ person.getEmail() + "</strong> sous l'identifiant <strong>#" + person.getId()
			+ "</strong>.<br>Bienvenue chez BookingSys, et commencez ‡† rÈserver la salle qui vous convient.";

	NotifServices srv = new NotifServices();
	
	srv.SaveMyNotif(request, text, person );
	
	session.setAttribute("personne", person);
	response.sendRedirect("/bookingsys");
	
} else {
	request.setAttribute("erreurcode", "Le code que vous avez saisi est incorrecte.");
	request.getRequestDispatcher("/WEB-INF/verify.jsp").forward(request, response);
}

   	
   }
	}
}
