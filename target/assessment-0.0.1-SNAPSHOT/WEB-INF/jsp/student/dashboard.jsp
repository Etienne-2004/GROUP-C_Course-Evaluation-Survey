<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard | EVALU8.PRO</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
</head>
<body class="page-enter">
    <div class="bg-blob" style="top: 10%; right: 10%; background: #a855f7;"></div>

    <nav>
        <div class="logo">EVALU8.PRO | STUDENT</div>
        <div class="nav-links">
            <a href="<c:url value='/survey/list'/>">All Surveys</a>
            <div style="margin-left: 2rem;"><a href="<c:url value='/logout'/>" class="btn btn-secondary">Sign Out</a></div>
        </div>
    </nav>

    <div class="dashboard-container">
        <header style="margin-bottom: 4rem;">
            <h1>My Participation Dashboard</h1>
            <p style="color: var(--text-secondary);">Track your completed surveys and find new evaluation cycles.</p>
        </header>

        <div class="stat-grid">
            <div class="glass stat-card">
                <h3 style="color: var(--text-secondary); font-size: 0.9rem; margin-bottom: 0.5rem;">Completed Surveys</h3>
                <div style="font-size: 2.5rem; font-weight: 800;">12</div>
                <div style="color: #10b981; font-size: 0.8rem; margin-top: 0.5rem;">Semester total</div>
            </div>
            <div class="glass stat-card">
                <h3 style="color: var(--text-secondary); font-size: 0.9rem; margin-bottom: 0.5rem;">Pending Tasks</h3>
                <div style="font-size: 2.5rem; font-weight: 800;">2</div>
                <div style="color: #ef4444; font-size: 0.8rem; margin-top: 0.5rem;">Due this week</div>
            </div>
        </div>

        <h2 style="margin-bottom: 2rem;">Recommended Surveys</h2>
        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 2rem;">
            <div class="glass" style="padding: 2.5rem;">
                <span class="btn btn-primary" style="padding: 0.3rem 0.8rem; font-size: 0.7rem; margin-bottom: 1rem;">CS102 Data Structures</span>
                <h3 style="margin-bottom: 1rem;">Mid-term Feedback</h3>
                <p style="color: var(--text-secondary); font-size: 0.9rem; margin-bottom: 2rem;">Provide your thoughts on the course structure and teaching quality so far.</p>
                <a href="<c:url value='/survey/list'/>" class="btn btn-secondary" style="width: 100%; justify-content: center;">View Available Surveys</a>
            </div>
        </div>
    </div>
</body>
</html>
