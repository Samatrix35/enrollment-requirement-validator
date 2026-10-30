# Enrollment Requirement Validator

Individual Final Project for PFEBSIT 002 (Weeks 13–18)

A Flutter Web application with a Laravel backend designed to help students and enrollment staff manage, submit, and verify enrollment requirements.

## Project Information

- Student: Sam So
- Selected Project: Project 23 – Enrollment Requirement Validator
- Frontend: Flutter Web
- Backend: Laravel 12
- Database: SQLite (current backend project configuration; update this if you change databases)
- API Testing: Postman
- Development Tools: Visual Studio Code

## What It Does

The Enrollment Requirement Validator helps organize the process of checking student enrollment requirements. Students can view their required documents, mark requirements as submitted, and monitor their completion progress.

The system includes a requirements checklist, missing-requirement detection, and a progress indicator. The Laravel backend provides API endpoints for managing student records and their enrollment requirements.

The system is being developed to support a more organized validation process between students and enrollment staff.

## Current Features and Progress

| Feature | Status |
|---|---|
| Flutter Web project setup | Completed |
| Student ID and name fields | Completed |
| Requirements checklist | Completed |
| Missing requirements detection | Completed |
| Completion progress indicator | Completed |
| Basic input validation | Completed |
| Laravel backend project | Created |
| Database migrations | Completed |
| Student API | Implemented |
| Requirements API | Implemented |
| API testing using Postman | Tested |
| User authentication | Pending |
| Role-based authorization | Pending |
| Automated reminders and retries | Pending |
| Security testing and hardening | Pending |

## Technologies Used

- Flutter and Dart – Frontend development
- Laravel 12 and PHP – Backend API
- SQLite – Current database configuration
- Postman – API testing
- Git and GitHub – Version control and project repository

## API Endpoints

### Students

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/students` | Retrieve all students |
| POST | `/api/students` | Add a student |
| GET | `/api/students/{id}` | Retrieve a specific student |
| PATCH / PUT | `/api/students/{id}` | Update student information |
| DELETE | `/api/students/{id}` | Delete a student |

### Requirements

| Method | Endpoint | Description |
|---|---|---|
| GET | `/api/requirements` | Retrieve all requirements |
| POST | `/api/requirements` | Add a requirement |
| GET | `/api/requirements/{id}` | Retrieve a specific requirement |
| PATCH / PUT | `/api/requirements/{id}` | Update a requirement |
| DELETE | `/api/requirements/{id}` | Delete a requirement |

## Running the Project

### Frontend – Flutter Web

1. Open the `enrollment_requirement_validator` folder in Visual Studio Code.
2. Open the terminal.
3. Run:

   `flutter pub get`

4. Start the application:

   `flutter run -d chrome`

### Backend – Laravel API

1. Open the `enrollment_validator_api` folder in Visual Studio Code.
2. Open the terminal.
3. Install dependencies:

   `composer install`

4. Configure the `.env` file and database connection.
5. Run database migrations:

   `php artisan migrate`

6. Start the Laravel development server:

   `php artisan serve`

7. The API will be available at:

   `http://127.0.0.1:8000`

## API Testing

The backend API was tested using Postman.

Tested operations include:

- Creating a student requirement.
- Retrieving all requirements.
- Retrieving a specific requirement.
- Updating a requirement's status.
- Deleting a requirement.

The tested API responses included successful HTTP status codes such as `200 OK` and `201 Created`.

## User Manual

A separate User Manual will be provided to explain how to operate the system.

It will include step-by-step instructions and screenshots for the major functions, such as:

1. Opening the application.
2. Entering student information.
3. Viewing the requirements checklist.
4. Checking submitted and missing requirements.
5. Monitoring completion progress.
6. Managing student and requirement records through the backend API.

## Weeks and Project Development

| Week | Development Focus | Status |
|---|---|---|
| Week 13 | Automation Foundation | In Progress |
| Week 14 | Secure Integration | Pending |
| Week 15 | Testing and Hardening | Pending |
| Weeks 16–18 | Final integration, evaluation, documentation, and defense | Pending |

## Repository Structure

The repository contains the Flutter frontend and Laravel backend as separate project folders.

- `enrollment_requirement_validator/` – Flutter Web application
- `enrollment_validator_api/` – Laravel backend API

## Project Notes

- This project uses fictional student information for development and testing.
- The frontend and backend are maintained as separate applications.
- Authentication, authorization, automation, and additional security features are still part of the remaining development work.

## Author

Sam So  
BSIT – 3A  
University of La Salette
