CREATE TABLE IF NOT EXISTS appointments (
    id SERIAL PRIMARY KEY,
    booking_reference VARCHAR(50) UNIQUE NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(30) NOT NULL,
    appointment_type VARCHAR(150) NOT NULL,
    doctor VARCHAR(150) NOT NULL,
    preferred_date DATE NOT NULL,
    preferred_time TIME NOT NULL,
    message TEXT,
    consent BOOLEAN NOT NULL,
    status VARCHAR(30) DEFAULT 'Pending',
    payment_status VARCHAR(30) DEFAULT 'Not Paid',
    document_name VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS available_slots (
    id SERIAL PRIMARY KEY,
    doctor VARCHAR(150) NOT NULL,
    appointment_type VARCHAR(150) NOT NULL,
    available_date DATE NOT NULL,
    available_time TIME NOT NULL,
    is_booked BOOLEAN DEFAULT false,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS payments (
    id SERIAL PRIMARY KEY,
    appointment_id INT REFERENCES appointments(id),
    amount NUMERIC(10,2),
    payment_status VARCHAR(30) DEFAULT 'Not Paid',
    payment_method VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS audit_logs (
    id SERIAL PRIMARY KEY,
    action VARCHAR(150) NOT NULL,
    details TEXT,
    performed_by VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);