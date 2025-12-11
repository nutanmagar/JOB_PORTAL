# JOB_PORTAL

---

# Job Portal SQL Database Project

This project contains a complete SQL-based **Job Portal Database System** designed to manage job seekers, employers, companies, job postings, applications, and job preferences. It includes full schema creation, sample data insertion, and analytical queries for real-world insights.
(Reference SQL file: Job Portal Project.sql)

---

## Key Features

* User management with two roles: **job_seeker** and **employer**
* Company profiles linked with employer accounts
* Job postings with salary, location, and descriptions
* Job application tracking with status updates
* Job-seeker resumes, skills, experience, and education
* Preference tracking for salary, location, and job type
* 12+ analytical queries for business insights

---

## Database Structure

### Tables Included

1. **Users** – Stores user accounts
2. **Company** – Company details mapped to employers
3. **Jobs** – Job listings with metadata
4. **Applications** – Job applications submitted by seekers
5. **Job_Seeker_Profile** – Skills, experience, and education records
6. **Job_Seeker_Preferences** – Preferred salary, location, and job type

Each table includes sample data for testing and demonstration.

---

## Sample Insights Provided Through SQL Queries

* Most popular job locations
* Top 5 most applied jobs
* Average offered salary by location
* Job seekers vs job openings ratio
* Applications status breakdown
* Preferred locations and job types among seekers
* Companies receiving the most applications

---

## How to Use

1. Create the database using:

   ```sql
   CREATE DATABASE JOB_PORTAL;
   USE JOB_PORTAL;
   ```
2. Run the complete SQL script to generate all tables and insert sample data.
3. Execute analytical queries to explore insights.
4. Extend this database for backend integration or academic projects.

---

## Purpose of This Project

This SQL project is designed for:

* Learning relational database design
* Demonstrating CRUD operations and joins
* Practicing analytical SQL
* Using sample data for portfolio or academic assignments
* Integrating into a full-stack Job Portal application


