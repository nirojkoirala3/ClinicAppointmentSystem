package edu.mum.waa.validator;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = EmailExistValidator.class)
@Documented
public @interface EmailExist {
	String message() default "{edu.mum.waa.patient.email.exist}";
	Class<?>[] groups() default {};
	public abstract Class<? extends Payload>[] payload() default {};
}