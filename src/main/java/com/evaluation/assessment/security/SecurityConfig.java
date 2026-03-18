package com.evaluation.assessment.security;

import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.service.UserService;
import jakarta.servlet.DispatcherType;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.SecurityFilterChain;
import java.util.Collections;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    
    private final UserService userService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(auth -> auth
                .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.ERROR).permitAll()
                .requestMatchers("/", "/register", "/login", "/home", "/survey/respond/**", "/css/**", "/images/**", "/error", "/login_bg.png").permitAll()
                .requestMatchers("/admin/**").hasAuthority("ADMIN")
                .requestMatchers("/initiator/**").hasAuthority("INITIATOR")
                .requestMatchers("/teacher/**").hasAuthority("TEACHER")
                .anyRequest().authenticated()
            )
            .formLogin(login -> login
                .loginPage("/login")
                .defaultSuccessUrl("/dashboard", true)
                .permitAll()
            )
            .logout(logout -> logout.permitAll());
        
        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return username -> {
            User user = userService.findByUsername(username);
            if (user == null) throw new UsernameNotFoundException("User not found");
            if (user.getRole() != null && user.getRole().getName().equals("TEACHER") && !user.isApproved()) {
                throw new UsernameNotFoundException("Teacher account pending approval");
            }
            String roleName = (user.getRole() != null) ? user.getRole().getName() : "STUDENT";
            return new org.springframework.security.core.userdetails.User(
                user.getUsername(),
                user.getPassword(),
                Collections.singletonList(new SimpleGrantedAuthority(roleName))
            );
        };
    }
}
