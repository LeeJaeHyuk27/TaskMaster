package com.mysite.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.mysite.admin.interceptor.AdminInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer{

	@Autowired
    private AdminInterceptor adminInterceptor;

	// AdminInterceptor가 실제로 /admin에 대한 호출을 가로채게 해주는 configuration
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(adminInterceptor)
                .addPathPatterns("/admin/**"); // /admin으로 시작하는 모든 하위 경로들
    }
}
