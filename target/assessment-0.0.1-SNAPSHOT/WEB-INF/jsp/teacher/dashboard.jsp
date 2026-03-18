<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lecturer Insight Portal | RP Evaluation</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="page-enter">
    <nav>
        <a href="<c:url value='/'/>" class="logo-container">
            <i class="fas fa-chalkboard-user"></i>
            <div>
                 <span style="font-size: 1.3rem;">RP</span> TEACH
            </div>
        </a>
        <div class="nav-links">
            <a href="<c:url value='/teacher/dashboard'/>" class="active">My Courses</a>
            <a href="<c:url value='/teacher/analytics'/>">Global Analytics</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">Academic Faculty</span>
                <h1 style="margin-top: 0.5rem;">Welcome, <c:out value="${teacher.fullName}"/></h1>
                <p style="color: var(--text-muted);">Access real-time student feedback and pedagogical metrics for your assigned modules.</p>
            </div>
            <div style="display: flex; gap: 1rem;">
                <div class="glass" style="padding: 0.75rem 1.5rem; display: flex; align-items: center; gap: 0.8rem;">
                    <div style="width: 10px; height: 10px; border-radius: 50%; background: #10b981; box-shadow: 0 0 10px #10b981;"></div>
                    <span style="font-weight: 700; font-size: 0.85rem;">ACTIVE SEMESTER: 2026-A</span>
                </div>
            </div>
        </div>

        <div class="stat-grid">
            <div class="glass stat-card fade-up">
                <i class="fas fa-book-reader"></i>
                <span class="stat-label">Assigned Modules</span>
                <div class="stat-value"><c:out value="${courses.size()}"/></div>
                <div class="stat-trend" style="color: var(--primary);">
                    <i class="fas fa-sync"></i> Synchronized with Registrar
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.1s;">
                <i class="fas fa-user-graduate"></i>
                <span class="stat-label">Student Engagement</span>
                <div class="stat-value">142</div>
                <div class="stat-trend" style="color: #10b981;">
                    <i class="fas fa-arrow-up"></i> 84% Participation Rate
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.2s;">
                <i class="fas fa-star"></i>
                <span class="stat-label">Average KPI</span>
                <div class="stat-value">4.8/5</div>
                <div class="stat-trend" style="color: #f59e0b;">
                    <i class="fas fa-award"></i> Excellence Recognition
                </div>
            </div>
        </div>

        <h2 style="margin-bottom: 2.5rem; display: flex; align-items: center; gap: 1rem;">
             Institutional Assignments
             <span class="role-badge" style="background: rgba(139, 92, 246, 0.1); font-size: 0.7rem; font-weight: 800;">${courses.size()} MODULES</span>
        </h2>

        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(400px, 1fr)); gap: 2.5rem;">
            <c:forEach var="course" items="${courses}">
                <div class="glass fade-up" style="padding: 3rem; border-top: 4px solid var(--primary); display: flex; flex-direction: column; justify-content: space-between;">
                    <div>
                        <div style="font-size: 0.85rem; font-weight: 800; color: var(--text-muted); margin-bottom: 1rem; text-transform: uppercase; letter-spacing: 0.1em;">${course.code} | MODULE</div>
                        <h3 style="font-size: 1.75rem; margin-bottom: 1.5rem; line-height: 1.3;">${course.name}</h3>
                        <p style="font-size: 0.95rem; color: var(--text-muted); margin-bottom: 2.5rem; line-height: 1.6;">${course.description}</p>
                        
                        <div style="margin-bottom: 2rem;">
                            <h4 style="font-size: 0.75rem; text-transform: uppercase; color: var(--text-muted); margin-bottom: 1rem; letter-spacing: 0.1em; display: flex; align-items: center; gap: 0.5rem;">
                                <i class="fas fa-clipboard-list" style="color: var(--primary);"></i>
                                Associated Evaluations
                            </h4>
                            <div style="display: flex; flex-direction: column; gap: 0.8rem;">
                                <c:forEach var="survey" items="${surveys}">
                                    <c:if test="${survey.course.id == course.id}">
                                        <div style="display: flex; justify-content: space-between; align-items: center; background: rgba(15, 23, 42, 0.2); border: 1px solid var(--glass-border); padding: 1rem 1.25rem; border-radius: 12px; transition: 0.3s;" class="glass-hover">
                                            <div style="display: flex; flex-direction: column;">
                                                <span style="font-weight: 600; font-size: 0.9rem;">${survey.title}</span>
                                                <span style="font-size: 0.7rem; color: var(--text-muted); font-weight: 700;">TYPE: ${survey.accessType}</span>
                                            </div>
                                            <a href="<c:url value='/teacher/results/${survey.id}'/>" class="btn btn-primary" style="padding: 0.5rem 1rem; font-size: 0.75rem;">
                                                <i class="fas fa-chart-pie"></i> Insights
                                            </a>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                            <c:if test="${empty surveys}">
                                <div style="display: flex; align-items: center; gap: 0.8rem; padding: 1.5rem; background: rgba(15, 23, 42, 0.2); border-radius: 12px; color: #f59e0b; border: 1px dashed rgba(245, 158, 11, 0.2);">
                                    <i class="fas fa-info-circle"></i>
                                    <span style="font-size: 0.85rem; font-weight: 600;">No evaluation instruments linked to this module yet.</span>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty courses}">
                <div style="grid-column: 1/-1; text-align: center; padding: 10rem 2rem; background: rgba(15, 23, 42, 0.2); border-radius: 2rem; border: 2px dashed var(--glass-border);">
                     <i class="fas fa-chalkboard" style="font-size: 4rem; color: var(--text-muted); margin-bottom: 2rem; opacity: 0.2;"></i>
                     <h2 style="color: var(--text-muted);">No module assignments detected.</h2>
                     <p style="color: var(--text-muted); margin-top: 1rem;">Please coordinate with the Office of the Registrar or Campus Administration.</p>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
