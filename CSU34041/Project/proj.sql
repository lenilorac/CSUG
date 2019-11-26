-- sql project for Information management II
CREATE TABLE city(city_name VARCHAR(50) NOT NULL,
				  city_id	VARCHAR(10) NOT NULL,
				  country	VARCHAR(50) NOT NULL,
				  CONSTRAINT pk_city
				  PRIMARY KEY (city_id));
				  
CREATE TABLE airport(airport_name VARCHAR(50) NOT NULL,
					airport_id	VARCHAR(3) NOT NULL,
					country	 	VARCHAR(50) NOT NULL,
					city_id		VARCHAR(10) NOT NULL REFERENCES city(city_id) ON DELETE CASCADE,
					CONSTRAINT pk_airport
					PRIMARY KEY (airport_id));
					
CREATE TABLE airline(airline_id VARCHAR(3) NOT NULL,
					airline_name VARCHAR(50) NOT NULL,
					airline_number INT(3) NOT NULL,
					CONSTRAINT pk_airline
					PRIMARY KEY (airline_id));
					
CREATE TABLE incorporates(airline_id VARCHAR(3) NOT NULL REFERENCES airline(airline_id) ON DELETE CASCADE,
						airport_id VARCHAR(3) NOT NULL REFERENCES airport(airport_id) ON DELETE CASCADE,
						CONSTRAINT pk_inc
						PRIMARY KEY (airline_id, airport_id));
						
CREATE TABLE flight(flight_id VARCHAR(10) NOT NULL,
					origin VARCHAR(50) NOT NULL,
					destination VARCHAR(50) NOT NULL,
					departure_time TIME NOT NULL,
					arrival_time TIME NOT NULL,
					status	VARCHAR(10) NOT NULL,
					duration TIME NOT NULL,
					number_of_stops INT(1),
					flight_type VARCHAR(10) NOT NULL,
					airline_id VARCHAR(3) NOT NULL REFERENCES airline(airline_id) ON DELETE CASCADE,
					CONSTRAINT pk_flight
					PRIMARY KEY (flight_id));
					
CREATE TABLE employee(PPSN INT(9) NOT NULL,
					e_fname VARCHAR(20) NOT NULL,
					e_mname VARCHAR(20) NOT NULL,
					e_lname VARCHAR(20) NOT NULL,
					age INT(2) NOT NULL,
					gender VARCHAR(10) NOT NULL,
					employee_type VARCHAR(20) NOT NULL,
					employee_position VARCHAR(20) NOT NULL,
					airline_id VARCHAR(3) REFERENCES airline(airline_id) ON DELETE CASCADE,
					airport_id VARCHAR(3) REFERENCES airport(airport_id) ON DELETE CASCADE,
					CONSTRAINT pk_employee
					PRIMARY KEY (PPSN));
					
CREATE TABLE passenger(p_id VARCHAR(11) NOT NULL,
						p_fname VARCHAR(20) NOT NULL,
						p_mname VARCHAR(20) NOT NULL,
						p_lname VARCHAR(20) NOT NULL,
						age INT(2) NOT NULL,
						gender VARCHAR(10) NOT NULL,
						flight_id VARCHAR(10) NOT NULL REFERENCES flight(flight_code) ON DELETE CASCADE,
						CONSTRAINT pk_passenger
						PRIMARY KEY (p_id));