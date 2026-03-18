<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Survey Design Center | RP Evaluation</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .survey-card {
            transition: 0.3s;
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }
        .survey-card:hover {
            transform: translateY(-5px);
            border-color: var(--primary);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }
        .access-tag {
            position: absolute;
            top: 2rem;
            right: 2rem;
            font-size: 0.7rem;
            font-weight: 800;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            background: rgba(139, 92, 246, 0.1);
            color: var(--primary);
            border: 1px solid rgba(139, 92, 246, 0.2);
        }
        .hidden { display: none; }
    </style>
</head>
<body class="page-enter">
    <nav>
        <a href="<c:url value='/'/>" class="logo-container">
            <i class="fas fa-chart-line"></i>
            <div>
                 <span style="font-size: 1.3rem;">RP</span> EVAL
            </div>
        </a>
        <div class="nav-links">
            <a href="<c:url value='/initiator/dashboard'/>" class="active">My Surveys</a>
            <a href="<c:url value='/initiator/results'/>">Advanced Reports</a>
            <a href="<c:url value='/logout'/>" class="btn btn-secondary" style="padding: 0.5rem 1rem;">
                <i class="fas fa-sign-out-alt"></i> Sign Out
            </a>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <span class="role-badge">Department Initiator</span>
                <h1 style="margin-top: 0.5rem;">Academic Evaluation Portal</h1>
                <p style="color: var(--text-muted);">Design and deploy high-impact survey instruments for the RP faculty.</p>
            </div>
            <button class="btn btn-primary" onclick="document.getElementById('newSurveyForm').classList.toggle('hidden')">
                <i class="fas fa-plus"></i> Design New Survey
            </button>
        </div>

        <div id="newSurveyForm" class="glass hidden fade-up" style="margin-bottom: 4rem; padding: 3rem; border-left: 4px solid var(--primary);">
            <div style="display: flex; align-items: center; gap: 1rem; margin-bottom: 2rem;">
                <div style="width: 40px; height: 40px; border-radius: 12px; background: rgba(139, 92, 246, 0.1); display: flex; align-items: center; justify-content: center; color: var(--primary);">
                    <i class="fas fa-pen-nib"></i>
                </div>
                <h2>Instrument Configuration</h2>
            </div>
            
            <form action="<c:url value='/initiator/surveys/create'/>" method="post">
                <div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 2rem;">
                    <div class="form-group" style="grid-column: span 2;">
                        <label>Instrument Title</label>
                        <input type="text" name="title" placeholder="End-term Pedagogical Review 2026" required>
                    </div>
                    
                    <div class="form-group">
                        <label>Departmental Course</label>
                        <div class="input-icon-wrapper">
                             <i class="fas fa-book-reader input-icon"></i>
                            <select name="courseId" required style="padding-left: 3rem;">
                                <c:forEach var="course" items="${courses}">
                                    <option value="${course.id}">${course.code} | ${course.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Security & Authentication Policy</label>
                        <div class="input-icon-wrapper">
                            <i class="fas fa-user-lock input-icon"></i>
                            <select name="accessType" style="padding-left: 3rem;">
                                <option value="GUEST">Open Enrollment (Authenticated or Anonymous)</option>
                                <option value="AUTHENTICATED">Strictly Institutional (Students Only)</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group" style="grid-column: span 2;">
                        <label>Professional Description</label>
                        <input type="text" name="description" placeholder="A brief description of this evaluation goals and scope..." required>
                    </div>
                </div>

                <div style="margin-top: 2rem; display: flex; gap: 1rem; justify-content: flex-end;">
                     <button type="button" class="btn btn-secondary" onclick="document.getElementById('newSurveyForm').classList.add('hidden')">Discard Draft</button>
                     <button type="submit" class="btn btn-primary">
                        <i class="fas fa-magic"></i> Continue to Builder
                     </button>
                </div>
            </form>
        </div>

        <h2 style="margin-bottom: 2.5rem; display: flex; align-items: center; gap: 1rem;">
             Your Active Evaluations
             <span class="role-badge" style="background: rgba(139, 92, 246, 0.1); font-size: 0.7rem; font-weight: 800;">${surveys.size()} INSTRUMENTS</span>
        </h2>

        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(380px, 1fr)); gap: 2.5rem;">
            <c:forEach var="survey" items="${surveys}">
                <div class="glass survey-card fade-up">
                    <span class="access-tag">${survey.accessType}</span>
                    <div>
                        <div style="font-size: 0.85rem; color: var(--text-muted); font-weight: 700; margin-bottom: 1rem; display: flex; align-items: center; gap: 0.5rem;">
                             <i class="fas fa-bookmark" style="color: var(--primary);"></i>
                             ${survey.course.code} | INSTRUCTION
                        </div>
                        <h3 style="font-size: 1.5rem; line-height: 1.3; margin-bottom: 1rem;">${survey.title}</h3>
                        <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 2.5rem; line-height: 1.6;">${survey.description}</p>
                    </div>
                    
                    <div style="display: flex; gap: 1rem; border-top: 1px solid var(--glass-border); padding-top: 2rem;">
                        <a href="<c:url value='/initiator/surveys/${survey.id}/edit'/>" class="btn btn-secondary" style="flex: 1; justify-content: center; font-size: 0.9rem;">
                             <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="<c:url value='/initiator/results/${survey.id}'/>" class="btn btn-primary" style="flex: 1; justify-content: center; font-size: 0.9rem;">
                             <i class="fas fa-analytics"></i> Results
                        </a>
                    </div>
                </div>
            </c:forEach>
            
            <c:if test="${empty surveys}">
                <div style="grid-column: 1/-1; text-align: center; padding: 8rem 2rem; background: rgba(15, 23, 42, 0.2); border-radius: 2rem; border: 2px dashed var(--glass-border);">
                     <i class="fas fa-file-invoice" style="font-size: 4rem; color: var(--text-muted); margin-bottom: 2rem; opacity: 0.2;"></i>
                     <h2 style="color: var(--text-muted);">No instruments currently deployed.</h2>
                     <p style="color: var(--text-muted); margin-top: 1rem;">Click "Design New Survey" to create your first evaluation instrument.</p>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
