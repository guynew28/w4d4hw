--Insert Salesperson
INSERT INTO salesperson(first_name, last_name) 
	VALUES('John', 'Smith'), ('Robert','Bean');

--Stored Function for Salesperson
CREATE OR REPLACE FUNCTION add_salesperson(
	sales_firstname VARCHAR(50), sales_lastname VARCHAR(50))
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
	INSERT INTO salesperson(first_name, last_name)
	VALUES(sales_firstname, sales_lastname);
END;
$MAIN$
		
--Call function for Salesperson
SELECT add_salesperson('Jacob', 'Wilkerson');

	


--Insert Customer
INSERT INTO customer(first_name, last_name, credit_rating)
	VALUES('Eric', 'Mill', 720), ('Dolly', 'Roy', 550);

INSERT INTO customer(first_name, last_name, credit_rating)
	VALUES('Lisa', 'Oliver', 700), ('Tim', 'Day', 650);

-- STORED FUNCTION for customer
CREATE OR REPLACE FUNCTION add_customer(firstname VARCHAR(50), lastname VARCHAR(50), creditrating INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
	INSERT INTO customer(first_name, last_name, credit_rating)
	VALUES(firstname, lastname, creditrating);
END;
$MAIN$

--Call funtion for customer
SELECT add_customer('Tracy', 'Walters', 799);
SELECT add_customer('Ken', 'Baldwin', 575);


--Insert Car
INSERT INTO car(
	car_make,
	car_model,
	car_year,
	car_cost,
	car_color,
	car_new,
	salesperson_id,
	customer_id)
VALUES('Mercedez','GLS450',2021,95000.00,'Silver','YES', 1, 1),
	   ('BMW','X5', 2019, 50000.00, 'Black', 'NO', 2,2);


--Stored function for car
CREATE OR REPLACE FUNCTION add_car(
	carmake VARCHAR(50), 
	carmodel VARCHAR(50), 
	caryear INTEGER, 
	carcost NUMERIC(10,2), 
	carcolor VARCHAR(50), 
	carnew BOOLEAN, 
	salespersonid INTEGER, 
	customerid INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
INSERT INTO car(car_make, car_model, car_year, car_cost, car_color, car_new, salesperson_id, customer_id)
VALUES(carmake, carmodel, caryear, carcost, carcolor, carnew, salespersonid, customerid);
END;
$MAIN$
	
--Call function for car
SELECT add_car('BMW','X5', 2019, 50000.00, 'Black', 'NO', 2,2);
SELECT add_car('Honda','Civic',2020, 25000.00,'Red','YES', 1, 1);

)
INSERT INTO car(car_make,car_moddel,car_year,car_cost,car_color,car_new,salesperson_id,customer_id)
VALUES('Honda','Civic',2020,25,000.00,'Red',YES,1,1),
	('BMW','X5', 2019, 50,000.00, 'Black', NO, 2,2);


--Insert invoice
INSERT INTO invoice(salesperson_id, car_id, customer_id)
VALUES(2,2,2);

--Insert invoice using stored function
CREATE OR REPLACE FUNCTION add_invoice(salespersonid INTEGER, carid INTEGER, customerid INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
	INSERT INTO invoice(salesperson_id, car_id, customer_id)
	VALUES(salespersonid, carid, customerid);
END;
$MAIN$

--Call function for invoice
SELECT add_invoice(1,1,1);

	 
--Insert Car Parts
INSERT INTO car_parts(part_cost, part_amount, car_id)
VALUES(110, 1, 3);

--STORED FUNCTION for car_parts
CREATE OR REPLACE FUNCTION add_car_parts(partcost NUMERIC(10,2), partamount INTEGER, carid INTEGER)
RETURNS void	
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
INSERT INTO car_parts(part_cost, part_amount, car_id)
VALUES(partcost, partamount, carid);
END;
$MAIN$

--call Function car_parts
SELECT add_car_parts(90, 3, 2);
										 
										 
--Insert Mechanic	
INSERT INTO mechanic(m_first_name, m_last_name, cars_serviced)
VALUES('Brian', 'Whitman', 223);

--STORED FUNCTION for Mechanic
CREATE OR REPLACE FUNCTION add_mechanic(m_firstname VARCHAR(50), m_lastname VARCHAR(50), carsserviced INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
	INSERT INTO mechanic(m_first_name, m_last_name, cars_serviced)
	VALUES(m_firstname, m_lastname, carsserviced);
END;
$MAIN$

--call function for mechanic
SELECT add_mechanic('Thomas', 'Pyle', 159);


--Insert Car_Mechanic
INSERT INTO car_mechanic(car_id, mechanic_id)
VALUES(4,1);

--STORED FUNCTION for car_mechanic
CREATE OR REPLACE FUNCTION add_car_mechanic(carid INTEGER, mechanicid INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
	INSERT INTO car_mechanic(car_id, mechanic_id)
	VALUES(carid, mechanicid);
END;
$MAIN$

--call function for car_mechanic
SELECT add_car_mechanic(5, 2);
										   

--Insert Service Record
INSERT INTO service_record(ticket_cost, part_id, mechanic_id, car_id, customer_id)
VALUES(110.00, 1, 1, 4, 5);

--Stored Function for service_record
CREATE OR REPLACE FUNCTION add_service_record(ticketcost NUMERIC(8,2), partid INTEGER, mechanicid INTEGER, carid INTEGER, customerid INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$MAIN$
BEGIN
	INSERT INTO service_record(ticket_cost, part_id, mechanic_id, car_id, customer_id)
	VALUES(ticketcost, partid, mechanicid, carid, customerid);
END;
$MAIN$

--call function for service_record
SELECT add_service_record(210.00, 2, 2,5, 6);


