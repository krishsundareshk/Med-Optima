from flask import Flask, request, jsonify
import mysql.connector
from werkzeug.security import generate_password_hash, check_password_hash
from db import conn

app = Flask(__name__)

@app.route('/register', methods=['POST'])
def register():
    data = request.json
    if not data or not data.get('email') or not data.get('password'):
        return jsonify({'message': 'Invalid data'}), 400
    
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM patients WHERE email = %s", (data['email'],))
    if cursor.fetchone():
        return jsonify({'message': 'Email already exists'}), 400
    
    hashed_password = generate_password_hash(data['password'], method='pbkdf2:sha256')
    cursor.execute("INSERT INTO patients (name, email, password_hash) VALUES (%s, %s, %s)",
                   (data.get('name', ''), data['email'], hashed_password))
    conn.commit()
    cursor.close()
    
    return jsonify({'message': 'User registered successfully'})

@app.route('/login', methods=['POST'])
def login():
    data = request.json
    if not data or not data.get('email') or not data.get('password'):
        return jsonify({'message': 'Invalid data'}), 400
    
    cursor = conn.cursor()
    cursor.execute("SELECT id, password_hash FROM patients WHERE email = %s", (data['email'],))
    patient = cursor.fetchone()
    cursor.close()
    
    if not patient or not check_password_hash(patient[1], data['password']):
        return jsonify({'message': 'Invalid credentials'}), 401
    
    return jsonify({'message': 'Login successful', 'patient_id': patient[0]})

@app.route('/submit_symptoms', methods=['POST'])
def submit_symptoms():
    data = request.json
    if not data or not data.get('patient_id') or not data.get('text'):
        return jsonify({'message': 'Invalid data'}), 400
    
    cursor = conn.cursor()
    cursor.execute("INSERT INTO symptoms (patient_id, text) VALUES (%s, %s)", (data['patient_id'], data['text']))
    conn.commit()
    cursor.close()
    
    return jsonify({'message': 'Symptoms submitted successfully'})

@app.route('/get_hospitals', methods=['GET'])
def get_hospitals():
    cursor = conn.cursor()
    cursor.execute("SELECT name, address, rating FROM hospitals")
    hospitals = cursor.fetchall()
    cursor.close()
    
    hospitals_list = [{'name': row[0], 'address': row[1], 'rating': row[2]} for row in hospitals]
    
    return jsonify({'hospitals': hospitals_list})

@app.route('/get_patient_details', methods=['GET'])
def get_patient_details():
    patient_id = request.args.get('patient_id')
    if not patient_id:
        return jsonify({'message': 'Patient ID is required'}), 400
    
    cursor = conn.cursor()
    cursor.execute("SELECT name, age, number, id FROM patients WHERE id = %s", (patient_id,))
    patient = cursor.fetchone()
    
    cursor.execute("SELECT text FROM symptoms WHERE patient_id = %s", (patient_id,))
    symptoms = cursor.fetchall()
    cursor.close()
    
    if not patient:
        return jsonify({'message': 'Patient not found'}), 404
    
    symptoms_list = [row[0] for row in symptoms]
    
    return jsonify({
        'name': patient[0],
        'age': patient[1],
        'number': patient[2],
        'id': patient[3],
        'symptoms': symptoms_list
    })

if __name__ == '__main__':
    app.run(debug=True)
