package edu.mum.waa.interceptor;

import java.security.Principal;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import edu.mum.waa.domain.User;
import edu.mum.waa.domain.UserRoles;

public class RoleInterceptor extends HandlerInterceptorAdapter {
	// Helps render "Hi, username!" in header.tag file.
	// Also useful to other conditional checking.
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		Principal principal = request.getUserPrincipal();
		if (principal != null && principal instanceof UsernamePasswordAuthenticationToken) {
			UsernamePasswordAuthenticationToken token = (UsernamePasswordAuthenticationToken) principal;
			Collection<GrantedAuthority> authorities = token.getAuthorities();
			if (authorities.size() > 0) {
				String roleValue = authorities.iterator().next().getAuthority();
				UserRoles role = UserRoles.valueOf(roleValue);
				User user = new User();
				user.setUsername(token.getName());
				user.setRole(role);
				request.setAttribute("currentUser", user);
			}
		}
		return super.preHandle(request, response, handler);
	}
}