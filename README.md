Employee Salary Prediction System
Project Overview
This project predicts employee salaries based on professional and demographic factors such as job title, experience, education level, skills, industry, company size, location, remote work status, and certifications.

The project uses Machine Learning and is deployed using Streamlit for an interactive user experience.

Features
Predict employee salary instantly
User-friendly Streamlit web interface
Machine Learning pipeline with preprocessing
One-Hot Encoding for categorical variables
Missing value handling
Scalable and deployment-ready architecture

Dataset Features
Feature	Description
job_title	Employee Job Role
experience_years	Total Years of Experience
education_level	Highest Qualification
skills_count	Number of Skills
industry	Industry Sector
company_size	Organization Size
location	Employee Location
remote_work	Work Mode
certifications	Number of Certifications
salary	Target Variable

Technologies Used
Python
Pandas
NumPy
Scikit-Learn
Streamlit
Pickle

Machine Learning Workflow
Data Cleaning
Exploratory Data Analysis (EDA)
Feature Engineering
Missing Value Treatment
One-Hot Encoding
Data Scaling
Model Training
Salary Prediction
Streamlit Deployment

Project Structure
Employee_Salary_Prediction/
│
├── app.py
├── employee_salary.csv
├── salary_prediction_pipeline.pkl
├── requirements.txt
└── README.md

Installation
Clone the repository:

git clone <repository-url>
Move to project folder:

cd Employee_Salary_Prediction
Install dependencies:

pip install -r requirements.txt
Run the application:

streamlit run app.py
Model Input Features
Job Title
Experience Years
Education Level
Skills Count
Industry
Company Size
Location
Remote Work
Certifications

Objective
To analyze employee data and predict salaries using Machine Learning techniques while identifying the most influential factors affecting compensation.

Author
Dheeraj Kumar
B.Tech Computer Science and Engineering
Aspiring Data Analyst | Data Science Enthusiast