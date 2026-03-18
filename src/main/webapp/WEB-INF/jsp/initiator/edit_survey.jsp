<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Survey | RP Initiator</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body class="page-enter">
    <nav>
        <a href="<c:url value='/'/>" class="logo-container">
            <i class="fas fa-clipboard-list"></i>
            <div>
                 <span style="font-size: 1.3rem;">RP</span> SURVEY
            </div>
        </a>
        <div class="nav-links">
            <a href="<c:url value='/initiator/dashboard'/>">My Surveys</a>
            <a href="<c:url value='/initiator/results'/>">Advanced Reports</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">Survey Management</span>
                <h1 style="margin-top: 0.5rem;">Edit Survey</h1>
                <p style="color: var(--text-muted);">Update survey details and configuration.</p>
            </div>
        </div>

        <div class="glass fade-up">
            <h2 style="padding: 2rem; border-bottom: 1px solid var(--glass-border);">Survey Information</h2>
            <div style="padding: 2rem;">
                <form action="<c:url value='/initiator/surveys/update/${survey.id}'/>" method="post">
                    <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem;">
                        <div class="form-group">
                            <label>Survey Title</label>
                            <input type="text" name="title" value="${survey.title}" required>
                        </div>
                        <div class="form-group">
                            <label>Course</label>
                            <select name="course.id" required>
                                <c:forEach var="course" items="${courses}">
                                    <option value="${course.id}" ${survey.course.id == course.id ? 'selected' : ''}>${course.code} - ${course.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group" style="grid-column: span 2;">
                            <label>Description</label>
                            <input type="text" name="description" value="${survey.description}" required>
                        </div>
                        <div class="form-group">
                            <label>Access Type</label>
                            <select name="accessType" required>
                                <option value="GUEST" ${survey.accessType == 'GUEST' ? 'selected' : ''}>Guest Access</option>
                                <option value="REGISTERED" ${survey.accessType == 'REGISTERED' ? 'selected' : ''}>Registered Users Only</option>
                                <option value="PRIVATE" ${survey.accessType == 'PRIVATE' ? 'selected' : ''}>Private (Invite Only)</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label style="display: flex; align-items: center; gap: 0.5rem;">
                                <input type="checkbox" name="active" ${survey.active ? 'checked' : ''} style="width: auto;">
                                <span>Active Status</span>
                            </label>
                        </div>
                    </div>
                    
                    <div style="margin-top: 3rem; display: flex; gap: 1rem; justify-content: flex-end;">
                        <a href="<c:url value='/initiator/dashboard'/>" class="btn btn-secondary">
                            <i class="fas fa-times"></i> Cancel
                        </a>
                        <button type="submit" class="btn btn-primary">
                            <i class="fas fa-save"></i> Update Survey
                        </button>
                    </div>
                </form>
            </div>
        </div>

        <div class="glass fade-up" style="margin-top: 2rem;">
            <div style="padding: 2rem; border-bottom: 1px solid var(--glass-border); display: flex; justify-content: space-between; align-items: center;">
                <h2>Danger Zone</h2>
                <span class="role-badge" style="background: rgba(239, 68, 68, 0.1); color: #ef4444;">IRREVERSIBLE</span>
            </div>
            <div style="padding: 2rem;">
                <div style="display: flex; align-items: center; gap: 2rem;">
                    <div style="flex: 1;">
                        <h3 style="color: #ef4444; margin-bottom: 0.5rem;">Delete Survey</h3>
                        <p style="color: var(--text-muted); font-size: 0.9rem;">Once you delete a survey, all associated responses will be permanently removed. This action cannot be undone.</p>
                    </div>
                    <form action="<c:url value='/initiator/surveys/delete/${survey.id}'/>" method="post" style="display: inline;">
                        <button type="submit" class="btn" style="background: #ef4444; color: white;" onclick="return confirm('Are you sure you want to delete this survey and all its responses? This action cannot be undone.')">
                            <i class="fas fa-trash"></i> Delete Survey
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
