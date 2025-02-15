'''
import pymysql

def connect_db():
    timeout = 10
    connection = pymysql.connect(
        charset="utf8mb4",
        connect_timeout=timeout,
        cursorclass=pymysql.cursors.DictCursor,
        db="HospitalManagement_2",
        host="hackathon-appointment-system-bharat-4970.f.aivencloud.com",
        password="AVNS_smE3V9-bKGESgONHotG",
        read_timeout=timeout,
        port=16877,
        user="avnadmin",
        write_timeout=timeout,
    )
    
    try:
        connection
        return connection
    except:
        return None
'''