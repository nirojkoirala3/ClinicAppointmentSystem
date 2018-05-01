package edu.mum.waa.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import edu.mum.waa.domain.Appointment;

@Repository
public interface AppointmentRepository extends CrudRepository<Appointment, Long> {
	@Query("SELECT a FROM appointment a INNER JOIN a.doctor d WHERE d.email = :email")
	Iterable<Appointment> findByDoctorEmail(@Param("email") String email);
	
	@Query("SELECT a FROM appointment a INNER JOIN a.patient p WHERE p.email = :email")
	Iterable<Appointment> findByPatientEmail(@Param("email") String email);
}
