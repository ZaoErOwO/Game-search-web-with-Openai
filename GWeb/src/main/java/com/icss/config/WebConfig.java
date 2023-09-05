package com.icss.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
	
	/**
     * Adding a Unified Prefix to Request Paths
     *
     * @param configurer
     */
    @Override
    public void configurePathMatch(PathMatchConfigurer configurer) {
    	configurer.addPathPrefix("/app", c -> c.isAnnotationPresent(RestController.class) || c.isAnnotationPresent(Controller.class));
    }

}
