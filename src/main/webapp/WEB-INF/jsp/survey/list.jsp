<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Available Surveys | EVALU8.PRO</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
</head>
<body class="page-enter">
    <div class="bg-blob" style="top: 10%; right: 10%; background: #a855f7;"></div>

    <nav>
        <div class="logo">EVALU8.PRO</div>
        <div class="nav-links">
            <a href="<c:url value='/'/>">Home</a>
            <a href="<c:url value='/survey/list'/>">Active Surveys</a>
            <c:choose>
                <c:when test="${pageContext.request.userPrincipal != null}">
                    <a href="<c:url value='/dashboard'/>" class="btn btn-primary">My Dashboard</a>
                </c:when>
                <c:otherwise>
                    <a href="<c:url value='/login'/>" class="btn btn-secondary">Sign In</a>
                </c:otherwise>
            </c:choose>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="header-row">
            <div>
                <h1>Current Evaluation Cycles</h1>
                <p style="color: var(--text-secondary);">Your feedback helps us evolve. Check available surveys below.</p>
            </div>
            <c:if test="${param.submitted == 'true'}">
                <div style="background: rgba(16, 185, 129, 0.1); color: #10b981; padding: 1rem 2rem; border-radius: 12px; border: 1px solid rgba(16, 185, 129, 0.2);">
                    Response submitted successfully! Thank you.
                </div>
            </c:if>
        </div>

        <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(320px, 1fr)); gap: 2rem;">
            <c:forEach var="survey" items="${surveys}">
                <div class="glass" style="padding: 2.5rem; transition: 0.3s; transform-origin: center;">
                    <div style="display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 1.5rem;">
                        <span style="background: rgba(99, 102, 241, 0.1); color: var(--primary); padding: 0.3rem 0.8rem; border-radius: 20px; font-size: 0.75rem; font-weight: 700;">
                            ${survey.course.code}
                        </span>
                        <c:if test="${survey.accessType == 'AUTHENTICATED'}">
                            <span title="Authentication Required" style="font-size: 1.2rem;">🔒</span>
                        </c:if>
                    </div>
                    
                    <h3 style="margin-bottom: 0.75rem; font-size: 1.4rem;">${survey.title}</h3>
                    <p style="color: var(--text-secondary); font-size: 0.9rem; line-height: 1.6; margin-bottom: 2.5rem; min-height: 3.5rem;">
                        ${survey.description}
                    </p>

                    <a href="<c:url value='/survey/respond/${survey.id}'/>" class="btn btn-primary" style="width: 100%; justify-content: center; padding: 1rem;">
                        Begin Survey
                    </a>
                </div>
            </c:forEach>
            <c:if test="${empty surveys}">
                <div class="glass" style="grid-column: 1/-1; padding: 5rem; text-align: center; color: var(--text-secondary);">
                    <div style="font-size: 3rem; margin-bottom: 1rem;">🔍</div>
                    <p>No surveys are currently active. Please check back later.</p>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>
