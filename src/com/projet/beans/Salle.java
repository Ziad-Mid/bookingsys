/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.projet.beans;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;




/**
 *
 * @author hp
 */
@Entity(name = "salle")
@Table(name = "salle")
public class Salle {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "nom")
	private String nom;
	
	@Column(name = "capacite")
	private int capacite;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="idPavillon")
	private pavillonSalle pavillon;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="idType")
	private typeSalle type;
	
	@OneToMany(mappedBy = "salle", cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	private List<Reservation> reservation;
	
	public Salle() {

	}

	public Salle(String nom,int capacite) {
		this.nom = nom;
		this.capacite = capacite;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public int getCapacite() {
		return capacite;
	}

	public void setCapacite(int capacite) {
		this.capacite = capacite;
	}

	public pavillonSalle getPavillon() {
		return pavillon;
	}

	public void setPavillon(pavillonSalle pavillon) {
		this.pavillon = pavillon;
	}
	

	public typeSalle getType() {
		return type;
	}

	public void setType(typeSalle type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "Salle [id=" + id + ", nom=" + nom + ", capacite=" + capacite + ", pavillon=" + pavillon + ", type="
				+ type + "]";
	}
	
	

}
