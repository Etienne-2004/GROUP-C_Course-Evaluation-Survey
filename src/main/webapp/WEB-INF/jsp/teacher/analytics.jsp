<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Analytics Dashboard | RP Teacher</title>
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
            <a href="<c:url value='/teacher/dashboard'/>">My Courses</a>
            <a href="<c:url value='/teacher/analytics'/>" class="active">Global Analytics</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">Performance Analytics</span>
                <h1 style="margin-top: 0.5rem;">Teaching Excellence Metrics</h1>
                <p style="color: var(--text-muted);">Comprehensive analytics for your teaching performance and student engagement.</p>
            </div>
        </div>

        <div class="stat-grid">
            <div class="glass stat-card fade-up">
                <i class="fas fa-chart-line"></i>
                <span class="stat-label">Average Rating</span>
                <div class="stat-value">4.8/5</div>
                <div class="stat-trend" style="color: #10b981;">
                    <i class="fas fa-arrow-up"></i> +0.3 this semester
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.1s;">
                <i class="fas fa-users"></i>
                <span class="stat-label">Total Responses</span>
                <div class="stat-value">342</div>
                <div class="stat-trend" style="color: var(--primary);">
                    <i class="fas fa-check-circle"></i> 89% completion rate
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.2s;">
                <i class="fas fa-trophy"></i>
                <span class="stat-label">Department Rank</span>
                <div class="stat-value">#2</div>
                <div class="stat-trend" style="color: #f59e0b;">
                    <i class="fas fa-award"></i> Top 10% performer
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.3s;">
                <i class="fas fa-comments"></i>
                <span class="stat-label">Student Feedback</span>
                <div class="stat-value">156</div>
                <div class="stat-trend" style="color: #10b981;">
                    <i class="fas fa-heart"></i> 94% positive
                </div>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 2fr 1fr; gap: 2rem;">
            <div class="glass fade-up" style="animation-delay: 0.4s; padding: 0;">
                <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border);">
                    <h2 style="font-size: 1.5rem;">Performance Trends</h2>
                    <p style="color: var(--text-muted); font-size: 0.9rem;">Teaching effectiveness over time</p>
                </div>
                <div style="padding: 2rem; height: 300px; display: flex; align-items: center; justify-content: center; color: var(--text-muted);">
                    <div style="text-align: center;">
                        <i class="fas fa-chart-area" style="font-size: 4rem; margin-bottom: 1rem; opacity: 0.3;"></i>
                        <p>Analytics visualization would be displayed here</p>
                        <p style="font-size: 0.85rem; margin-top: 0.5rem;">Chart integration available in production</p>
                    </div>
                </div>
            </div>

            <div class="glass fade-up" style="animation-delay: 0.5s; padding: 0;">
                <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border);">
                    <h2 style="font-size: 1.5rem;">Key Achievements</h2>
                </div>
                <div style="padding: 2rem;">
                    <div style="display: flex; flex-direction: column; gap: 1.5rem;">
                        <div style="display: flex; align-items: center; gap: 1rem;">
                            <div style="width: 40px; height: 40px; border-radius: 50%; background: rgba(16, 185, 129, 0.1); display: flex; align-items: center; justify-content: center; color: #10b981;">
                                <i class="fas fa-star"></i>
                            </div>
                            <div>
                                <div style="font-weight: 600;">Excellence in Teaching</div>
                                <div style="font-size: 0.85rem; color: var(--text-muted);">Rated 4.8+ for 3 consecutive semesters</div>
                            </div>
                        </div>
                        <div style="display: flex; align-items: center; gap: 1rem;">
                            <div style="width: 40px; height: 40px; border-radius: 50%; background: rgba(139, 92, 246, 0.1); display: flex; align-items: center; justify-content: center; color: var(--primary);">
                                <i class="fas fa-user-graduate"></i>
                            </div>
                            <div>
                                <div style="font-weight: 600;">Student Engagement</div>
                                <div style="font-size: 0.85rem; color: var(--text-muted);">Above 90% participation rate</div>
                            </div>
                        </div>
                        <div style="display: flex; align-items: center; gap: 1rem;">
                            <div style="width: 40px; height: 40px; border-radius: 50%; background: rgba(245, 158, 11, 0.1); display: flex; align-items: center; justify-content: center; color: #f59e0b;">
                                <i class="fas fa-lightbulb"></i>
                            </div>
                            <div>
                                <div style="font-weight: 600;">Innovation Leader</div>
                                <div style="font-size: 0.85rem; color: var(--text-muted);">Pioneered new teaching methodologies</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="glass fade-up" style="animation-delay: 0.6s; margin-top: 2rem;">
            <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border);">
                <h2 style="font-size: 1.5rem;">Course Performance Breakdown</h2>
            </div>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Course</th>
                            <th>Students</th>
                            <th>Avg Rating</th>
                            <th>Response Rate</th>
                            <th>Feedback Count</th>
                            <th>Trend</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td>
                                    <div>
                                        <div style="font-weight: 600;">${course.code}</div>
                                        <div style="font-size: 0.85rem; color: var(--text-muted);">${course.name}</div>
                                    </div>
                                </td>
                                <td>45</td>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                                        <span style="font-weight: 600;">4.9</span>
                                        <div style="color: #10b981;">★★★★★</div>
                                    </div>
                                </td>
                                <td>
                                    <span style="color: #10b981; font-weight: 600;">92%</span>
                                </td>
                                <td>41</td>
                                <td>
                                    <span style="color: #10b981; font-weight: 600;">↑ +0.2</span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
