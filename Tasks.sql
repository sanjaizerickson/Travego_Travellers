-- a.Create a schema named Travego and create the tables mentioned above with the mentioned column names. Also, declare the relevant datatypes for each feature/column in the dataset. 

CREATE DATABASE Travego;
USE Travego;
CREATE TABLE Passenger
(Passenger_id int,
Passenger_name varchar(20),
Category varchar(20),
Gender varchar(20),
Boarding_City varchar(20),
Destination_City varchar(20),
Distance int,
Bus_Type varchar(20)
);
CREATE TABLE Price
(id int,
Bus_type varchar(20),
Distance int,
Price int);

-- b.Insert the data in the newly created tables.

INSERT INTO Passenger VALUES
(1,'Sejal','AC','F','Bengaluru','Chennai',350,'Sleeper'),
(2,'Anmol','Non-AC','M','Mumbai','Hyderabad',700,'Sitting'),
(3,'Pallavi','AC','F','Panaji','Bengaluru',600,'Sleeper'),
(4,'Kushboo','AC','F','Chennai','Mumbai',1500,'Sleeper'),
(5,'Udit','Non-AC','M','Trivandrum','Panaji','1000','Sleeper'),
(6,'Ankur','AC','M','Nagpur','Hyderabad',500,'Sitting'),
(7,'Hemant','Non-AC','M','Panaji','Mumbai',700,'Sleeper'),
(8,'Manish','Non-AC','M','Hyderabad','Bengaluru',500,'Sitting'),
(9,'Piyush','AC','M','Pune','Nagpur',700,'Sitting');

INSERT INTO Price VALUES
(1,'Sleeper',350,770),
(2,'Sleeper',550,1100),
(3,'Sleeper',600,1320),
(4,'Sleeper',700,1540),
(5,'Sleeper',1000,2200),
(6,'Sleeper',1200,2640),
(7,'Sleeper',1500,2700),
(8,'Sitting',500,620),
(9,'Sitting',600,744),
(10,'Sitting',700,868),
(11,'Sitting',1000,1240),
(12,'Sitting',1200,1488),
(13,'Sitting',1500,1860);

SELECT * FROM Passenger;
SELECT * FROM Price;
SET sql_safe_updates = 0;

-- a. How many female passengers traveled a minimum distance of 600 KMs?)
SELECT count(Passenger_name) FROM passenger WHERE gender = 'F' AND distance >= 600;

-- b. Write a query to display the passenger details whose travel distance is greater than 500 and who are traveling in a sleeper bus. 
SELECT * FROM passenger WHERE distance > 500 AND bus_type ='Sleeper';

-- c. Select passenger names whose names start with the character 'S'.
SELECT passenger_name FROM passenger WHERE passenger_name LIKE 'S%';

-- d. Calculate the price charged for each passenger, displaying the Passenger name, Boarding City, Destination City, Bus type, and Price in the output. 
SELECT ps.passenger_name, ps.boarding_city, ps.destination_city, ps.bus_type, pr.price
FROM passenger ps JOIN price pr ON ps.bus_type=pr.bus_type AND ps.Distance=pr.Distance ;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus? 
SELECT ps.passenger_name , pr.price as travel_price FROM passenger ps JOIN price pr ON  ps.bus_type=pr.bus_type AND ps.Distance=pr.Distance
WHERE ps.Distance >= 1000 AND ps.Bus_Type = 'Sitting';

-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji ?
SELECT bus_type, price FROM price WHERE distance = (SELECT Distance FROM passenger WHERE Passenger_name = 'Pallavi');

-- g. Alter the column category with the value "Non-AC" where the Bus_Type is sleeper ?
UPDATE passenger SET Category = 'Non-AC' WHERE Bus_Type = 'Sleeper';

-- h. Delete an entry from the table where the passenger name is Piyush and commit this change in the database. 
DELETE FROM passenger WHERE Passenger_name = 'Piyush';
COMMIT;

-- i. Truncate the table passenger and comment on the number of rows in the table (explain if required).
TRUNCATE TABLE passenger;
-- Once we truncate the table, every rows will be deleted. So no.of rows is zero.

-- j. Delete the table passenger from the database.
DROP TABLE passenger;