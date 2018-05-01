INSERT INTO `jdn`.`user`(`username`, `password`, `enabled`, `role`) VALUES ('admin@mum.edu', '$2a$06$HZdf9.pKdAmSXp6a8ltUUeghU4i.RhyhLd0Y0cY0olJ0W8nPyGxKm', True, 'ROLE_ADMIN');
INSERT INTO `jdn`.`user`(`username`, `password`, `enabled`, `role`) VALUES ('doctor@mum.edu', '$2a$06$y7z84MbQKZN3mSuG4pkp6eoEjzre3K9m8rAW1cg/QB069/uaTb672', True, 'ROLE_DOCTOR');
INSERT INTO `jdn`.`user`(`username`, `password`, `enabled`, `role`) VALUES ('receptionist@mum.edu', '$2a$06$7QzG4R4FBYuMxg92HzsBqeqjusU4Efwq5gqC9yv7rWI9AOPNYoxHS', True, 'ROLE_RECEPTIONIST');
INSERT INTO `jdn`.`user`(`username`, `password`, `enabled`, `role`) VALUES ('patient@mum.edu', '$2a$06$tfuv/KLkBll7XaY0VPdHn.Im6OEjs.bTIIfzWMdsA7Rfr75Aegtam', True, 'ROLE_PATIENT');

INSERT INTO `jdn`.`doctor`(`email`, `first_name`, `last_name`, `speciality`, `enabled`, `user_id`) VALUES ('doctor@mum.edu', 'Sample', 'Doctor', 'DERMATOLOGISTS', True, 2);

INSERT INTO `jdn`.`receptionist`(`email`, `first_name`, `last_name`, `enabled`, `user_id`) VALUES ('receptionist@mum.edu', 'Sample', 'Receptionist', True, 3);

INSERT INTO `jdn`.`patient`(`birth_date`, `email`, `first_name`, `last_name`, `phone`, `remarks`, `user_id`) VALUES ('2017-09-27', 'patient@mum.edu', 'Sample', 'Patient', '012-345-6789', 'The patient is fierceful.', 4);

INSERT INTO `jdn`.`appointment` (`id`, `booking_type`, `date`, `description`, `doctor_id`, `patient_id`) VALUES ('1', '1', '2017-1-1', 'AnnualHealthCheck', '1', '1');

INSERT INTO `jdn`.`prescription` (`id`, `symptomps`, `diagnosis`, `medication`, `dosages`, `date`, `appointment_id`, `doctor_id`, `patient_id`) VALUES ('1', 'hight body temperature','malaria', 'Quinine', 'two medicine per day','2017-1-1', '1', '1','1');