<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Staff Management | RP Admin</title>
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
            <a href="<c:url value='/admin/dashboard'/>">Overview</a>
            <a href="<c:url value='/admin/courses'/>">Manage Courses</a>
            <a href="<c:url value='/admin/users'/>" class="active">Staff Portal</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">Staff Management</span>
                <h1 style="margin-top: 0.5rem;">Faculty Portal</h1>
                <p style="color: var(--text-muted);">Approve teacher registrations and manage academic staff assignments.</p>
            </div>
        </div>

        <div class="glass fade-up" style="margin-bottom: 3rem;">
            <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border); display: flex; justify-content: space-between; align-items: center;">
                <h2>Pending User Approvals</h2>
                <span class="role-badge" style="background: rgba(239, 68, 68, 0.1); color: #ef4444;">${pendingUsers.size()} PENDING</span>
            </div>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>User Name</th>
                            <th>Email</th>
                            <th>Role</th>
                            <th>Registration Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${pendingUsers}">
                            <tr>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 0.8rem;">
                                        <div style="width: 32px; height: 32px; border-radius: 50%; background: var(--grad-main); display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.8rem;">${user.fullName.substring(0,1)}</div>
                                        <span style="font-weight: 600;">${user.fullName}</span>
                                    </div>
                                </td>
                                <td>${user.email}</td>
                                <td>
                                    <span class="role-badge" style="
                                        <c:if test="${user.role.name == 'TEACHER'}">background: rgba(251, 146, 60, 0.1); color: #fb923c;</c:if>
                                        <c:if test="${user.role.name == 'INITIATOR'}">background: rgba(147, 51, 234, 0.1); color: #9333ea;</c:if>
                                        <c:if test="${user.role.name == 'STUDENT'}">background: rgba(34, 197, 94, 0.1); color: #22c55e;</c:if>
                                    ">${user.role.name}</span>
                                </td>
                                <td>${user.registeredAt}</td>
                                <td><span style="color: #f59e0b; font-weight: 700; font-size: 0.75rem;">PENDING</span></td>
                                <td>
                                    <form action="<c:url value='/admin/teachers/approve/${user.id}'/>" method="post" style="display:inline;">
                                        <button type="submit" class="btn btn-primary" style="padding: 0.4rem 0.8rem; font-size: 0.8rem;">
                                            <i class="fas fa-check"></i> Approve
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty pendingTeachers}">
                            <tr>
                                <td colspan="5" style="text-align: center; color: var(--text-muted); padding: 4rem;">
                                    <i class="fas fa-check-circle" style="font-size: 2rem; display: block; margin-bottom: 1rem; opacity: 0.3;"></i>
                                    All teacher registrations have been processed.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="glass fade-up">
            <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border); display: flex; justify-content: space-between; align-items: center;">
                <h2>Approved Faculty Staff</h2>
                <span class="role-badge" style="background: rgba(16, 185, 129, 0.1); color: #10b981;">${teachers.size()} ACTIVE</span>
            </div>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Teacher Name</th>
                            <th>Email</th>
                            <th>Assigned Courses</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="teacher" items="${teachers}">
                            <tr>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 0.8rem;">
                                        <div style="width: 32px; height: 32px; border-radius: 50%; background: var(--grad-main); display: flex; align-items: center; justify-content: center; font-weight: 800; font-size: 0.8rem;">${teacher.fullName.substring(0,1)}</div>
                                        <span style="font-weight: 600;">${teacher.fullName}</span>
                                    </div>
                                </td>
                                <td>${teacher.email}</td>
                                <td>
                                    <c:forEach var="course" items="${teacher.courses}">
                                        <span class="role-badge" style="margin: 0.25rem;">${course.code}</span>
                                    </c:forEach>
                                    <c:if test="${empty teacher.courses}">
                                        <span style="color: var(--text-muted); font-size: 0.85rem;">No courses assigned</span>
                                    </c:if>
                                </td>
                                <td><span style="color: #10b981; font-weight: 700; font-size: 0.75rem;">ACTIVE</span></td>
                                <td>
                                    <a href="<c:url value='/admin/users/edit/${teacher.id}'/>" class="btn btn-secondary" style="padding: 0.4rem 0.8rem; font-size: 0.8rem; margin-right: 0.5rem;">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <form action="<c:url value='/admin/users/delete/${teacher.id}'/>" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this user?')">
                                        <button type="submit" class="btn" style="background: #ef4444; color: white; padding: 0.4rem 0.8rem; font-size: 0.8rem;">
                                            <i class="fas fa-trash"></i> Delete
                                        </button>
                                    </form>
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
