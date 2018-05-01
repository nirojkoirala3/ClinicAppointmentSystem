package edu.mum.waa.controller;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;

import edu.mum.waa.domain.User;
import edu.mum.waa.domain.UserRoles;

public class ControllerHelper {
	// Returns the friendly domain User from the current principal.
	// http://www.mkyong.com/spring-security/get-current-logged-in-username-in-spring-security/
	public static User getCurrentUser() {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (principal != null && principal instanceof org.springframework.security.core.userdetails.User) {
			org.springframework.security.core.userdetails.User coreUser = (org.springframework.security.core.userdetails.User) principal;
			Collection<GrantedAuthority> authorities = coreUser.getAuthorities();
			if (authorities.size() > 0) {
				String roleValue = authorities.iterator().next().getAuthority();
				UserRoles role = UserRoles.valueOf(roleValue);
				User user = new User();
				user.setUsername(coreUser.getUsername());
				user.setPassword(coreUser.getPassword());
				user.setRole(role);
				user.setEnabled(coreUser.isAccountNonLocked());
				return user;
			}
		}
		return null;
	}
}
