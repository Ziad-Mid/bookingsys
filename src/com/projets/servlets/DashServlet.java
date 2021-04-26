package com.projets.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.projet.beans.Personne;
import com.services.ContactServices;
import com.services.HomeSevices;
import com.services.NewReservationService;
import com.services.NotifServices;
import com.services.Reservations;

/**
 * Servlet implementation class DashServlet
 */
@WebServlet("/dashboard")
public class DashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DashServlet() {
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
		HttpSession session = request.getSession();
		Personne personne = (Personne) session.getAttribute("personne");
		HomeSevices home = new HomeSevices();
		home.MyHome(request);
		NotifServices notif = new NotifServices();
		notif.ShowMyNotif(request);
		Reservations reservation = new Reservations();
		home.dash(request);
		
		if (personne.getType().equals("Admin")) {
			ContactServices ct = new ContactServices();
			ct.ShowMessage(request);
			reservation.ShowTraited(request);
			reservation.ShowRefused(request);
			reservation.ShowNotTraited(request);
			request.getRequestDispatcher("/WEB-INF/admindash.jsp").forward(request, response);
		} else if (personne.getType().equals("Responsable de réservation")) {
			reservation.ShowTraited(request);
			reservation.ShowRefused(request);
			reservation.ShowNotTraited(request);
			request.getRequestDispatcher("/WEB-INF/respdash.jsp").forward(request, response);
		} else {
			reservation.ShowMyReservationTraited(request);
			reservation.ShowMyReservationRefused(request);
			reservation.ShowMyReservationNotTraited(request);
			request.getRequestDispatcher("/WEB-INF/userdash.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HomeSevices home = new HomeSevices();

		home.MyHome(request);

		NewReservationService form = new NewReservationService();

		Reservations reservation = new Reservations();

		form.creerReservation(request);

		request.setAttribute("form", form);

		NotifServices notif = new NotifServices();
		notif.ShowMyNotif(request);
		reservation.ShowMyReservationTraited(request);
		reservation.ShowMyReservationRefused(request);
		reservation.ShowMyReservationNotTraited(request);

		request.getRequestDispatcher("/WEB-INF/userdash.jsp").forward(request, response);
	}

}
