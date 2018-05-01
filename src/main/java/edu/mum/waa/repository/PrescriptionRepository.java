package edu.mum.waa.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.waa.domain.Prescription;

@Repository
public interface PrescriptionRepository extends CrudRepository<Prescription, Long> {
	@Query("SELECT p FROM prescription p WHERE p.patient.id = :patient_id")
	List<Prescription> findByPatientID(@Param("patient_id") long patientId);
	
	@Query("SELECT p FROM prescription p WHERE p.appointment.id = :appointment_id")
	List<Prescription> findByAppointmentId(@Param("appointment_id") long appointmentId);
}