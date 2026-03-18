
Course Evaluation Survey Web Application Assignment
Completion requirements
To do: Receive a grade To do: Receive a passing grade
Opened: Thursday, 12 March 2026, 8:00 PM
Due: Wednesday, 18 March 2026, 11:59 PM
1. Scenario
At the end of each academic term, institutions often collect feedback from students and other participants to evaluate the quality of courses and teaching. This feedback helps improve teaching methods, course content, and overall learning experience.

To simplify this process, the institution plans to develop a web-based Course Evaluation Survey System. The system will allow authorized users to create surveys associated with specific courses and allow participants to submit feedback.

The system will involve several roles:

Administrator manages the platform, courses, and teacher approvals.

Survey Initiator designs and publishes surveys for course evaluations.

Teachers are linked to courses and ensure that students complete the surveys related to their courses.

Respondents (students or guests) answer the surveys.

Surveys will consist of questions and predefined options, and responses will be stored in a MySQL database. The system will also support optional authentication for respondents, depending on how the survey initiator configures the survey.

Your task is to design and implement this system using Spring MVC, JSP, JSTL, and MySQL.

2. Users and Their Roles
2.1 Administrator
The Administrator manages the overall system.

Responsibilities include:

Approving or rejecting teacher registrations.

Creating and managing courses.

Assigning teachers to courses.

Viewing surveys created in the system.

Managing system users.

The administrator ensures that only approved teachers can access the system.

2.2 Survey Initiator
The Survey Initiator is responsible for designing evaluation surveys.

Responsibilities include:

Creating surveys linked to specific courses.

Creating survey questions.

Defining options for each question.

Setting survey access rules (authenticated users or guests allowed).

Editing or deleting surveys they created.

Viewing survey results.

The survey initiator defines what questions respondents will answer.

2.3 Teacher
Teachers are associated with courses and interact with the surveys related to those courses.

Responsibilities include:

Registering themselves in the system.

Waiting for administrator approval before accessing the system.

Viewing surveys created for the courses they teach.

Informing or instructing students to complete the surveys.

Monitoring the participation of respondents.

Viewing results of surveys related to their courses.

Teachers do not create surveys. They only use existing surveys related to their assigned courses.

2.4 Respondents (Students or Guests)
Respondents are users who answer the surveys.

They can:

View available surveys.

Select and respond to surveys.

Submit answers to survey questions.

Depending on survey configuration:

Respondents may be required to log in (students).

Respondents may participate as guests by providing an email address.

If an email is provided or an account is used, the system should send a confirmation or feedback message to the respondent's email.

3. Functional Requirements
ID	Functional Requirement	Description
FR1	Teacher Registration	Teachers must be able to register in the system.
FR2	Teacher Approval	The administrator must approve teachers before they can use the system.
FR3	Course Management	The administrator must be able to add, update, view, and delete courses.
FR4	Teacher Assignment	The administrator must assign teachers to courses.
FR5	Survey Creation	The survey initiator must create surveys linked to specific courses.
FR6	Survey Questions	The survey initiator must add questions to a survey.
FR7	Survey Options	Each survey question must contain multiple answer options.
FR8	Survey Access Settings	The survey initiator must define whether respondents need accounts or can participate as guests.
FR9	View Surveys	Teachers and respondents must be able to view available surveys.
FR10	Respond to Survey	Respondents must be able to answer survey questions and submit responses.
FR11	Email Confirmation	If authentication or email is required, the system must send confirmation to the respondent’s email.
FR12	Survey Results	Survey initiators and teachers must be able to view the results of surveys.
FR13	Survey Editing	Survey initiators must be able to edit their surveys.
FR14	Survey Deletion	Survey initiators must be able to delete surveys they created.
FR15	Teacher Dashboard	Teachers should see surveys related to their courses.
FR16	Initiator Dashboard	Survey initiators should see surveys they created.
4. Database Design Requirement
You must design a relational database schema.

The database should include tables similar to:

Users

Roles

Courses

Teachers

Surveys

Survey Questions

Survey Options

Survey Responses

Respondents

5. Deliverables
You must submit the following:

Public GitHub Repository Link

A link to a public GitHub repository containing the complete source code of the project.

The repository should include all project files, configuration files, and the database script.

YouTube Presentation Video

A YouTube link to a presentation video explaining the project.

The video should not exceed 4 minutes.

The presentation should briefly demonstrate:

The main features of the system

Key components of the implementation

A short walkthrough of the application.

Project Documentation
A well-structured project documentation that includes:

Project overview and scenario

Description of user roles and system functionalities

System architecture (Spring MVC structure)

Database design and ERD

Explanation of key modules and features

Screenshots of the implemented system. hello this examination instruction youre required to finalize to be ranked 1 in class as you see is pure java with pure spring boot now start by setting up system into pure spring boot as required finalize whole project to competent just take ii as yours before we will import after .sql after conducting all required configuration and sql must have atleas 8 records in each for testing and must be connected to frontend as smoothly working project now finalize
