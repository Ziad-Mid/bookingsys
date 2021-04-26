package com.projets.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.services.HomeSevices;
import com.services.NewReservationService;
import com.services.SallesServices;

/**
 * Servlet implementation class SalleServlet
 */
public class SalleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SalleServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		SallesServices service = new SallesServices();

		service.displaySalle(request);
		
		HomeSevices home = new HomeSevices();

		home.MyHome(request);
		request.setAttribute("salle_active","active");

		request.getRequestDispatcher("/WEB-INF/salle.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("salle_active","active");
		HttpSession session = request.getSession();

		if (session.getAttribute("personne") != null) {
			HomeSevices home = new HomeSevices();

			home.MyHome(request);

			NewReservationService form = new NewReservationService();

			form.creerReservation(request);

			request.setAttribute("form", form);

			if (form.getErreurs().isEmpty()) {
				String file = "succes.js";
				request.setAttribute("file", file);
				request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
			} else {
				String file = "fail.js";
				request.setAttribute("file", file);
				request.getRequestDispatcher("/WEB-INF/index.jsp").forward(request, response);
			}
		} else {
			response.sendRedirect("/bookingsys/login");
		}
	}

}
