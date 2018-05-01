package edu.mum.waa.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity(name = "appointment")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private long id;

	@OneToOne
	@JoinColumn(name = "doctor_id")
	private Doctor doctor;

	@OneToOne
	@JoinColumn(name = "patient_id")
	private Patient patient;

	@DateTimeFormat(pattern = "MM-dd-yyyy")
	@Column(name = "date")
	private Date date;

	@NotEmpty(message = "{appointment.notEmpty}")
	@Column(name = "description")
	private String description;

	@Column(name = "booking_type")
	private AppointmentBookingType bookingtype;

	public AppointmentBookingType getBookingtype() {
		return bookingtype;
	}

	public void setBookingtype(AppointmentBookingType bookingtype) {
		this.bookingtype = bookingtype;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Doctor getDoctor() {
		return doctor;
	}

	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}

	public Patient getPatient() {
		return patient;
	}

	public void setPatient(Patient patient) {
		this.patient = patient;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
}