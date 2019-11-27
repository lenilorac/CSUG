-- sql project for Information management II
				  
CREATE TABLE airport(airport_name VARCHAR(50) NOT NULL,
					airport_id	VARCHAR(3) NOT NULL,
					country_id	 VARCHAR(10) NOT NULL,
					city_id		VARCHAR(10) NOT NULL,
					CONSTRAINT pk_airport
					PRIMARY KEY (airport_id));

-- Inserting values of airport
INSERT INTO airport VALUES('Dublin Airport', 'DUB', 'IRL', 'IED001');
INSERT INTO airport VALUES('Amsterdam Airport Schiphol', 'AMS', 'NED', 'NLA001');
INSERT INTO airport VALUES('Birmingham Airport', 'BHX', 'ENG', 'UKB001');
INSERT INTO airport VALUES('Heathrow Airport', 'LHR', 'ENG', 'UKL001');
INSERT INTO airport VALUES('Dubai International Airport', 'DXB', 'UAE', 'UAED001');
INSERT INTO airport VALUES('Frankfurt Airport', 'FRA', 'GER', 'DEF001');
INSERT INTO airport VALUES('Charles de Gaulle Airport', 'CDG', 'FRA', 'FRAP001');
INSERT INTO airport VALUES('John F. Kennedy International Airport', 'JFK', 'USA', 'USAN001');

CREATE TABLE airline(airline_id VARCHAR(3) NOT NULL,
					airline_name VARCHAR(50) NOT NULL,
					CONSTRAINT pk_airline
					PRIMARY KEY (airline_id));

-- Inserting values into airline
INSERT INTO airline VALUES('RYR', 'Ryanair');
INSERT INTO airline VALUES('VRN', 'Virgin America');
INSERT INTO airline VALUES('AFR', 'Air France');
INSERT INTO airline VALUES('KLM', 'KLM');
INSERT INTO airline VALUES('QTR', 'Qatar');
INSERT INTO airline VALUES('BAW', 'British Airways');
INSERT INTO airline VALUES('DLH', 'Lufthansa');
INSERT INTO airline VALUES('ETD', 'Etihad Airways');
INSERT INTO airline VALUES('UAE', 'Emirates Airlines');
INSERT INTO airline VALUES('EIN', 'Aer Lingus');
					
CREATE TABLE flight(flight_id VARCHAR(10) NOT NULL,
					origin VARCHAR(10) NOT NULL,
					destination VARCHAR(10) NOT NULL,
					departure_time VARCHAR(10) NOT NULL,
					arrival_time VARCHAR(10) NOT NULL,
					flight_status	VARCHAR(10) NOT NULL,
					duration VARCHAR(10) NOT NULL,
					number_of_stops INT,
					flight_type VARCHAR(10) NOT NULL,
					airline_id VARCHAR(3) NOT NULL REFERENCES airline(airline_id) ON DELETE CASCADE,
					CONSTRAINT pk_flight
					PRIMARY KEY (flight_id),
					CONSTRAINT check_status
					CHECK(flight_status IN ('On Time', 'Delayed', 'Cancelled')),
					CONSTRAINT check_type
					CHECK(type IN('Direct', 'Connecting')));

-- Inserting values into flight
INSERT INTO flight VALUES('RYR123', 'DUB', 'BHX', '12:34', '13:20', 'On Time', '00:46', 0, 'Direct', 'RYR');
INSERT INTO flight VALUES('VRN877', 'LHR', 'JFK', '08:00', '11:15', 'On Time', '08:10', 0, 'Direct', 'VRN');
INSERT INTO flight VALUES('AFR098', 'CDG', 'AMS', '20:50', '22:05', 'On Time', '01:20', 0, 'Direct', 'AFR');
INSERT INTO flight VALUES('UAE161', 'DXB', 'DUB', '14:35', '18:55', 'Delayed', '08:15', 0, 'Direct', 'KLM');
INSERT INTO flight VALUES('DLH776', 'LHR', 'FRA', '06:30', '09:05', 'On Time', '01:35', 1, 'Connecting', 'DLH');
INSERT INTO flight VALUES('ETD646', 'CDG', 'DXB', '13:30', '23:25', 'Delayed', '06:45', 0, 'Direct', 'ETD');

CREATE TABLE airport_employee(PPSN INT(9) NOT NULL,
							employee_name VARCHAR(50) NOT NULL,
							age INT(2) NOT NULL,
							gender VARCHAR(10) NOT NULL,
							employee_type VARCHAR(20) NOT NULL,
							employee_position VARCHAR(30) NOT NULL,
							airport_id VARCHAR(3) NOT NULL REFERENCES airport(airport_id) ON DELETE CASCADE,
							CONSTRAINT pk_employee
							PRIMARY KEY (PPSN),
							CONSTRAINT check_ppsn
							CHECK (PPSN < 1000000000));

-- Inserting values into airport employee
INSERT INTO airport_employee VALUES(198700703, 'Daniel Marks', 45, 'Male', 'Administrative', 'PR specialist', 'DUB');
INSERT INTO airport_employee VALUES(231897198, 'Frank Brown', 34, 'Male', 'Sales', 'Sales Managar', 'DXB');
INSERT INTO airport_employee VALUES(342627678, 'Anne Francesca', 23, 'Female', 'Administrative', 'Receptionist', 'CDG');
INSERT INTO airport_employee VALUES(432489434, 'Regan Mathews', 27, 'Female', 'Sales', 'Sales Agent', 'LHR');
INSERT INTO airport_employee VALUES(432924777, 'Fortran Porta', 43, 'Male', 'Maintenance', 'Aircraft Maintenance', 'QTR');
INSERT INTO airport_employee VALUES(343728498, 'Paparica Dew', 24, 'Female', 'Services', 'Passenger Service Agent', 'BHX');
INSERT INTO airport_employee VALUES(879964343, 'John Federal', 43, 'Male', 'Ground Support', 'Aviation Mechanic', 'JFK');
INSERT INTO airport_employee VALUES(123874366, 'Abd al Qadir Matek', 32, 'Male', 'Operations', 'Operations Agent', 'DXB');
INSERT INTO airport_employee VALUES(157783429, 'Lyron Dymek', 57, 'Male', 'Administrative', 'Reservation Sales Agent', 'LHR');
INSERT INTO airport_employee VALUES(342477898, 'Michael Dryer', 43, 'Male', 'Coordinate', 'Flight Dispatcher', 'CDG');

CREATE TABLE airline_employee(PPSN INT(9) NOT NULL,
							employee_name VARCHAR(50) NOT NULL,
							age INT(2) NOT NULL,
							gender VARCHAR(10) NOT NULL,
							employee_type VARCHAR(20) NOT NULL,
							employee_position VARCHAR(20) NOT NULL,
							airline_id VARCHAR(3) NOT NULL REFERENCES airline(airline_id) ON DELETE CASCADE,
							CONSTRAINT pk_employee
							PRIMARY KEY (PPSN),
							CONSTRAINT chekc_ppsn
							CHECK (PPSN < 1000000000));

-- Inserting values into airline employee
INSERT INTO airline_employee VALUES(123674832, 'Emma Harry', 32, 'Female', 'Cabin Crew', 'Flight Attendant', 'RYR');
INSERT INTO airline_employee VALUES(467321873, 'Wendy Gardiner', 29, 'Female', 'Cabin Crew', 'Manager', 'VRN');
INSERT INTO airline_employee VALUES(342343243, 'Mario Speedwagon', 45, 'Male', 'Pilot', 'Pilot in command', 'KLM');
INSERT INTO airline_employee VALUES(634242423, 'Petey Cruier', 54, 'Male', 'Cabin Crew', 'Flight Attendant', 'QTR');
INSERT INTO airline_employee VALUES(123456654, 'Anna Sthesia', 43, 'Female', 'Cabin Crew', 'Flight Attendant', 'BAW');
INSERT INTO airline_employee VALUES(164535545, 'Paul Molive', 42, 'Male', 'Cabin Crew', 'Manager', 'DLH');
INSERT INTO airline_employee VALUES(234564566, 'Anna Mull', 37, 'Female', 'Pilot', 'Second Officer', 'AFR');
INSERT INTO airline_employee VALUES(823434243, 'Gail Forcewind', 34, 'Male', 'Cabin Crew', 'Flight Attendant', 'UAE');
INSERT INTO airline_employee VALUES(923432432, 'Paige Turner', 67, 'Female',  'Pilot', 'First Officer','EIN');
INSERT INTO airline_employee VALUES(342432424, 'Bob Frapples', 29, 'Male', 'Cabin Crew', 'Flight Attendant', 'EIN');
					
CREATE TABLE passenger(p_id VARCHAR(11) NOT NULL,
						passenger_name VARCHAR(50) NOT NULL,
						age INT(2) NOT NULL,
						gender VARCHAR(10) NOT NULL,
						CONSTRAINT pk_passenger
						PRIMARY KEY (p_id));

-- Inserting values into passenger
INSERT INTO passenger VALUES('IRL12345678', 'Taylor Murphy', 24, 'Male');
INSERT INTO passenger VALUES('FRA09876542', 'Cecile Martin', 60, 'Female');
INSERT INTO passenger VALUES('IRL76767777', 'Aoife O Toole', 34, 'Female');
INSERT INTO passenger VALUES('POL34561899', 'Emanuel Oklahoma', 23, 'Male');
INSERT INTO passenger VALUES('RUS09232317', 'Alexandera Bykov', 54, 'Male');
INSERT INTO passenger VALUES('USA43434333', 'Donal Trumpet', 67, 'Male');
INSERT INTO passenger VALUES('QAT09867778', 'Muhamad Palsha', 47, 'Male');
INSERT INTO passenger VALUES('DEC80766333', 'Frederick Sederick', 56, 'Male');
INSERT INTO passenger VALUES('ITA34247899', 'Monet Aneeta', 34, 'Female');
INSERT INTO passenger VALUES('OMA34234236', 'Beri Berida', 36, 'Female');

CREATE TABLE ticket(flight_id VARCHAR(10) NOT NULL REFERENCES flight(flight_id) ON DELETE CASCADE,
					price INT NOT NULL,
					class VARCHAR(20) NOT NULL,
					p_id VARCHAR(11) NOT NULL REFERENCES passenger(p_id) ON DELETE CASCADE,
					CONSTRAINT pk_ticket
					PRIMARY KEY (flight_id, p_id));

-- Inserting values into ticket
INSERT INTO ticket VALUES('RYR123', 123, 'Economy Class', 'IRL12345678');
INSERT INTO ticket VALUES('VRN877', 1002, 'First Class', 'FRA09876542');
INSERT INTO ticket VALUES('AFR098', 456, 'First Class', 'IRL76767777');
INSERT INTO ticket VALUES('UAE161', 877, 'Economy Class', 'RUS09232317');
INSERT INTO ticket VALUES('ETD646', 238, 'Economy Class', 'DEC80766333');
INSERT INTO ticket VALUES('DLH776', 78, 'Economy Class', 'OMA34234236');
INSERT INTO ticket VALUES('UAE161', 987, 'Economy Class', 'USA43434333');
INSERT INTO ticket VALUES('RYR123', 123, 'Economy Class', 'ITA34247899');
INSERT INTO ticket VALUES('VRN877', 567, 'Economy Class', 'POL34561899');
INSERT INTO ticket VALUES('UAE161', 1238, 'First Class', 'FRA09876542');
