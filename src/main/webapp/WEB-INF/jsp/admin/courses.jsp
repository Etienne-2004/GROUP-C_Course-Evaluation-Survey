<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management | RP Admin</title>
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
            <a href="<c:url value='/admin/courses'/>" class="active">Manage Courses</a>
            <a href="<c:url value='/admin/users'/>">Staff Portal</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">Course Management</span>
                <h1 style="margin-top: 0.5rem;">Academic Programs</h1>
                <p style="color: var(--text-muted);">Manage Rwanda Polytechnic course catalog and assignments.</p>
            </div>
            <button class="btn btn-primary" onclick="document.getElementById('addCourseForm').classList.toggle('hidden')">
                <i class="fas fa-plus"></i> Add New Course
            </button>
        </div>

        <div id="addCourseForm" class="glass hidden fade-up" style="margin-bottom: 4rem; padding: 3rem;">
            <h2 style="margin-bottom: 2rem;">Create New Course</h2>
            <form action="<c:url value='/admin/courses/add'/>" method="post">
                <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem;">
                    <div class="form-group">
                        <label>Course Code</label>
                        <input type="text" name="code" placeholder="e.g. ITT301" required>
                    </div>
                    <div class="form-group">
                        <label>Course Name</label>
                        <input type="text" name="name" placeholder="Software Engineering" required>
                    </div>
                    <div class="form-group" style="grid-column: span 2;">
                        <label>Description</label>
                        <input type="text" name="description" placeholder="Advanced pedagogy..." required>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" style="margin-top: 2rem;">
                    <i class="fas fa-save"></i> Create Course
                </button>
            </form>
        </div>

        <div class="glass fade-up">
            <h2 style="padding: 2rem; border-bottom: 1px solid var(--glass-border);">Course Catalog</h2>
            <div style="overflow-x: auto;">
                <table>
                    <thead>
                        <tr>
                            <th>Course Code</th>
                            <th>Course Name</th>
                            <th>Description</th>
                            <th>Assigned Teachers</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="course" items="${courses}">
                            <tr>
                                <td><strong>${course.code}</strong></td>
                                <td>${course.name}</td>
                                <td>${course.description}</td>
                                <td>
                                    <c:forEach var="teacher" items="${teachers}">
                                        <c:if test="${teacher.courses.contains(course)}">
                                            <span class="role-badge" style="margin: 0.25rem;">${teacher.fullName}</span>
                                        </c:if>
                                    </c:forEach>
                                </td>
                                <td>
                                    <a href="<c:url value='/admin/courses/edit/${course.id}'/>" class="btn btn-secondary" style="padding: 0.4rem 0.8rem; font-size: 0.8rem; margin-right: 0.5rem;">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <form action="<c:url value='/admin/courses/delete/${course.id}'/>" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this course?')">
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
