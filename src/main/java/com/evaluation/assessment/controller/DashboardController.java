package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class DashboardController {
    private final UserService userService;

    @GetMapping("/dashboard")
    public String dashboard(@AuthenticationPrincipal UserDetails userDetails, Model model) {
        String username = userDetails.getUsername();
        User user = userService.findByUsername(username);
        String role = user.getRole().getName();
        
        model.addAttribute("user", user);
        
        if (role.equals("ADMIN")) return "redirect:/admin/dashboard";
        if (role.equals("INITIATOR")) return "redirect:/initiator/dashboard";
        if (role.equals("TEACHER")) return "redirect:/teacher/dashboard";
        
        return "redirect:/student/dashboard";
    }

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }
}
