/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projets.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projet.beans.Personne;
import com.services.AccountForm;

/**
 *
 * @author hp
 */

@SuppressWarnings("serial")
public class AccountServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setAttribute("compte_active","active");
        request.getRequestDispatcher("/WEB-INF/account.jsp").forward(request, response);
    }

    
    @SuppressWarnings("unchecked")
	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AccountForm form = new AccountForm();

        Personne personne = form.creerInscription(request);

        request.setAttribute("form", form);
        request.setAttribute("personne", personne);
        request.setAttribute("compte_active","active");
        if (form.getErreurs().isEmpty()) {
            /* Alors récupération de la map des clients dans la session */
            HttpSession session = request.getSession();
			Map<String, Personne> personnes = (HashMap<String, Personne>) session.getAttribute("personnes");
            /* Si aucune map n'existe, alors initialisation d'une nouvelle map */
            if (personnes == null) {
                personnes = new HashMap<>();
            }
            /* Puis ajout du client courant dans la map */
            personnes.put(personne.getEmail(), personne);
            /* Et enfin (ré)enregistrement de la map en session */
            session.setAttribute("personnes", personnes);

            request.getRequestDispatcher("/WEB-INF/account.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("/WEB-INF/account.jsp").forward(request, response);
        }
    }
}
