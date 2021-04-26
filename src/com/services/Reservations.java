package com.services;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.hibernate.dao.ReservationDAO;
import com.projet.beans.Personne;
import com.projet.beans.Reservation;

public class Reservations {

	public void ShowMyReservationTraited(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Personne personne = (Personne) session.getAttribute("personne");

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showMineTraited(personne.getId());

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeMyReservationTraited", size);
		request.setAttribute("valide", us);
	}
	
	public void ShowMyReservationNotTraited(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Personne personne = (Personne) session.getAttribute("personne");

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showMineNotTraited(personne.getId());

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeMyReservationNotTraited", size);
		request.setAttribute("attente", us);
	}

	public void ShowMyReservationRefused(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Personne personne = (Personne) session.getAttribute("personne");

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showMineRefused(personne.getId());

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeMyReservationRefused", size);
		request.setAttribute("refuse", us);
	}

	public void ShowNotTraited(HttpServletRequest request) {

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showNotTraited();

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeReservationNotTraited", size);
		request.setAttribute("attente", us);
	}

	public void ShowTraited(HttpServletRequest request) {

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showTraited();

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeReservationTraited", size);
		request.setAttribute("valide", us);
	}

	public void ShowRefused(HttpServletRequest request) {

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showRefused();

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeReservationRefused", size);
		request.setAttribute("refuse", us);
	}
	public void ShowMyReservation(HttpServletRequest request) {
		HttpSession session = request.getSession();

		Personne personne = (Personne) session.getAttribute("personne");

		ReservationDAO reservation = new ReservationDAO();
		List<Reservation> reservations = reservation.showMine(personne.getId());

		List<Reservation> us = new ArrayList<Reservation>();
		for (int i = 0; i < reservations.size(); i++) {
			us.add(reservations.get(i));
		}
		int size = us.size();
		request.setAttribute("SizeMyReservation", size);
		request.setAttribute("reservations", us);
	}
}
