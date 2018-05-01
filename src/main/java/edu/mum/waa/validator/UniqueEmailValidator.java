package edu.mum.waa.validator;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import edu.mum.waa.domain.Doctor;
import edu.mum.waa.service.DoctorService;

class UniqueEmailValidator implements ConstraintValidator<UniqueEmail, String> {

    @Resource
    private DoctorService doctorService;
    @Resource
    private HttpServletRequest request;

    @Override
	public void initialize(UniqueEmail constraint) {}

	@Override
	public boolean isValid(String email, ConstraintValidatorContext arg1) {
		Doctor doctor = null;
		try {
			doctor = doctorService.findByEmail(email);
		} catch (Exception e) {
			return true;
		}
		return doctor == null;
	}

    /*public boolean isValid(String email, ConstraintValidatorContext context) {
        Map<String, String> pathVariables = (Map<String, String>) request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);
        if(pathVariables.get("id") != null) {
            int id = Integer.parseInt(pathVariables.get("id"));
            return doctorService.findOne(id).getEmail().equals(email) || doctorService.findByEmail(email) == null;
        }
        return doctorService.findByEmail(email) == null;
    }*/
    
    
    

}
