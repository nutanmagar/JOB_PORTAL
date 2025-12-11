CREATE DATABASE JOB_PORTAL;
USE JOB_PORTAL;

-- 1. Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('job_seeker', 'employer') NOT NULL,
    contact_number VARCHAR(15) NOT NULL
);

INSERT INTO Users (name, email, password, role, contact_number)
VALUES
('Rajesh Kumar', 'rajesh@example.com', 'hashed_password1', 'job_seeker', '9876543210'),
('Ananya Sharma', 'ananya@example.com', 'hashed_password2', 'job_seeker', '9123456789'),
('Vikas Patel', 'vikas@example.com', 'hashed_password3', 'employer', '9988776655'),
('Priya Singh', 'priya@example.com', 'hashed_password4', 'job_seeker', '8765432109'),
('Arvind Joshi', 'arvind@example.com', 'hashed_password5', 'employer', '9345678901'),
('Neha Mehta', 'neha@example.com', 'hashed_password6', 'job_seeker', '9134567890'),
('Amit Shah', 'amit@example.com', 'hashed_password7', 'employer', '9812345678'),
('Kunal Desai', 'kunal@example.com', 'hashed_password8', 'job_seeker', '9988123412'),
('Sneha Kapoor', 'sneha@example.com', 'hashed_password9', 'job_seeker', '9122345567'),
('Ramesh Yadav', 'ramesh@example.com', 'hashed_password10', 'employer', '9356789012'),
('Simran Verma', 'simran@example.com', 'hashed_password11', 'job_seeker', '9874501236'),
('Pooja Jain', 'pooja@example.com', 'hashed_password12', 'job_seeker', '9998765432'),
('Manish Gupta', 'manish@example.com', 'hashed_password13', 'employer', '9823456701'),
('Deepika Reddy', 'deepika@example.com', 'hashed_password14', 'job_seeker', '9812349001'),
('Siddharth Chatterjee', 'siddharth@example.com', 'hashed_password15', 'employer', '9988776611'),
('Megha Naik', 'megha@example.com', 'hashed_password16', 'job_seeker', '9145678990'),
('Rohit Shetty', 'rohit@example.com', 'hashed_password17', 'job_seeker', '9182345672'),
('Tina Basu', 'tina@example.com', 'hashed_password18', 'job_seeker', '9812456790'),
('Arun Nair', 'arun@example.com', 'hashed_password19', 'employer', '9908765432'),
('Akash Jain', 'akash@example.com', 'hashed_password20', 'job_seeker', '9098776655');

SELECT * FROM Users;

-- 2. Company Table
CREATE TABLE Company (
    company_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    description TEXT,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Inserting sample company names
INSERT INTO Company (name, location, description, user_id)
VALUES
('Tech Innovators Pvt. Ltd.', 'Bengaluru', 'A leading tech company', 3),
('HealthCorp India', 'Delhi', 'Healthcare solutions company', 5),
('FinSecure Solutions', 'Mumbai', 'Finance and insurance services', 7),
('EduTech Learnings', 'Hyderabad', 'Online education platform', 11),
('LogiTrack Systems', 'Chennai', 'Logistics and tracking solutions', 13),
('Foodies Delight Pvt. Ltd.', 'Pune', 'Food delivery and dining solutions', 19);

SELECT * FROM Company;

-- 3. Jobs Table
CREATE TABLE Jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    posted_date DATE NOT NULL,
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES Company(company_id)
);

-- Inserting sample job postings 
INSERT INTO Jobs (title, description, location, salary, posted_date, company_id)
VALUES 
('Software Engineer', 'Develop innovative software solutions.', 'Bengaluru', 800000.00, '2024-12-15', 1),
('Data Scientist', 'Analyze and interpret complex data sets.', 'Bengaluru', 950000.00, '2024-12-10', 1),
('Nurse Practitioner', 'Provide patient care in healthcare facilities.', 'Delhi', 700000.00, '2024-12-01', 2),
('HR Manager', 'Manage recruitment and employee relations.', 'Delhi', 850000.00, '2024-12-05', 2),
('Full Stack Developer', 'Build end-to-end web applications.', 'Mumbai', 600000.00, '2024-12-08', 3),
('Digital Marketing Specialist', 'Drive online marketing campaigns.', 'Mumbai', 500000.00, '2024-12-09', 3),
('Content Writer', 'Create engaging and informative content.', 'Chennai', 400000.00, '2024-12-07', 4),
('UI/UX Designer', 'Design user-friendly interfaces.', 'Chennai', 450000.00, '2024-12-06', 4);

SELECT * FROM Jobs;

-- 4. Applications Table
CREATE TABLE Applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    job_id INT,
    applied_date DATE NOT NULL,
    status ENUM('pending', 'accepted', 'rejected') NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (job_id) REFERENCES Jobs(job_id)
);

-- Inserting sample application values
INSERT INTO Applications (user_id, job_id, applied_date, status)
VALUES 
(1, 1, '2024-12-16', 'pending'),
(2, 2, '2024-12-17', 'pending'),
(4, 3, '2024-12-18', 'pending'),
(6, 4, '2024-12-19', 'pending'),
(7, 5, '2024-12-15', 'accepted'),
(9, 6, '2024-12-14', 'pending'),
(10, 7, '2024-12-13', 'rejected'),
(11, 8, '2024-12-12', 'pending'),
(12, 5, '2024-12-11', 'accepted'),
(13, 3, '2024-12-10', 'pending'),
(14, 2, '2024-12-09', 'rejected'),
(15, 1, '2024-12-08', 'pending'),
(8, 6, '2024-12-07', 'accepted'),
(3, 4, '2024-12-06', 'pending'),
(5, 7, '2024-12-05', 'rejected');

SELECT * FROM Applications;

-- 5. Job Seeker Profile Table
CREATE TABLE Job_Seeker_Profile (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    resume TEXT,
    skills VARCHAR(255),
    experience VARCHAR(255),
    education VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Inserting job seeker profiles
INSERT INTO Job_Seeker_Profile (user_id, resume, skills, experience, education)
VALUES 
(1, 'Resume of Rajesh Kumar', 'Java, SQL, Python', '2 years in software development', 'Bachelors in Computer Science'),
(2, 'Resume of Ananya Sharma', 'Data Analysis, Python, Machine Learning', '1 year in data science', 'Bachelors in Statistics'),
(4, 'Resume of Priya Singh', 'Nursing, Patient Care', '3 years in healthcare', 'Masters in Nursing'),
(6, 'Resume of Neha Mehta', 'HTML, CSS, JavaScript', '1.5 years in web development', 'Bachelors in Information Technology'),
(8, 'Resume of Kunal Desai', 'React, Node.js, MongoDB', '2 years as a full-stack developer', 'Masters in Computer Applications'),
(9, 'Resume of Sneha Kapoor', 'UI/UX Design, Figma, Photoshop', '3 years in UI/UX design', 'Bachelors in Graphic Design'),
(11, 'Resume of Simran Verma', 'Digital Marketing, SEO, Content Strategy', '2 years in digital marketing', 'Bachelors in Business Administration'),
(12, 'Resume of Pooja Jain', 'Customer Support, Problem-Solving', '4 years in customer service', 'Bachelors in Arts'),
(14, 'Resume of Deepika Reddy', 'Project Management, Agile Methodologies', '6 years as a project manager', 'MBA in Project Management'),
(16, 'Resume of Megha Naik', 'Sales, Negotiation, Client Management', '3 years in sales', 'Bachelors in Business Administration'),
(17, 'Resume of Rohit Shetty', 'DevOps, Cloud Computing, Kubernetes', '2 years in cloud solutions', 'Bachelors in Information Systems'),
(18, 'Resume of Tina Basu', 'Creative Writing, Content Development', '1.5 years as a freelance writer', 'Bachelors in English Literature');

SELECT * FROM Job_Seeker_profile;

-- 6. Job Seeker Job Preferences Table
CREATE TABLE Job_Seeker_Preferences (
    preference_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    preferred_location VARCHAR(100),
    preferred_salary DECIMAL(10,2),
    job_type ENUM('full-time', 'part-time', 'contract'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

-- Inserting job seeker preferences 
INSERT INTO Job_Seeker_Preferences (user_id, preferred_location, preferred_salary, job_type)
VALUES 
(1, 'Bengaluru', 900000.00, 'full-time'),
(2, 'Hyderabad', 850000.00, 'full-time'),
(4, 'Delhi', 750000.00, 'part-time'),
(6, 'Bengaluru', 800000.00, 'full-time'),
(8, 'Mumbai', 850000.00, 'full-time'),
(9, 'Pune', 600000.00, 'part-time'),
(11, 'Chennai', 700000.00, 'full-time'),
(12, 'Mumbai', 550000.00, 'part-time'),
(17, 'Hyderabad', 850000.00, 'full-time'),
(18, 'Kolkata', 500000.00, 'part-time');

SELECT * FROM Job_Seeker_Preferences;



-- 1. Find the Most Popular Job Locations
SELECT location, COUNT(*) AS job_count
FROM Jobs
GROUP BY location
ORDER BY job_count DESC
LIMIT 5;

-- 2. Identify the Top 5 Most Applied Jobs
SELECT j.title, COUNT(a.application_id) AS application_count
FROM Applications a
JOIN Jobs j ON a.job_id = j.job_id
GROUP BY j.title
ORDER BY application_count DESC
LIMIT 5;

-- 3. Count of Jobs Posted by Each Company
SELECT c.name AS company_name, COUNT(j.job_id) AS job_count
FROM Company c
JOIN Jobs j ON c.company_id = j.company_id
GROUP BY c.name
ORDER BY job_count DESC;

-- 4. Average Salary Offered by Location
SELECT location, AVG(salary) AS average_salary
FROM Jobs
GROUP BY location
ORDER BY average_salary DESC;

-- 5. Job Seeker Skills Demand
SELECT j.title, COUNT(*) AS applications_count
FROM Applications a
JOIN Jobs j ON a.job_id = j.job_id
GROUP BY j.title
ORDER BY applications_count DESC;

-- 6. Ratio of Job Seekers to Job Openings
SELECT 
    (SELECT COUNT(*) FROM Job_Seeker_Profile) AS total_job_seekers,
    (SELECT COUNT(*) FROM Jobs) AS total_job_openings,
    ROUND((SELECT COUNT(*) FROM Job_Seeker_Profile) * 1.0 / (SELECT COUNT(*) FROM Jobs), 2) AS seeker_to_opening_ratio;

-- 7. Average Applications Per Job
SELECT AVG(app_count) AS avg_applications_per_job
FROM (
    SELECT job_id, COUNT(*) AS app_count
    FROM Applications
    GROUP BY job_id
);

-- 8. Identify Companies with the Most Applicants
SELECT c.name AS company_name, COUNT(a.application_id) AS total_applications
FROM Applications a
JOIN Jobs j ON a.job_id = j.job_id
JOIN Company c ON j.company_id = c.company_id
GROUP BY c.name
ORDER BY total_applications DESC;

-- 9. Applications Status Breakdown
SELECT status, COUNT(*) AS count
FROM Applications
GROUP BY status
ORDER BY count DESC;

-- 10. Preferred Job Types Among Job Seekers
SELECT job_type, COUNT(*) AS count
FROM Job_Seeker_Preferences
GROUP BY job_type
ORDER BY count DESC;

-- 11. Identify Most Desired Locations by Job Seekers
SELECT preferred_location, COUNT(*) AS preference_count
FROM Job_Seeker_Preferences
GROUP BY preferred_location
ORDER BY preference_count DESC;

-- 12. Jobs with the Highest Salary Range
SELECT title, location, salary
FROM Jobs
ORDER BY salary DESC
LIMIT 5;
