<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Respond to Survey | EVALU8.PRO</title>
    <link rel="stylesheet" href="<c:url value='/css/index.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@800&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        .survey-container {
            max-width: 800px;
            margin: 4rem auto;
            padding: 0 5%;
        }

        .question-card {
            padding: 3rem 2.5rem;
            margin-bottom: 2rem;
            animation: fadeIn 0.5s ease-out;
            border-left: 4px solid var(--primary);
        }

        .question-text {
            font-size: 1.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
            line-height: 1.4;
        }

        .option-group {
            display: grid;
            gap: 1.25rem;
        }

        .option-label {
            display: flex;
            align-items: center;
            gap: 1.25rem;
            padding: 1.25rem 1.5rem;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid var(--glass-border);
            border-radius: 12px;
            cursor: pointer;
            transition: 0.2s;
            font-size: 1.1rem;
        }

        .option-label:hover {
            background: rgba(255, 255, 255, 0.08);
            border-color: var(--primary);
        }

        .option-label input[type="radio"] {
            width: 1.4rem;
            height: 1.4rem;
            accent-color: var(--primary);
        }

        .guest-auth {
            margin-bottom: 3rem;
            padding: 2.5rem;
            border-left: 4px solid #f59e0b;
        }
    </style>
</head>
<body class="page-enter">
    <div class="bg-blob" style="top: -10%; left: -10%; background: #3b82f6;"></div>

    <nav>
        <div class="logo">EVALU8.PRO</div>
        <div class="nav-links">
            <a href="<c:url value='/survey/list'/>">Back to Surveys</a>
        </div>
    </nav>

    <div class="survey-container">
        <header style="margin-bottom: 4rem; text-align: center;">
            <div style="font-size: 0.9rem; font-weight: 800; color: var(--primary); margin-bottom: 0.5rem; text-transform: uppercase;">
                ${survey.course.code} | EVALUATION
            </div>
            <h1 style="font-size: 2.5rem; margin-bottom: 1rem;">${survey.title}</h1>
            <p style="color: var(--text-secondary); max-width: 600px; margin: 0 auto;">${survey.description}</p>
        </header>

        <form action="<c:url value='/survey/respond/${survey.id}/submit'/>" method="post">
            
            <c:if test="${survey.accessType == 'GUEST' && pageContext.request.userPrincipal == null}">
                <div class="glass guest-auth">
                    <h3>Guest Information</h3>
                    <p style="color: var(--text-secondary); margin-bottom: 1.5rem; font-size: 0.9rem;">Please provide your email to receive a confirmation message.</p>
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="guestEmail" placeholder="your@email.com" required>
                    </div>
                </div>
            </c:if>

            <c:forEach var="question" items="${survey.questions}" varStatus="status">
                <div class="glass question-card">
                    <div style="font-size: 0.85rem; font-weight: 800; color: var(--text-secondary); margin-bottom: 1rem; text-transform: uppercase;">
                        Question ${status.count} of ${survey.questions.size()}
                    </div>
                    <div class="question-text">${question.questionText}</div>
                    
                    <div class="option-group">
                        <c:forEach var="option" items="${question.options}">
                            <label class="option-label">
                                <input type="radio" name="question_${question.id}" value="${option.id}" required>
                                <span>${option.optionText}</span>
                            </label>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>

            <div style="margin-top: 4rem; text-align: center; padding-bottom: 6rem;">
                <button type="submit" class="btn btn-primary" style="padding: 1.25rem 4rem; font-size: 1.15rem; font-weight: 700;">
                    Complete & Submit Evaluation
                </button>
            </div>
        </form>
    </div>
</body>
</html>
