
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

/**
 *
 * @author hp
 */
@Entity(name="personne")
@Table(name="personne")
public class Personne {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="nomComplet")
    private String nomComplet;
	@Column(name="type")
    private String type;
	@Column(name="email")
    private String email;
	@Column(name="password")
    private String password;
	
	@OneToMany(mappedBy = "personne", cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
	private List<Reservation> reservation;
    
    public Personne() {
    	
    }

    public Personne(String nomComplet, String type, String email, String password) {
		super();
		this.nomComplet = nomComplet;
		this.type = type;
		this.email = email;
		this.password = password;
	}
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

	public String getNomComplet() {
        return nomComplet;
    }

    public void setNomComplet(String nomComplet) {
        this.nomComplet = nomComplet;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
