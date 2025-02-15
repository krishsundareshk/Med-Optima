# -*- coding: utf-8 -*-
"""
Created on Thu Jan 23 16:47:18 2025

@author: asiva
"""
#%%
import requests
import csv
import random
import time

# Load Google API Key
with open('Abhivanth_API.txt', 'r') as file:
    api_key = file.read().strip()

# Sample addresses for users (inside Nungambakkam)
user_addresses = [
    "College Road, Nungambakkam, Chennai",
    "Sterling Road, Nungambakkam, Chennai",
    "Kodambakkam High Road, Nungambakkam, Chennai",
    "Valluvar Kottam High Road, Nungambakkam, Chennai"
]

# Medical department preferences
departments = ["cardiology", "neurology", "orthopedics", "dermatology", "pediatrics", "ENT"]
#%%
import requests
import pandas as pd
import time

API_KEY = api_key
LOCATION = '13.0630,80.2433'  # Latitude and Longitude for Nungambakkam, Chennai
SEARCH_RADIUS = 5000  # in meters (5 km)
DEPARTMENTS = {
    'Multi-Specialty': ['multi-specialty hospital'],
    'Pediatric': ['pediatric hospital', 'children hospital'],
    'ENT': ['ENT hospital', 'ear nose throat hospital'],
    'Orthopedic': ['orthopedic hospital']
}
#%%
import numpy as np
import pandas as pd
import random

# Define hospital names
hospitals = np.array([
    'S V MULTI SPECIALITY HOSPITAL', 'Vadapalani Multi Speciality Hospital', 'Faith Multispeciality Hospital',
    'K.M.Speciality Hospital', 'Bharathi Rajaa Multispecialty Hospital and Research centre',
    'Department of Pediatrics || Apollo Children Hospital Greams Road', "Apollo Children's Hospital Chennai",
    "Department of Paediatric Cardiology Apollo Children's Hospital Chennai", 'Institute Of Child Health and Hospital for Children',
    "Rainbow Children's Hospital & BirthRight, Anna Nagar, Chennai - Best Maternity Hospital", 'KKR ENT HOSPITAL & RESEARCH INSTITUTE',
    'Dheeraj ENT clinic', 'Sinus and Nose Hospital Chennai A Super Speciality ENT & Plastic Surgery Hospital',
    'Ramani Hospital', 'Krishna EYE and ENT Hospitals', 'Department of ENT || Apollo Hospital Greams Road Chennai',
    'M.N. Orthopaedic Hospital', 'Sai Ortho Care Orthopedic Hospital', 'Vasanthi Orthopaedic Hospital Pvt Ltd',
    'Priya Hospitals Orthopaedic Hospital', 'SPOT Hospital'
])

# Define hospital departments
DEPARTMENTS = {
    'Multi-Specialty': ['multi-specialty hospital'],
    'Pediatric': ['pediatric hospital', 'children hospital'],
    'ENT': ['ENT hospital', 'ear nose throat hospital'],
    'Orthopedic': ['orthopedic hospital']
}

# Simulate user data
num_users = 100
num_days = 180
users = [f"User_{i+1}" for i in range(num_users)]

# Assign departments to hospitals
def assign_department(hospital):
    for dept, keywords in DEPARTMENTS.items():
        if any(keyword in hospital.lower() for keyword in keywords):
            return dept
    return 'Multi-Specialty'

hospital_data = pd.DataFrame({
    'Hospital': hospitals,
    'Department': [assign_department(h) for h in hospitals]
})

# User preference parameters
PREFERENCE_PARAMETERS = ['Avg_Waiting_Time', 'Doctor_Availability', 'Rating', 'Distance', 'Num_Reviews']

# Generate user preferences
user_preferences = {user: {
    'Preferred_Department': random.choice(list(DEPARTMENTS.keys())),
    'Preferred_Parameter': random.choice(PREFERENCE_PARAMETERS),
    'Distance_Threshold': random.uniform(2, 10),
    'Waiting_Time_Tolerance': random.uniform(15, 60),
    'Rating_Preference': random.uniform(3, 5)
} for user in users}

# Generate hospital attributes
hospital_attributes = {
    hospital: {
        'Avg_Waiting_Time': random.randint(10, 60),
        'Doctor_Availability': random.choice([0, 1]),
        'Rating': round(random.uniform(3, 5), 1),
        'Distance': round(random.uniform(1, 15), 1),
        'Num_Reviews': random.randint(10, 500)  # Number of reviews added
    } for hospital in hospitals
}

# Normalize inverse metrics (1 - Waiting Time) and (1 - Distance)
def normalize_inverse(value, min_value, max_value):
    return 1 - ((value - min_value) / (max_value - min_value))

# Scoring function with weighted sum
def calculate_score(user_prefs, hospital_attr):
    preferred_param = user_prefs['Preferred_Parameter']
    
    # Weights: The preferred parameter gets 0.4, the rest are distributed evenly
    alpha = {param: 0.15 for param in PREFERENCE_PARAMETERS}
    alpha[preferred_param] = 0.4  # Assign higher weight to preferred parameter

    # Normalize inverse metrics (1 - Waiting Time) and (1 - Distance)
    normalized_waiting = normalize_inverse(hospital_attr['Avg_Waiting_Time'], 10, 60)
    normalized_distance = normalize_inverse(hospital_attr['Distance'], 1, 15)

    # Score calculation
    score = (
        alpha['Avg_Waiting_Time'] * normalized_waiting +
        alpha['Doctor_Availability'] * hospital_attr['Doctor_Availability'] +
        alpha['Rating'] * hospital_attr['Rating'] +
        alpha['Distance'] * normalized_distance +
        alpha['Num_Reviews'] * hospital_attr['Num_Reviews']
    )
    
    return score

# Simulate ranking data with hospital attributes and user preferences
ranking_data = []

for day in range(1, num_days + 1):
    for user in users:
        user_prefs = user_preferences[user]
        preferred_dept = user_prefs['Preferred_Department']
        preferred_param = user_prefs['Preferred_Parameter']
        
        # Filter hospitals based on user's preferred department
        hospitals_in_preferred_dept = hospital_data[hospital_data['Department'] == preferred_dept]['Hospital'].values
        
        ranked_hospitals = []
        for hospital in hospitals_in_preferred_dept:
            attr = hospital_attributes[hospital]
            score = calculate_score(user_prefs, attr)
            ranked_hospitals.append((hospital, score, attr))
        
        # Sort hospitals by score and pick the top 5
        ranked_hospitals.sort(key=lambda x: x[1], reverse=True)
        for rank, (hospital, score, attr) in enumerate(ranked_hospitals[:5], 1):
            # Include hospital attributes and user preferences as columns
            ranking_data.append([
                day, user, hospital, score, rank, 
                preferred_dept,  # User's preferred department
                preferred_param,  # User's preferred parameter
                attr['Avg_Waiting_Time'],  # Hospital attribute
                attr['Doctor_Availability'],  # Hospital attribute
                attr['Rating'],  # Hospital attribute
                attr['Distance'],  # Hospital attribute
                attr['Num_Reviews']  # Hospital attribute
            ])

# Convert to DataFrame
ranking_df = pd.DataFrame(ranking_data, columns=[
    'Day', 'User', 'Hospital', 'Score', 'Rank', 
    'User_Preferred_Department', 'User_Preferred_Parameter',
    'Avg_Waiting_Time', 'Doctor_Availability', 'Rating', 'Distance', 'Num_Reviews'
])

# Simulate feedback rewards
def generate_feedback(rank):
    if rank == 1:
        return random.uniform(0.8, 1)
    elif rank == 2:
        return random.uniform(0.6, 0.8)
    elif rank == 3:
        return random.uniform(0.4, 0.6)
    elif rank == 4:
        return random.uniform(0.2, 0.4)
    else:
        return random.uniform(0, 0.2)

ranking_df['Reward'] = ranking_df['Rank'].apply(generate_feedback)

# Save dataset
ranking_df.to_csv('hospital_ranking_final.csv', index=False)

print("Dataset generated with user preferences, correct ranking, and weighted scoring!")
#%%






























    






        
        
        
        
        
        
        
        
                         

    
