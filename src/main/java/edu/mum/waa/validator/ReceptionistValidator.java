package edu.mum.waa.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import edu.mum.waa.domain.Receptionist;
import edu.mum.waa.service.ReceptionistService;

public class ReceptionistValidator implements Validator {
	
	@Autowired
	ReceptionistService receptionistService;

	@Override
	public boolean supports(Class<?> arg0) {
		
		return Receptionist.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object arg0, Errors arg1) {
		Receptionist receptionist = (Receptionist) arg0;
		if(receptionistService.emailExists(receptionist))
		{
			arg1.rejectValue("email", "receptionist.Email");
		}
		
	}

}
