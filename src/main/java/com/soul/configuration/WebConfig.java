package com.soul.configuration;

import com.soul.entity.Manager;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new HandlerInterceptor() {
            @Override
            public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
                if (request.getSession().getAttribute("manager") == null && request.getSession().getAttribute("linkman") == null) {
                    request.getRequestDispatcher("/manager/login").forward(request, response);
                    return false;
                } else {
                    return true;
                }
            }
        }).addPathPatterns("/**").excludePathPatterns("/webjars/**").excludePathPatterns("/css/**").excludePathPatterns("/js/**").excludePathPatterns("/images/**").excludePathPatterns("/linkman/login").excludePathPatterns("/linkman/loginHandle").excludePathPatterns("/manager/login").excludePathPatterns("/manager/loginHandle");
        registry.addInterceptor(new HandlerInterceptor() {
            @Override
            public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
                if (request.getSession().getAttribute("manager") != null) {
                    response.sendRedirect("/index");
                    return false;
                } else {
                    return true;
                }
            }
        }).addPathPatterns("/manager/login").addPathPatterns("/manager/loginHandle");
        registry.addInterceptor(new HandlerInterceptor() {
            @Override
            public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
                if (request.getSession().getAttribute("manager") != null) {
                    Manager manager = (Manager) request.getSession().getAttribute("manager");
                    if (!"管理员".equals(manager.getLevel())) {
                        response.sendRedirect("/noRight");
                        return false;
                    } else {
                        return true;
                    }
                } else {
                    return true;
                }
            }
        }).addPathPatterns("/linkman/toAddPage").addPathPatterns("/linkman/showLinkman/**").addPathPatterns("/linkman/addOrEdit").addPathPatterns("/linkman/delete/**")
                .addPathPatterns("/manager/list").addPathPatterns("/manager/delete/**").addPathPatterns("/manager/edit")
                .addPathPatterns("/visit/toAddPage").addPathPatterns("/visit/showVisit/**").addPathPatterns("/visit/addOrEdit").addPathPatterns("/visit/delete/**");
    }

    @Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/").setViewName("forward:/manager/login");
        registry.addViewController("/index").setViewName("index");
        registry.addViewController("/noRight").setViewName("manager/state/noRight");
        registry.addViewController("/top").setViewName("top");
        registry.addViewController("/menu").setViewName("menu");
        registry.addViewController("/welcome").setViewName("welcome");
    }
}
