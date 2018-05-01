package edu.mum.waa.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import edu.mum.waa.domain.Patient;

public class PasswordMatchValidator implements ConstraintValidator<PasswordMatchContraintValidator, Object> {
	@Override
	public void initialize(PasswordMatchContraintValidator constraintAnnotation) {

	}

	@Override
	public boolean isValid(Object object, ConstraintValidatorContext arg1) {
		Patient patient = (Patient) object;
		return patient.getUser().getPassword().equals(patient.getConfirmedPassword());
	}
}