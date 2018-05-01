package edu.mum.waa.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import edu.mum.waa.domain.Patient;
import edu.mum.waa.domain.User;
import edu.mum.waa.service.PatientService;

public class EmailExistValidator implements ConstraintValidator<EmailExist, String> {
	@Autowired
	private PatientService patientService;
	

	@Override
	public void initialize(EmailExist constraintAnnotation) {

	}

	@Override
	public boolean isValid(String str, ConstraintValidatorContext arg1) {
		//Patient patient = null;
		User user = null;
		try {
			//patient = patientService.findByEmail(str);
			user = patientService.findByUsername(str);
		} catch (Exception e) {
			return true;
		}
		return user == null;
	}
}