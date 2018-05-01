package edu.mum.waa.validator;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Constraint(validatedBy = PasswordMatchValidator.class)
public @interface PasswordMatchContraintValidator {
	String message() default "{edu.mum.waa.patient.password.message}";
	Class<?>[] groups() default {};
	public abstract Class<? extends Payload>[] payload() default {};
}