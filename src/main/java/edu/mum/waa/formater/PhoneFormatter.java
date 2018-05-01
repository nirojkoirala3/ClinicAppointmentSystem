package edu.mum.waa.formater;

import java.util.Locale;

import org.springframework.format.Formatter;

import edu.mum.waa.domain.Phone;


public class PhoneFormatter implements Formatter<Phone>{

	@Override
	public String print(Phone phone, Locale locale) {
	
		return phone.getPrefix() + "-" + phone.getArea() + "-" + phone.getSuffix();
	}

	@Override
	public Phone parse(String text, Locale locale) {
		
		Phone phone = null;
			int area= Integer.parseInt(text.substring(0, 3));
			int prefix =  Integer.parseInt(text.substring(4, 7));
			int suffix = Integer.parseInt(text.substring(8, 11));
			phone = new Phone(area, prefix, suffix);
		return phone;
	}
	
}
