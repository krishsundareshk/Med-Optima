'''from flask import Flask, jsonify, request
from flask_cors import CORS
import connector
import sys

# initialize 
conn = connector.connect_db()
cursor = conn.cursor()
if not cursor:
    print("Connection failed")
    sys.exit(1)

print("Connection established")

app = Flask(__name__)
CORS(app)
# Utility function to execute queries
def execute_query(query, params=None, fetch=False, commit=False):
    try:
        cursor.execute(query, params)
        if commit:
            conn.commit()
        if fetch:
            return cursor.fetchall()
        return None
    except Exception as e:
        return str(e)

# Doctor registration and authentication routes
@app.route('/api/doctors/register', methods=['POST'])
def register_doctor():
    try:
        data = request.get_json()
        required_fields = ['username', 'password', 'first_name', 'last_name']
        
        if not all(field in data for field in required_fields):
            return jsonify({'error': 'Missing required fields'}), 400

        # Check if username already exists
        check_query = "SELECT username FROM doctors WHERE username = %s"
        result = execute_query(check_query, (data['username']), fetch=True)
        
        if result:
            return jsonify({'error': 'Username already exists'}), 409

        # Insert new doctor
        insert_query = """
            INSERT INTO doctors (username, password_hash, first_name, last_name, phone, specialization)
            VALUES (%s, %s, %s, %s, %s, %s)
        """
        execute_query(
            insert_query,
            (
                data['username'],
                data['password'],  # Note: In production, this should be hashed
                data['first_name'],
                data['last_name'],
                data.get('phone', None),
                data.get('specialization', None)
            ),
            commit=True
        )

        # Initialize doctor availability
        doctor_id = cursor.lastrowid
        availability_query = "INSERT INTO doctor_availability (doctor_id, is_available) VALUES (%s, FALSE)"
        execute_query(availability_query, (doctor_id,), commit=True)

        return jsonify({'message': 'Doctor registered successfully', 'doctor_id': doctor_id}), 201

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/doctors/login', methods=['POST'])
def login_doctor():
    try:
        data = request.get_json()
        if not data or 'username' not in data or 'password' not in data:
            return jsonify({'error': 'Missing credentials'}), 400

        # Get doctor details
        query = """
            SELECT doctor_id, username, password_hash, first_name, last_name 
            FROM doctors 
            WHERE username = %s
        """
        result = execute_query(query, (data['username'],), fetch=True)

        if not result or result[0]['password_hash'] != data['password']:  # In production, use proper password verification
            return jsonify({'error': 'Invalid credentials'}), 401

        # Update last login
        update_query = "UPDATE doctors SET last_login = CURRENT_TIMESTAMP WHERE doctor_id = %s"
        execute_query(update_query, (result[0]['doctor_id'],), commit=True)

        return jsonify({
            'message': 'Login successful',
            'doctor_id': result[0]['doctor_id'],
            'name': f"{result[0]['first_name']} {result[0]['last_name']}"
        }), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Doctor availability routes
@app.route('/api/doctors/<int:doctor_id>/availability', methods=['PUT'])
def update_availability(doctor_id):
    try:
        data = request.get_json()
        if 'is_available' not in data:
            return jsonify({'error': 'Missing availability status'}), 400

        query = """
            UPDATE doctor_availability 
            SET is_available = %s, status_changed_at = CURRENT_TIMESTAMP 
            WHERE doctor_id = %s
        """
        execute_query(query, (data['is_available'], doctor_id), commit=True)
        
        return jsonify({'message': 'Availability updated successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Consultation queue routes
@app.route('/api/doctors/<int:doctor_id>/queue', methods=['GET'])
def get_consultation_queue(doctor_id):
    try:
        query = """
            SELECT q.queue_id, q.patient_id, q.queue_position, q.status, q.created_at
            FROM consultation_queue q
            WHERE q.doctor_id = %s AND q.status = 'waiting'
            ORDER BY q.queue_position
        """
        result = execute_query(query, (doctor_id,), fetch=True)
        return jsonify(result), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/consultations/start', methods=['POST'])
def start_consultation():
    try:
        data = request.get_json()
        required_fields = ['queue_id', 'doctor_id', 'patient_id']
        
        if not all(field in data for field in required_fields):
            return jsonify({'error': 'Missing required fields'}), 400

        # Update queue status
        queue_query = """
            UPDATE consultation_queue 
            SET status = 'in_progress' 
            WHERE queue_id = %s
        """
        execute_query(queue_query, (data['queue_id'],), commit=True)

        # Create consultation session
        session_query = """
            INSERT INTO consultation_sessions 
            (queue_id, doctor_id, patient_id, started_at, status) 
            VALUES (%s, %s, %s, CURRENT_TIMESTAMP, 'active')
        """
        execute_query(
            session_query,
            (data['queue_id'], data['doctor_id'], data['patient_id']),
            commit=True
        )

        return jsonify({
            'message': 'Consultation started successfully',
            'session_id': cursor.lastrowid
        }), 201

    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/api/consultations/<int:session_id>/end', methods=['PUT'])
def end_consultation(session_id):
    try:
        # End consultation session
        session_query = """
            UPDATE consultation_sessions 
            SET ended_at = CURRENT_TIMESTAMP, status = 'completed' 
            WHERE session_id = %s
        """
        execute_query(session_query, (session_id,), commit=True)

        # Update queue status
        queue_query = """
            UPDATE consultation_queue q
            JOIN consultation_sessions s ON q.queue_id = s.queue_id
            SET q.status = 'completed'
            WHERE s.session_id = %s
        """
        execute_query(queue_query, (session_id,), commit=True)

        return jsonify({'message': 'Consultation ended successfully'}), 200

    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
'''