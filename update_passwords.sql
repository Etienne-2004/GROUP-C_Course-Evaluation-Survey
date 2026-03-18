-- Update user passwords with correct BCrypt hash for "password"
UPDATE users SET password = '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi' WHERE username IN 
('rp_admin', 'registrar', 'hod_it', 'hod_eng', 'lecturer1', 'lecturer2', 'student_101', 'student_102');
