package com.icss.config;

import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.util.unit.DataSize;

import jakarta.servlet.MultipartConfigElement;

@Configuration
public class MultiConfig {
	
	  @Bean
      public MultipartConfigElement multipartConfigElement() {

          MultipartConfigFactory factory = new MultipartConfigFactory();

          factory.setMaxFileSize(DataSize.ofKilobytes(100)); 
          
         factory.setMaxRequestSize(DataSize.ofMegabytes(2));
         return factory.createMultipartConfig();
      }

}
