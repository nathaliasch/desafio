CREATE Desafio;

USE Desafio;

 CREATE TABLE category (
    category_id serial PRIMARY KEY,
    name VARCHAR(50),
    last_update TIMESTAMP
  );
  
COPY category
FROM 'C:\data_in_csv\category_202211251432.csv'
DELIMITER ','
CSV HEADER;
  
 CREATE TABLE film_category (
    film_id serial PRIMARY KEY,
    category_id int NOT NULL,
    last_update timestamp,	
	FOREIGN KEY (category_id) REFERENCES category (category_id)
 );
  
COPY film_category
FROM 'C:\data_in_csv\film_category_202211251432.csv'
DELIMITER ','
CSV HEADER; 

CREATE TABLE language (
    language_id serial PRIMARY KEY,
    name varchar (50),
    last_update timestamp
  );
  
COPY language
FROM 'C:\data_in_csv\_language__202211251432.csv'
DELIMITER ','
CSV HEADER; 
  
 CREATE TABLE FILM (
    film_id serial PRIMARY KEY,
    title varchar (50),
	description varchar (200),
	release_year integer,
	language_id int NOT NULL,
	rental_duration int,
	rental_rate numeric (10,2),
	length integer,
	replacement_cost numeric (10,2),
	rating varchar (10),
	last_update timestamp,
	special_features varchar (100),
	fulltext varchar (300),
	FOREIGN KEY (language_id) REFERENCES language(language_id)
  );
  
COPY film
FROM 'C:\data_in_csv\film_202211251432.csv'
DELIMITER ','
CSV HEADER; 
  
 CREATE TABLE country (
    country_id serial PRIMARY KEY,
    country varchar (50),
    last_update timestamp
  );
  
COPY country
FROM 'C:\data_in_csv\country_202211251432.csv'
DELIMITER ','
CSV HEADER;       
	
CREATE TABLE city (
    city_id serial PRIMARY KEY,
    city varchar (50),
	country_id int,
    last_update TIMESTAMP,
	FOREIGN KEY (country_id) REFERENCES country(country_id)
  );
 
COPY city
FROM 'C:\data_in_csv\city_202211251432.csv'
DELIMITER ','
CSV HEADER;     
	
CREATE TABLE address (
    address_id serial PRIMARY KEY,
    address varchar (100),
    address2 varchar (100),
	district varchar (50),
	city_id int,
	postal_code varchar (10),
	phone varchar (20),
	last_update timestamp,
	FOREIGN KEY (city_id) REFERENCES city(city_id)
  );
 
COPY address
FROM 'C:\data_in_csv\address_202211251432.csv'
DELIMITER ','
CSV HEADER;    
 
 CREATE TABLE store (
    store_id serial PRIMARY KEY,
    manager_staff_id int,
	address_id int,
    last_update timestamp,
	FOREIGN KEY (address_id) REFERENCES address(address_id)
  );
  
COPY store
FROM 'C:\data_in_csv\store_202211251432.csv'
DELIMITER ','
CSV HEADER;     

CREATE TABLE staff (
    staff_id serial PRIMARY KEY,
	first_name varchar (50),
	last_name varchar (50),
	address_id int,
	email varchar (50),
	store_id int not null,
	active varchar (50),
	username varchar (10),
	password varchar (50),
	last_update TIMESTAMP,
	picture varchar (50),
	FOREIGN KEY (address_id) REFERENCES address(address_id),
	FOREIGN KEY (store_id) REFERENCES store(store_id) 
  );
  
COPY staff
FROM 'C:\data_in_csv\staff_202211251432.csv'
DELIMITER ','
CSV HEADER;   
 
CREATE TABLE inventory (
    inventory_id serial PRIMARY KEY,
    film_id int NOT NULL,
	store_id int NOT NULL,
    last_update timestamp,
	FOREIGN KEY (film_id) REFERENCES film(film_id),
	FOREIGN KEY (store_id) REFERENCES store(store_id)
  );
  
COPY inventory
FROM 'C:\data_in_csv\inventory_202211251432.csv'
DELIMITER ','
CSV HEADER;  
	
CREATE TABLE actor (
    actor_id serial PRIMARY KEY,
	first_name varchar (50),
    last_name varchar (50),
	last_update timestamp	
  );
  
COPY actor
FROM 'C:\data_in_csv\actor_202211251432.csv'
DELIMITER ','
CSV HEADER;   	
	
	
 CREATE TABLE film_actor (
    actor_id int,
    film_id int,
    last_update timestamp,
	FOREIGN KEY (film_id) REFERENCES film(film_id),
	FOREIGN KEY (actor_id) REFERENCES actor(actor_id)
  );
  
COPY film_actor
FROM 'C:\data_in_csv\film_actor_202211251432.csv'
DELIMITER ','
CSV HEADER;  
   
CREATE TABLE customer (
    customer_id serial PRIMARY KEY,
    store_id int NOT NULL,
	first_name varchar (50),
	last_name varchar (50),
	email varchar (50),
	address_id int,
	activebool boolean,
	create_date timestamp,
    last_update timestamp,
	active boolean,
	FOREIGN KEY (store_id) REFERENCES store(store_id),
	FOREIGN KEY (address_id) REFERENCES address(address_id)
  );
  
COPY customer
FROM 'C:\data_in_csv\customer_202211251432.csv'
DELIMITER ','
CSV HEADER;    
  
  
 CREATE TABLE rental (
    rental_id serial PRIMARY KEY,
    rental_date timestamp,
	inventory_id int NOT NULL,
	customer_id int NOT NULL,
	return_date timestamp,
	staff_id int NOT NULL,
    last_update timestamp,
	FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id)
  );
  
COPY rental
FROM 'C:\data_in_csv\rental_202211251432.csv'
DELIMITER ','
CSV HEADER;   
  
 CREATE TABLE payment (
    payment_id serial PRIMARY KEY,
    customer_id int NOT NULL,
	staff_id int NOT NULL,
	rental_id int NOT NULL,
	amount numeric (10,2),
	payment_date timestamp,
   	FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (staff_id) REFERENCES staff(staff_id),
	FOREIGN KEY (rental_id) REFERENCES rental(rental_id)
  );
  
COPY payment
FROM 'C:\data_in_csv\payment_202211251432.csv'
DELIMITER ','
CSV HEADER;   
  
 