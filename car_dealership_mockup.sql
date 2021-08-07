CREATE TABLE salesperon(
	salesperson_id SERIAL Primary KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

ALTER TABLE salesperon
RENAME TO salesperson;

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	credit_rating INTEGER
);

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	car_make VARCHAR(50),
	car_model VARCHAR(50),
	car_year INTEGER,
	car_cost NUMERIC(10,2),
	car_color VARCHAR(50),
	car_new BOOLEAN,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
	
CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_date DATE DEFAULT CURRENT_DATE,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);
	
	
CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	m_first_name VARCHAR(50),
	m_last_name VARCHAR(50),
	cars_serviced INTEGER
);

CREATE TABLE car_mechanic(
	car_mechanic_id SERIAL PRIMARY KEY,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

CREATE TABLE car_parts(
	part_id SERIAL,
	part_cost NUMERIC(10,2),
	part_amount INTEGER,
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id)
);

ALTER TABLE car_parts ADD PRIMARY KEY(part_id);

CREATE TABLE service_record(
	ticket_id SERIAL PRIMARY KEY,
	ticket_cost NUMERIC(8,2),
	service_date DATE DEFAULT CURRENT_DATE,
	part_id INTEGER NOT NULL,
	FOREIGN KEY(part_id) REFERENCES car_parts(part_id),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

select *
from customer;