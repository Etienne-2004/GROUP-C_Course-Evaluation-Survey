 package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("")
public class AuthController {
    private final UserService userService;

    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        return "register";
    }

    @PostMapping("/register")
    public String register(@ModelAttribute User user, @RequestParam String roleName) {
        userService.registerUser(user, roleName);
        return "redirect:/login?registered=true";
    }
}
