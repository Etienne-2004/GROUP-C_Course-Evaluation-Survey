package com.evaluation.assessment.controller;

import com.evaluation.assessment.entity.Survey;
import com.evaluation.assessment.entity.SurveyResponse;
import com.evaluation.assessment.entity.User;
import com.evaluation.assessment.service.SurveyService;
import com.evaluation.assessment.service.UserService;
import com.evaluation.assessment.service.EmailService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/survey")
@RequiredArgsConstructor
public class SurveyController {
    private final SurveyService surveyService;
    private final UserService userService;
    private final EmailService emailService;

    @GetMapping("/list")
    public String surveyList(Model model) {
        model.addAttribute("surveys", surveyService.getAllActiveSurveys());
        return "survey/list";
    }

    @GetMapping("/respond/{id}")
    public String respondToSurvey(@PathVariable Long id, @AuthenticationPrincipal UserDetails userDetails, Model model) {
        Survey survey = surveyService.findById(id);
        if (survey.getAccessType() == Survey.AccessType.AUTHENTICATED && userDetails == null) {
            return "redirect:/login";
        }
        model.addAttribute("survey", survey);
        return "survey/respond";
    }

    @PostMapping("/respond/{id}/submit")
    public String submitResponse(@PathVariable Long id, @AuthenticationPrincipal UserDetails userDetails, @RequestParam(required = false) String guestEmail) {
        Survey survey = surveyService.findById(id);
        SurveyResponse response = new SurveyResponse();
        response.setSurvey(survey);
        
        String targetEmail = "";
        if (userDetails != null) {
            User user = userService.findByUsername(userDetails.getUsername());
            response.setRespondent(user);
            targetEmail = user.getEmail();
        } else {
            response.setGuestEmail(guestEmail);
            targetEmail = guestEmail;
        }
        
        surveyService.submitResponse(response, List.of()); // Simplified logic for placeholder
        
        if (targetEmail != null && !targetEmail.isEmpty()) {
            emailService.sendVerificationEmail(targetEmail, survey.getTitle());
        }
        
        return "redirect:/survey/list?submitted=true";
    }
}
