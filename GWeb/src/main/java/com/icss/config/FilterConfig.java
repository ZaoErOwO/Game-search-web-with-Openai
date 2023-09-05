package com.icss.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.icss.filter.UserFilter;

@Configuration
public class FilterConfig {
	
	@Bean
	public FilterRegistrationBean UserFilter() {
		FilterRegistrationBean registration = new FilterRegistrationBean();
		registration.setFilter(new UserFilter());
		registration.addUrlPatterns("/app/user/*");
		registration.setName("UserFilter");
		registration.setOrder(1);		
		
		return registration;
	}
	
	
}
