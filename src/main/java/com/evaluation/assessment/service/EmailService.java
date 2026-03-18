package com.evaluation.assessment.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailService {
    private final JavaMailSender mailSender;

    public void sendEmail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom("harindintwarietiennee@gmail.com");
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);
        mailSender.send(message);
    }

    public void sendVerificationEmail(String to, String surveyTitle) {
        String subject = "Survey Submission Confirmation - Rwanda Polytechnic";
        String body = "Dear Respondent,\n\n" +
                     "Thank you for participating in the course evaluation for: " + surveyTitle + ".\n" +
                     "Your feedback has been successfully recorded in the Rwanda Polytechnic Evaluation System.\n\n" +
                     "Best regards,\n" +
                     "Rwanda Polytechnic Quality Assurance Team";
        sendEmail(to, subject, body);
    }

    public void sendRegistrationConfirmation(String to, String fullName, String roleName) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("harindintwarietiennee@gmail.com");
            message.setTo(to);
            message.setSubject("Welcome to Rwanda Polytechnic Evaluation System");

            String emailText = String.format(
                "Dear %s,\n\n" +
                "Welcome to Rwanda Polytechnic Evaluation System!\n\n" +
                "Your account has been successfully created with the following details:\n" +
                "• Role: %s\n" +
                "• Email: %s\n\n" +
                "IMPORTANT: Your account requires admin approval before you can access the system.\n\n" +
                "Next Steps:\n" +
                "1. Your account is now pending approval from the system administrator\n" +
                "2. You will receive another email once your account is approved\n" +
                "3. After approval, you can login using your credentials\n\n" +
                "For immediate assistance, please contact the IT department.\n\n" +
                "Best regards,\n" +
                "Rwanda Polytechnic Evaluation System Team\n" +
                "IT Department - Rwanda Polytechnic",
                fullName, roleName, to
            );

            message.setText(emailText);
            mailSender.send(message);
            
            log.info("Registration confirmation email sent to: {}", to);
        } catch (Exception e) {
            log.error("Failed to send registration email to: {}", to, e);
        }
    }

    public void sendAccountApprovalNotification(String to, String fullName) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("harindintwarietiennee@gmail.com");
            message.setTo(to);
            message.setSubject("Account Approved - Rwanda Polytechnic Evaluation System");

            String emailText = String.format(
                "Dear %s,\n\n" +
                "Great news! Your account has been approved by the system administrator.\n\n" +
                "You can now access the Rwanda Polytechnic Evaluation System.\n\n" +
                "Login Details:\n" +
                "• Email: %s\n" +
                "• URL: http://localhost:8080\n\n" +
                "Please login using the credentials you created during registration.\n\n" +
                "If you have any questions or need assistance, please contact the IT department.\n\n" +
                "Best regards,\n" +
                "Rwanda Polytechnic Evaluation System Team\n" +
                "IT Department - Rwanda Polytechnic",
                fullName, to
            );

            message.setText(emailText);
            mailSender.send(message);
            
            log.info("Account approval notification sent to: {}", to);
        } catch (Exception e) {
            log.error("Failed to send approval email to: {}", to, e);
        }
    }

    public void sendAdminApprovalNotification(String adminEmail, String userFullName, String userEmail, String roleName) {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("harindintwarietiennee@gmail.com");
            message.setTo(adminEmail);
            message.setSubject("New User Registration - Approval Required");

            String emailText = String.format(
                "Dear Administrator,\n\n" +
                "A new user has registered and requires your approval:\n\n" +
                "User Details:\n" +
                "• Name: %s\n" +
                "• Email: %s\n" +
                "• Role: %s\n" +
                "• Registration Time: %s\n\n" +
                "Please login to the admin dashboard to approve or reject this registration.\n\n" +
                "Admin Dashboard: http://localhost:8080/admin/users\n\n" +
                "This is an automated notification from the Rwanda Polytechnic Evaluation System.\n\n" +
                "Best regards,\n" +
                "RP Evaluation System",
                userFullName, userEmail, roleName, java.time.LocalDateTime.now().toString()
            );

            message.setText(emailText);
            mailSender.send(message);
            
            log.info("Admin approval notification sent for user: {}", userEmail);
        } catch (Exception e) {
            log.error("Failed to send admin notification for user: {}", userEmail, e);
        }
    }
}
