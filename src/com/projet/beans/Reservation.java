/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projet.beans;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author hp
 */
@Entity(name = "reservation")
@Table(name = "reservation")
public class Reservation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "date")
	private String date;
	@Column(name = "heureDebut")
	private String heureDebut;
	@Column(name = "heureFin")
	private String heureFin;
	@Column(name = "etat")
	private int etat;
	@Column(name = "motif")
	private String motif;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idPersonne")
	private Personne personne;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idSalle")
	private Salle salle;

	public Reservation() {

	}

	public Reservation(String date, String heureDebut, String heureFin, String motif) {
		this.date = date;
		this.heureDebut = heureDebut;
		this.heureFin = heureFin;
		this.motif = motif;
		this.etat = 0;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHeureDebut() {
		return heureDebut;
	}

	public void setHeureDebut(String heureDebut) {
		this.heureDebut = heureDebut;
	}

	public String getHeureFin() {
		return heureFin;
	}

	public void setHeureFin(String heureFin) {
		this.heureFin = heureFin;
	}

	public String isEtat() {
		if (etat == 1) {
			return "Réservation Acceptée";
		} else if (etat == 1) {
			return "Réservation En attente";
		} else {
			return "Réservation Refusée";
		}
	}

	public void setEtat(int etat) {
		this.etat = etat;
	}

	public String getMotif() {
		return motif;
	}

	public void setMotif(String motif) {
		this.motif = motif;
	}

	public Personne getPersonne() {
		return personne;
	}

	public void setPersonne(Personne personne) {
		this.personne = personne;
	}

	public Salle getSalle() {
		return salle;
	}

	public void setSalle(Salle salle) {
		this.salle = salle;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", date=" + date + ", heureDebut=" + heureDebut + ", heureFin=" + heureFin
				+ ", personne=" + personne + ", salle=" + salle + "]";
	}

}
