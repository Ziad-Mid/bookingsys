package com.projet.beans;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name = "notifications")
@Table(name = "notifications")
public class Notification {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;

	@Column(name = "text")
	private String text;

	@Column(name = "time")
	private String time;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "idP")
	private Personne p;

	public Notification() {

	}

	public Notification(String text) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		this.text = text;
		this.time = formatter.format(date);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public Personne getPersonne() {
		return p;
	}

	public void setPersonne(Personne p) {
		this.p = p;
	}

	@Override
	public String toString() {
		return "Notification [id=" + id + ", text=" + text + ", time=" + time + ", personne=" + p + "]";
	}

}
