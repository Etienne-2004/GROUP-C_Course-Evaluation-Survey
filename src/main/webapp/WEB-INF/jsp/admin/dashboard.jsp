<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enterprise Control Center | RP Evaluation</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="page-enter">
    <nav>
        <a href="<c:url value='/'/>" class="logo-container">
            <i class="fas fa-graduation-cap"></i>
            <div>
                 <span style="font-size: 1.3rem;">RP</span> ADMIN
            </div>
        </a>
        <div class="nav-links">
            <a href="<c:url value='/admin/dashboard'/>" class="active">Overview</a>
            <a href="<c:url value='/admin/courses'/>">Manage Courses</a>
            <a href="<c:url value='/admin/users'/>">Staff Portal</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">System Administrator</span>
                <h1 style="margin-top: 0.5rem;">Command Center Overview</h1>
                <p style="color: var(--text-muted);">Real-time metrics and institutional management for Rwanda Polytechnic.</p>
            </div>
            <div style="display: flex; gap: 1rem;">
                <div class="glass" style="padding: 0.75rem 1.5rem; display: flex; align-items: center; gap: 0.8rem;">
                    <div style="width: 10px; height: 10px; border-radius: 50%; background: #10b981; box-shadow: 0 0 10px #10b981;"></div>
                    <span style="font-weight: 700; font-size: 0.85rem;">SYSTEM STATUS: <c:out value="${systemHealth}"/></span>
                </div>
                <a href="#addCourse" class="btn btn-primary">
                    <i class="fas fa-plus"></i> New Course
                </a>
            </div>
        </div>

        <div class="stat-grid">
            <div class="glass stat-card fade-up">
                <i class="fas fa-user-clock"></i>
                <span class="stat-label">Pending Approvals</span>
                <div class="stat-value"><c:out value="${pendingApprovals}"/></div>
                <div class="stat-trend" style="color: #ef4444;">
                    <i class="fas fa-exclamation-circle"></i> Requires attention
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.1s;">
                <i class="fas fa-book-open"></i>
                <span class="stat-label">Active Courses</span>
                <div class="stat-value"><c:out value="${totalCourses}"/></div>
                <div class="stat-trend" style="color: var(--primary);">
                    <i class="fas fa-check-circle"></i> Syncing with Registrar
                </div>
            </div>
            <div class="glass stat-card fade-up" style="animation-delay: 0.2s;">
                <i class="fas fa-users"></i>
                <span class="stat-label">Verified Staff</span>
                <div class="stat-value"><c:out value="${totalTeachers}"/></div>
                <div class="stat-trend" style="color: #10b981;">
                    <i class="fas fa-arrow-up"></i> +4 this term
                </div>
            </div>
        </div>

        <div style="display: grid; grid-template-columns: 1.5fr 1fr; gap: 2rem;">
            <div class="glass fade-up" style="animation-delay: 0.3s; padding: 0;">
                <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border); display: flex; justify-content: space-between; align-items: center;">
                    <h2 style="font-size: 1.5rem;">Staff Enrollment Requests</h2>
                    <span class="role-badge" style="background: rgba(239, 68, 68, 0.1); color: #ef4444;">ACTION REQUIRED</span>
                </div>
                <div style="overflow-x: auto;">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="teacher" items="${pendingTeachers}">
                                <tr>
                                    <td>
                                        <div style="display: flex; align-items: center; gap: 0.8rem;">
                                            <div style="width: 32px; height: 32px; border-radius: 50%; background: var(--grad-main); display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.8rem;">${teacher.fullName.substring(0,1)}</div>
                                            <span style="font-weight: 600;"><c:out value="${teacher.fullName}"/></span>
                                        </div>
                                    </td>
                                    <td><c:out value="${teacher.email}"/></td>
                                    <td><span style="color: #f59e0b; font-weight: 700; font-size: 0.75rem;">PENDING</span></td>
                                    <td>
                                        <form action="<c:url value='/admin/teachers/approve/${teacher.id}'/>" method="post" style="display:inline;">
                                            <button type="submit" class="btn btn-primary" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;">Approve</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty pendingTeachers}">
                                <tr>
                                    <td colspan="4" style="text-align: center; color: var(--text-muted); padding: 4rem;">
                                        <i class="fas fa-check-circle" style="font-size: 2rem; display: block; margin-bottom: 1rem; opacity: 0.3;"></i>
                                        All enrollment requests processed.
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="glass fade-up" style="animation-delay: 0.4s; padding: 0;">
                 <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border);">
                    <h2 style="font-size: 1.5rem;">Quick Course Setup</h2>
                </div>
                <div style="padding: 2rem;">
                    <form action="<c:url value='/admin/courses/add'/>" method="post">
                        <div class="form-group">
                            <label>Course Code</label>
                            <input type="text" name="code" placeholder="e.g. ITT301" required>
                        </div>
                        <div class="form-group">
                            <label>Course Name</label>
                            <input type="text" name="name" placeholder="Software Engineering" required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <input type="text" name="description" placeholder="Advanced pedagogy..." required>
                        </div>
                        <button type="submit" class="btn btn-primary" style="width: 100%; justify-content: center; margin-top: 1rem;">
                            <i class="fas fa-save"></i> Register Course
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
