-- Insert data into the 'users.users' table
INSERT INTO users.users (user_id, name, email, password, role, is_contributor, is_archived, created_at, updated_at)
overriding system value
VALUES
    (0, 'John Doe', 'john.doe@example.com', 'password123', 'admin', true, false, now(), now()),
    (1, 'Jane Smith', 'jane.smith@example.com', 'secret456', 'user', false, false, now(), now()),
    (2, 'Bob Johnson', 'bob.johnson@example.com', 'topsecret789', 'user', false, true, now(), now());

-- Insert data into the 'vehicles.models' table
INSERT INTO vehicles.models (model_id, make, model, year, is_archived, created_at, updated_at)
overriding system value
VALUES
    (0, 'Toyota', 'Camry', 2020, false, now(), now()),
    (1, 'Ford', 'Mustang', 2019, false, now(), now()),
    (2, 'Honda', 'Civic', 2021, false, now(), now());

-- Insert data into the 'vehicles.vehicles' table
INSERT INTO vehicles.vehicles (vehicle_id, model_id, user_id, license_plate, color, is_archived, created_at, updated_at)
overriding system value
VALUES
    (0, 0, 0, 'ABC123', 'Blue', false, now(), now()),
    (1, 1, 1, 'XYZ789', 'Red', false, now(), now()),
    (2, 2, 2, 'DEF456', 'Silver', false, now(), now());

-- Insert data into the 'vehicles.vehicle_users' table
INSERT INTO vehicles.vehicle_users (vehicle_id, user_id, is_archived, created_at, updated_at)
VALUES
    (0, 0, false, now(), now()),
    (1, 1, false, now(), now()),
    (2, 2, false, now(), now());

-- Insert data into the 'vehicles.sensors' table
INSERT INTO vehicles.sensors (sensor_id, vehicle_id, type, location, data_type, data_format, is_archived, created_at, updated_at)
overriding system value
VALUES
    (0, 0, 'GPS', '(40.7128, -74.0060)', 'Location', 'JSON', false, now(), now()),
    (1, 1, 'Temperature', '(34.0522, -118.2437)', 'Temperature', 'JSON', false, now(), now()),
    (2, 2, 'Speedometer', '(51.5074, -0.1278)', 'Speed', 'JSON', false, now(), now());

-- Insert data into the 'reports.vehicle_track_reports' table
-- Note: You may need to adjust the POINT values according to your data format.
INSERT INTO reports.vehicle_track_reports (vehicle_track_report_id, vehicle_id, location, altitude, direction, speed, acceleration, fuel, temperature, humidity, pressure, additional_data, created_at)
overriding system value
VALUES
    (0, 0, '(40.7128, -74.0060)', 100.5, 45.0, 60.0, 2.5, 30.0, 25.0, 60.0, 1010.0, '{"key": "value"}', now()),
    (1, 1, '(34.0522, -118.2437)', 200.0, 90.0, 70.0, 3.0, 35.0, 28.0, 65.0, 1005.0, '{"key": "value"}', now()),
    (2, 2, '(51.5074, -0.1278)', 150.0, 180.0, 80.0, 2.0, 25.0, 22.0, 55.0, 1015.0, '{"key": "value"}', now());

-- Insert data into the 'reports.vehicle_spotting_reports' table
-- Note: You may need to adjust the POINT values according to your data format.
INSERT INTO reports.vehicle_spotting_reports (vehicle_spotting_report_id, vehicle_id, type, location, altitude, direction, speed, acceleration, fuel, temperature, humidity, pressure, additional_data, created_at)
overriding system value
VALUES
    (0, 0, 'Spotting', '(40.7128, -74.0060)', 100.5, 45.0, 60.0, 2.5, 30.0, 25.0, 60.0, 1010.0, '{"key": "value"}', now()),
    (1, 1, 'Spotting', '(34.0522, -118.2437)', 200.0, 90.0, 70.0, 3.0, 35.0, 28.0, 65.0, 1005.0, '{"key": "value"}', now()),
    (2, 2, 'Spotting', '(51.5074, -0.1278)', 150.0, 180.0, 80.0, 2.0, 25.0, 22.0, 55.0, 1015.0, '{"key": "value"}', now());

-- Insert data into the 'reports.vehicle_alert_reports' table
-- Note: You may need to adjust the POINT values according to your data format.
INSERT INTO reports.vehicle_alert_reports (vehicle_alert_report_id, vehicle_id, type, location, altitude, direction, speed, acceleration, fuel, temperature, humidity, pressure, additional_data, created_at)
overriding system value
VALUES
    (0, 0, 'Alert', '(40.7128, -74.0060)', 100.5, 45.0, 60.0, 2.5, 30.0, 25.0, 60.0, 1010.0, '{"key": "value"}', now()),
    (1, 1, 'Alert', '(34.0522, -118.2437)', 200.0, 90.0, 70.0, 3.0, 35.0, 28.0, 65.0, 1005.0, '{"key": "value"}', now()),
    (2, 2, 'Alert', '(51.5074, -0.1278)', 150.0, 180.0, 80.0, 2.0, 25.0, 22.0, 55.0, 1015.0, '{"key": "value"}', now());

-- Insert data into the 'trips.trips' table
INSERT INTO trips.trips (trip_id, user_id, vehicle_id, start_location, end_location, start_time, end_time, distance, duration, created_at, updated_at)
overriding system value
VALUES
    (0, 0, 0, 'New York', 'Los Angeles', '2023-09-20 08:00:00', '2023-09-20 18:00:00', 2800.0, '10 hours', now(), now()),
    (1, 1, 1, 'Los Angeles', 'San Francisco', '2023-09-20 09:00:00', '2023-09-20 16:00:00', 400.0, '7 hours', now(), now()),
    (2, 2, 2, 'London', 'Paris', '2023-09-20 10:00:00', '2023-09-20 14:00:00', 300.0, '4 hours', now(), now());
