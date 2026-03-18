<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Rwanda Polytechnic | Evaluation Hub</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .hero-section {
            display: flex;
            align-items: center;
            min-height: 85vh;
            padding: 0 8%;
            gap: 4rem;
        }

        .hero-content {
            flex: 1;
            z-index: 10;
        }

        .hero-image {
            flex: 1.2;
            height: 600px;
            background: url('/static/images/login_bg.png'); /* Reusing high-quality asset */
            background-size: cover;
            background-position: center;
            border-radius: 2rem;
            border: 1px solid var(--glass-border);
            box-shadow: 0 40px 100px rgba(0,0,0,0.5);
            position: relative;
        }

        .hero-image::after {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(30deg, var(--primary) 0%, transparent 60%);
            opacity: 0.3;
            border-radius: 2rem;
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 2.5rem;
            margin: 6rem 8%;
        }

        .info-card {
            padding: 3rem;
            position: relative;
            overflow: hidden;
        }

        .info-card i {
            font-size: 3rem;
            margin-bottom: 2rem;
            background: var(--grad-main);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
    </style>
</head>
<body class="page-enter">
    <div class="visual-bg">
        <div class="blob" style="top: -10%; left: -10%;"></div>
        <div class="blob" style="bottom: -10%; right: -10%; background: var(--secondary);"></div>
    </div>

    <nav>
        <a href="<c:url value='/'/>" class="logo-container">
            <i class="fas fa-graduation-cap"></i>
            <div>
                 <span style="font-size: 1.3rem;">RP</span> EVAL
            </div>
        </a>
        <div class="nav-links">
            <a href="<c:url value='/survey/list'/>">View Surveys</a>
            <a href="<c:url value='/login'/>" class="btn btn-primary" style="padding: 0.6rem 1.5rem;">Access Dashboard</a>
        </div>
    </nav>

    <main>
        <section class="hero-section">
            <div class="hero-content fade-up">
                <span class="role-badge" style="margin-bottom: 2rem; display: inline-block;">Empowering Student Voices</span>
                <h1 class="hero-title" style="font-size: 4.5rem;">The Future of <br><span>Academic Quality</span></h1>
                <p class="hero-subtext" style="max-width: 600px; margin-bottom: 3rem; font-size: 1.2rem;">
                    Rwanda Polytechnic's official digital platform for continuous academic evaluation 
                    and institutional excellence. Secure, anonymous, and impactful feedback loops.
                </p>
                <div style="display: flex; gap: 1.5rem;">
                    <a href="<c:url value='/login'/>" class="btn btn-primary" style="padding: 1.2rem 2.5rem; font-size: 1.1rem;">
                        <i class="fas fa-rocket"></i> Get Started
                    </a>
                    <a href="#roles" class="btn btn-secondary" style="padding: 1.2rem 2.5rem; font-size: 1.1rem;">
                        <i class="fas fa-info-circle"></i> Learn More
                    </a>
                </div>
            </div>
            
            <div class="hero-image fade-up" style="animation-delay: 0.2s;">
                <div class="glass" style="position: absolute; bottom: 2rem; left: -2rem; padding: 2rem; max-width: 300px;">
                    <div style="font-size: 2rem; font-weight: 800;">100%</div>
                    <div style="color: var(--text-muted); font-size: 0.8rem;">Data Encryption & Privacy</div>
                </div>
            </div>
        </section>

        <section id="roles" class="card-grid">
            <div class="glass info-card glass-hover fade-up" style="animation-delay: 0.3s;">
                <i class="fas fa-user-shield"></i>
                <h3 style="font-size: 1.75rem; margin-bottom: 1.5rem;">Administrators</h3>
                <p style="color: var(--text-muted);">Centrally manage lecturers, course assignments, and institutional approval workflows with enterprise-grade tools.</p>
            </div>
            <div class="glass info-card glass-hover fade-up" style="animation-delay: 0.4s;">
                <i class="fas fa-chart-pie"></i>
                <h3 style="font-size: 1.75rem; margin-bottom: 1.5rem;">HOD / Initiators</h3>
                <p style="color: var(--text-muted);">Design sophisticated evaluation models and generate deep analytics reports to improve departmental performance.</p>
            </div>
            <div class="glass info-card glass-hover fade-up" style="animation-delay: 0.5s;">
                <i class="fas fa-chalkboard-user"></i>
                <h3 style="font-size: 1.75rem; margin-bottom: 1.5rem;">Lecturers</h3>
                <p style="color: var(--text-muted);">Access real-term student feedback and monitoring metrics for assigned courses to refine teaching methodologies.</p>
            </div>
        </section>

        <section style="margin: 8rem 8% 10rem; text-align: center;">
            <div class="glass" style="padding: 6rem; border-radius: 3rem; background: linear-gradient(rgba(139, 92, 246, 0.05), rgba(139, 92, 246, 0.05)); border: 1px dashed var(--glass-border);">
                 <h2 style="font-size: 3rem; margin-bottom: 2rem;">Ready to shape the future of RP?</h2>
                 <p style="color: var(--text-muted); margin-bottom: 3rem; font-size: 1.1rem;">Join the national community of students and educators committed to quality.</p>
                 <a href="<c:url value='/register'/>" class="btn btn-primary" style="padding: 1.2rem 3rem;">Register Your Account</a>
            </div>
        </section>
    </main>

    <footer style="padding: 6rem 8%; border-top: 1px solid var(--glass-border); display: flex; justify-content: space-between; align-items: center; background: rgba(0,0,0,0.2);">
        <div class="logo-container">
            <i class="fas fa-graduation-cap"></i>
            <span>RP EVAL</span>
        </div>
        <div style="color: var(--text-muted); font-size: 0.9rem;">
            © 2026 Rwanda Polytechnic | Quality Assurance Hub. All Rights Reserved.
        </div>
        <div class="nav-links">
             <a href="#"><i class="fab fa-twitter"></i></a>
             <a href="#"><i class="fab fa-linkedin"></i></a>
             <a href="#"><i class="fab fa-github"></i></a>
        </div>
    </footer>
</body>
</html>
