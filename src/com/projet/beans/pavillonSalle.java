package com.projet.beans;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name = "pavillonsalle")
@Table(name = "pavillonsalle")
public class pavillonSalle {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	@Column(name = "pavillon")
	private String pavillon;
	
	@OneToMany(mappedBy = "pavillon", cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private List<Salle> salle;

	public pavillonSalle() {
	}

	public pavillonSalle(String pavillon) {
		this.pavillon = pavillon;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPavillon() {
		return pavillon;
	}

	public void setPavillon(String pavillon) {
		this.pavillon = pavillon;
	}

	public List<Salle> getSalle() {
		return salle;
	}

	public void setSalle(List<Salle> salle) {
		this.salle = salle;
	}

	@Override
	public String toString() {
		return "" + pavillon;
	}

	
	

}
