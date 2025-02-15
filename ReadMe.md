# Hospital Appointment System

## Overview
The Hospital Appointment System is designed to optimize doctor availability and appointment scheduling using AI and digital technology. The system addresses inefficiencies in healthcare, such as long waiting times and poorly managed appointments, by intelligently matching patient needs with doctor availability. This leads to reduced overcrowding, enhanced resource utilization, and improved patient satisfaction.

## Phases of Development

### **Phase I**
Phase I focuses on implementing the fundamental appointment management features:
- **Patient Module**
  - Login/Sign-Up
  - Symptom mapping
  - Hospital locator with Google Maps API
  - Appointment booking with QR codes
  - Patient history management
- **Admin Module**
  - Secure admin login
  - QR code validation
  - Real-time doctor assignment
  - Report upload management
- **Doctor Module**
  - Doctor login
  - Patient dashboard
  - Waiting time calculation
  - Scheduling optimization

### **Phase II**
Phase II incorporates AI-driven enhancements to improve the efficiency of appointment scheduling:
- AI-based data analysis on collected patient data and feedback
- Machine learning models for predicting optimal doctor allocation
- Reinforcement learning algorithms to refine scheduling efficiency
- Continuous improvement based on real-world data

## Technologies Used

### **Programming Languages**
- **Python**: Backend logic, AI algorithms
- **Dart**: Frontend (likely using Flutter)
- **SQL**: Database management

### **Database Service**
- **aiven.io**: Cloud-based database management

## Project Visuals

### **Entity-Relationship (ER) Diagram**
The ER diagram illustrates the database structure, depicting the relationships between entities such as patients, doctors, and appointments.
![WhatsApp Image 2025-01-26 at 21 00 50_8e187663](https://github.com/user-attachments/assets/bb08d397-232d-4bf2-9c80-fb71d08c20ca)


## Installation & Setup

1. **Set Up Virtual Environment (Python Backend)**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

2. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

3. **Configure Database**
   - Create a database instance on **aiven.io**
   - Update the database credentials in `config.py`

4. **Run the Backend Server**
   ```bash
   python app.py
   ```

5. **Run the Frontend Application (Flutter/Dart)**
   ```bash
   flutter pub get
   flutter run
   ```

## Usage
- Patients can register, book appointments, and access their medical history.
- Admins can validate QR codes, assign doctors, and manage reports.
- Doctors can log in, view patient appointments, and optimize their schedules.
- AI continuously analyzes patient data to enhance scheduling efficiency.

## Future Enhancements
- Integration of chatbots for appointment reminders
- Predictive analysis for patient wait times
- Expansion to multiple hospitals and clinics

## License
This project is licensed under the MIT License.

---
*Developed by MedOptima*

