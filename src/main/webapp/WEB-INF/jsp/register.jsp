<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Professional Enrollment | RP Evaluation</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="login-container">
    <aside class="login-aside">
        <div class="branding-content">
            <div class="branding-logo">
                <i class="fas fa-user-plus" style="font-size: 2.5rem; color: var(--primary);"></i>
                <div style="line-height: 1.1;">
                    <div style="font-size: 1.25rem;">Institutional Access</div>
                    <div style="font-size: 0.8rem; color: var(--text-muted); font-weight: 500; letter-spacing: 0.2rem;">RP EVALUATION HUB</div>
                </div>
            </div>
            
            <h1 class="hero-text">
                Join the <span>Educational</span> <br>Revolution
            </h1>
            
            <p class="hero-subtext">
                Register as an academic professional (Teacher/Initiator) to begin 
                influencing the quality of teaching and pedagogy at Rwanda Polytechnic.
            </p>
            
            <div style="margin-top: 4rem;">
                <div class="glass" style="padding: 2.5rem; max-width: 450px;">
                    <h3 style="margin-bottom: 1rem;"><i class="fas fa-shield-alt" style="color: var(--primary);"></i> Secure Enrollment</h3>
                    <p style="color: var(--text-muted); font-size: 0.9rem;">Your account will be strictly verified and approved by the system administration to ensure institutional integrity.</p>
                </div>
            </div>
        </div>
    </aside>

    <main class="login-section">
        <div class="login-form-wrapper" style="max-width: 420px;">
            <div class="login-header">
                <h2>Create Account 👋</h2>
                <p>Register for Rwanda Polytechnic Evaluation System</p>
            </div>

            <form action="<c:url value='/register'/>" method="post" style="display: grid; grid-template-columns: 1fr 1fr; gap: 1rem;">
                <div class="form-group" style="grid-column: span 2;">
                    <label>Full Professional Name</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-signature input-icon"></i>
                        <input type="text" name="fullName" placeholder="enter your full name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Unique Username</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-user-circle input-icon"></i>
                        <input type="text" name="username" placeholder="e.g. j.ndayisaba" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Institutional Email</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" name="email" placeholder="example@rp.ac.rw" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Account Password</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" name="password" placeholder="••••••••" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Professional Role</label>
                    <div class="input-icon-wrapper">
                         <i class="fas fa-id-badge input-icon"></i>
                         <select name="roleName" style="padding-left: 3rem;">
                             <option value="TEACHER">Lecturer / Teacher</option>
                             <option value="INITIATOR">HOD / Initiator</option>
                         </select>
                    </div>
                </div>

                <button type="submit" class="btn-full" style="grid-column: span 2; margin-top: 1rem;">
                    <i class="fas fa-paper-plane"></i> Submit Registration Request
                </button>
            </form>

            <div style="margin-top: 3rem; text-align: center; color: var(--text-muted); font-size: 0.9rem;">
                Already have an institutional account? <a href="<c:url value='/login'/>" style="color: var(--primary); font-weight: 700;">Sign In</a>
            </div>
        </div>
    </main>
</body>
</html>
