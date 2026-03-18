<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enterprise Security Center | RP Evaluation</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="login-container">
    <aside class="login-aside">
        <div class="branding-content">
            <div class="branding-logo">
                <i class="fas fa-graduation-cap" style="font-size: 2.5rem; color: var(--primary);"></i>
                <div style="line-height: 1.1;">
                    <div style="font-size: 1.25rem;">Rwanda Polytechnic</div>
                    <div style="font-size: 0.8rem; color: var(--text-muted); font-weight: 500; letter-spacing: 0.2rem;">EVALUATION SYSTEM</div>
                </div>
            </div>
            
            <h1 class="hero-text">
                Transforming <span>Academic</span> <br>Quality Through Feedback
            </h1>
            
            <p class="hero-subtext">
                Rwanda's first integrated, national-scale platform for course evaluation 
                and teaching excellence across all polytechnics and colleges.
            </p>
            
            <div style="margin-top: 4rem; display: flex; gap: 3rem;">
                <div>
                    <h3 style="font-size: 2rem; font-weight: 900;">22+</h3>
                    <p style="color: var(--text-muted); font-size: 0.8rem;">Departments</p>
                </div>
                <div>
                    <h3 style="font-size: 2rem; font-weight: 900;">14K+</h3>
                    <p style="color: var(--text-muted); font-size: 0.8rem;">Total Students</p>
                </div>
                <div>
                    <h3 style="font-size: 2rem; font-weight: 900;">100%</h3>
                    <p style="color: var(--text-muted); font-size: 0.8rem;">Feedback Coverage</p>
                </div>
            </div>
        </div>
    </aside>

    <main class="login-section">
        <div class="login-form-wrapper">
            <div class="login-header">
                <h2>Welcome Back 👋</h2>
                <p>Sign in to your professional dashboard — RP Evaluation</p>
            </div>

            <c:if test="${param.error != null}">
                <div style="background: rgba(239, 68, 68, 0.1); color: #ef4444; padding: 1rem; border-radius: 0.75rem; border: 1px solid rgba(239, 68, 68, 0.2); margin-bottom: 2rem; font-size: 0.9rem;">
                    <i class="fas fa-exclamation-triangle"></i> Access Denied. Check credentials or approval status.
                </div>
            </c:if>

            <form action="<c:url value='/login'/>" method="post">
                <div class="form-group">
                    <label>Username (or Institutional Email)</label>
                    <div class="input-icon-wrapper">
                         <i class="fas fa-user input-icon"></i>
                        <input type="text" name="username" placeholder="enter your username" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <a href="#" class="forgot-link">Forgot password?</a>
                    <label>Security Password</label>
                    <div class="input-icon-wrapper">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" name="password" placeholder="••••••••" required>
                        <i class="fas fa-eye" style="position: absolute; right: 1rem; top: 50%; transform: translateY(-50%); color: var(--text-muted); cursor: pointer;"></i>
                    </div>
                </div>

                <button type="submit" class="btn-full">
                    <i class="fas fa-sign-in-alt"></i> Sign In to Dashboard
                </button>
            </form>

            <div class="demo-accounts">
                <div class="demo-title">Quick Access — Demo Accounts</div>
                <div class="demo-grid">
                    <div class="demo-card" onclick="document.getElementsByName('username')[0].value='rp_admin'; document.getElementsByName('password')[0].value='password'">
                        <div class="demo-icon"><i class="fas fa-user-shield"></i></div>
                        <div class="demo-info">
                            <h4>Admin</h4>
                            <p>rp_admin</p>
                        </div>
                    </div>
                    <div class="demo-role-card demo-card" onclick="document.getElementsByName('username')[0].value='hod_it'; document.getElementsByName('password')[0].value='password'">
                        <div class="demo-icon"><i class="fas fa-user-tie"></i></div>
                        <div class="demo-info">
                            <h4>Initiator</h4>
                            <p>hod_it</p>
                        </div>
                    </div>
                    <div class="demo-role-card demo-card" onclick="document.getElementsByName('username')[0].value='lecturer1'; document.getElementsByName('password')[0].value='password'">
                        <div class="demo-icon"><i class="fas fa-chalkboard-teacher"></i></div>
                        <div class="demo-info">
                            <h4>Teacher</h4>
                            <p>lecturer1</p>
                        </div>
                    </div>
                    <div class="demo-role-card demo-card" onclick="document.getElementsByName('username')[0].value='student_101'; document.getElementsByName('password')[0].value='password'">
                        <div class="demo-icon"><i class="fas fa-user-graduate"></i></div>
                        <div class="demo-info">
                            <h4>Student</h4>
                            <p>student_101</p>
                        </div>
                    </div>
                </div>
            </div>

            <div style="margin-top: 2rem; text-align: center; color: var(--text-muted); font-size: 0.9rem;">
                Don't have an account? <a href="<c:url value='/register'/>" style="color: var(--primary); font-weight: 700;">Create Account</a>
            </div>
        </div>
    </main>
</body>
</html>
