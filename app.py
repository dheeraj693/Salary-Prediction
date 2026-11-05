import streamlit as st
import pandas as pd
import pickle

# Load Trained Pipeline
with open("lr_model.pkl", "rb") as file:
    model = pickle.load(file)

# Page Configuration
st.set_page_config(
    page_title="Employee Salary Prediction",
    page_icon="💰",
    layout="wide"
)

# Title
st.title("💰 Employee Salary Prediction System")
st.markdown("Predict employee salary using Machine Learning.")

st.divider()

# Create Two Columns
col1, col2 = st.columns(2)

# Left Side Inputs
with col1:

    job_title = st.selectbox(
        "Job Title",
        [
            'AI Engineer',
            'Data Analyst',
            'Frontend Developer',
            'Business Analyst',
            'Product Manager',
            'Backend Developer',
            'Machine Learning Engineer',
            'DevOps Engineer',
            'Software Engineer',
            'Cybersecurity Analyst',
            'Data Scientist',
            'Cloud Engineer'
        ]
    )

    education_level = st.selectbox(
        "Education Level",
        [
            'Bachelor',
            'PhD',
            'High School',
            'Diploma',
            'Master'
        ]
    )

    experience_years = st.slider(
        "Experience Years",
        min_value=0,
        max_value=30,
        value=2
    )

    skills_count = st.number_input(
        "Skills Count",
        min_value=0,
        max_value=50,
        value=5
    )

# Right Side Inputs
with col2:

    industry = st.selectbox(
        "Industry",
        [
            'Healthcare',
            'Telecom',
            'Media',
            'Retail',
            'Manufacturing',
            'Education',
            'Finance',
            'Technology',
            'Consulting',
            'Government'
        ]
    )

    company_size = st.selectbox(
        "Company Size",
        [
            'Medium',
            'Small',
            'Large',
            'Enterprise',
            'Startup'
        ]
    )

    location = st.selectbox(
        "Location",
        [
            'India',
            'Australia',
            'Singapore',
            'Canada',
            'Sweden',
            'USA',
            'Netherlands',
            'Remote',
            'Germany',
            'UK'
        ]
    )

    remote_work = st.selectbox(
        "Remote Work",
        [
            'Hybrid',
            'No',
            'Yes'
        ]
    )

    certifications = st.number_input(
        "Certifications",
        min_value=0,
        max_value=20,
        value=0
    )

st.divider()

# Prediction Button
if st.button("🚀 Predict Salary", use_container_width=True):

    input_df = pd.DataFrame({

        'job_title': [job_title],
        'experience_years': [experience_years],
        'education_level': [education_level],
        'skills_count': [skills_count],
        'industry': [industry],
        'company_size': [company_size],
        'location': [location],
        'remote_work': [remote_work],
        'certifications': [certifications]

    })

    try:

        prediction = model.predict(input_df)

        salary = prediction[0]

        st.success(
            f"💰 Predicted Salary: ₹ {salary:,.2f}"
        )

        st.subheader("Employee Details")

        st.dataframe(
            input_df,
            use_container_width=True
        )

    except Exception as e:

        st.error(f"Prediction Error: {e}")