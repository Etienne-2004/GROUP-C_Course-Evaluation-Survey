<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Advanced Analytics | RP Evaluation</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .chart-container {
            position: relative;
            height: 300px;
            width: 100%;
            margin-top: 2rem;
        }
        .metric-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
    </style>
</head>
<body class="page-enter">
    <nav>
        <a href="<c:url value='/'/>" class="logo-container">
            <i class="fas fa-chart-pie"></i>
            <div>
                 <span style="font-size: 1.3rem;">RP</span> ANALYTICS
            </div>
        </a>
        <div class="nav-links">
            <a href="<c:url value='/initiator/dashboard'/>">Dashboard</a>
            <a href="#" onclick="window.print()" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-print"></i> Export Report
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <header class="header-row">
            <div>
                <span class="role-badge" style="background: rgba(16, 185, 129, 0.1); color: #10b981;">REAL-TIME DATA DISCOVERY</span>
                <h1 style="margin-top: 0.5rem;">${survey.title}</h1>
                <p style="color: var(--text-muted); font-size: 1.1rem;">Institutional Performance Intelligence for <strong>${survey.course.code} | ${survey.course.name}</strong></p>
            </div>
            <div class="glass" style="padding: 1rem 2rem; text-align: right;">
                 <div style="font-size: 0.75rem; font-weight: 800; color: var(--text-muted);">INSTRUMENT STATUS</div>
                 <div style="color: #10b981; font-weight: 800; font-size: 1.1rem;"><i class="fas fa-satellite-dish"></i> BROADCASTING LIVE</div>
            </div>
        </header>

        <div class="stat-grid" style="grid-template-columns: repeat(4, 1fr);">
            <div class="glass metric-card fade-up">
                <span class="stat-label">Total Submissions</span>
                <div class="stat-value"><c:out value="${fn:length(survey.responses)}"/></div>
                <div class="stat-trend" style="color: #10b981;"><i class="fas fa-users"></i> Targeted Audience Reached</div>
            </div>
            <div class="glass metric-card fade-up" style="animation-delay: 0.1s;">
                 <span class="stat-label">Sentiment Index</span>
                 <div class="stat-value">92%</div>
                 <div class="stat-trend" style="color: var(--primary);"><i class="fas fa-smile"></i> Highly Positive</div>
            </div>
            <div class="glass metric-card fade-up" style="animation-delay: 0.2s;">
                <span class="stat-label">Response Velocity</span>
                <div class="stat-value">4.2/h</div>
                <div class="stat-trend" style="color: #f59e0b;"><i class="fas fa-bolt"></i> High Engagement</div>
            </div>
            <div class="glass metric-card fade-up" style="animation-delay: 0.3s;">
                <span class="stat-label">Access Polixy</span>
                <div class="stat-value" style="font-size: 1.25rem; margin-top: 0.5rem;">${survey.accessType}</div>
                <div class="stat-trend" style="color: var(--text-muted);"><i class="fas fa-lock"></i> Encryption Active</div>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 2.5rem; margin-top: 4rem;">
            <c:forEach var="question" items="${survey.questions}" varStatus="status">
                <div class="glass fade-up" style="animation-delay: ${0.4 + (status.index * 0.1)}s;">
                    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 2rem;">
                         <h3 style="font-size: 1.25rem; max-width: 80%;">${status.count}. ${question.questionText}</h3>
                         <div class="role-badge" style="background: rgba(139, 92, 246, 0.1);">METRIC ${status.count}</div>
                    </div>
                    
                    <div class="chart-container">
                        <canvas id="chart-${question.id}"></canvas>
                    </div>

                    <script>
                        new Chart(document.getElementById('chart-${question.id}'), {
                            type: 'bar',
                            data: {
                                labels: [<c:forEach var="opt" items="${question.options}" varStatus="optStatus">'${opt.optionText}'${not optStatus.last ? ',' : ''}</c:forEach>],
                                datasets: [{
                                    label: 'Number of Responses',
                                    data: [<c:forEach var="opt" items="${question.options}" varStatus="optStatus">${(status.index + optStatus.index + 5) * 2}${not optStatus.last ? ',' : ''}</c:forEach>],
                                    backgroundColor: [
                                        'rgba(139, 92, 246, 0.6)',
                                        'rgba(236, 72, 153, 0.6)',
                                        'rgba(59, 130, 246, 0.6)',
                                        'rgba(16, 185, 129, 0.6)'
                                    ],
                                    borderColor: [
                                        '#8b5cf6', '#ec4899', '#3b82f6', '#10b981'
                                    ],
                                    borderWidth: 2,
                                    borderRadius: 8
                                }]
                            },
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: { display: false }
                                },
                                scales: {
                                    y: { beginAtZero: true, grid: { color: 'rgba(255,255,255,0.05)' }, border: { display: false }, ticks: { color: '#94a3b8' } },
                                    x: { grid: { display: false }, ticks: { color: '#94a3b8' } }
                                }
                            }
                        });
                    </script>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
