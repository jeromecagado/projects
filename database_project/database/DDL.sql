
 -- This is the sql code for Retro Games by Gabriel-Jean Bertrand and Jerome Cagado

SET FOREIGN_KEY_CHECKS= 0;
SET AUTOCOMMIT = 0;


-- Creates the Employees Table
DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees(
employee_id INT auto_increment NOT NULL UNIQUE,
employee_fname VARCHAR(45) NOT NULL,
employee_lname VARCHAR(45) NOT NULL,
employee_phone INT(10) NOT NULL,
hire_date DATE,
PRIMARY KEY(employee_id)
);


-- Creates the Customers Table
DROP TABLE IF EXISTS Customers;
CREATE TABLE Customers(
customer_id INT auto_increment NOT NULL UNIQUE,
customer_fname VARCHAR(45) NOT NULL,
customer_lname VARCHAR(45) NOT NULL,
address VARCHAR(45) NOT NULL,
city VARCHAR(45) NOT NULL,
state VARCHAR(45) NOT NULL,
zipcode VARCHAR(45) NOT NULL,
email VARCHAR (45) NOT NULL,
customer_phone INT NOT NULL,
PRIMARY KEY(customer_id)
);


-- Creates the Developers Table
DROP TABLE IF EXISTS Developers;
CREATE TABLE Developers(
developer_id INT auto_increment NOT NULL UNIQUE,
developer_name VARCHAR(45) NOT NULL,
developer_country VARCHAR(45) NOT NULL,
developer_email VARCHAR(45) NOT NULL,
PRIMARY KEY (developer_id) 

);


-- Creates the Sales Table
DROP TABLE IF EXISTS Sales;
CREATE TABLE Sales(
sale_id INT auto_increment NOT NULL UNIQUE,
employee_id INT,
customer_id INT NOT NULL,
sale_revenue DECimal(10,2) NOT NULL,
sold_date DATE,

PRIMARY KEY(sale_id),
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);


-- Creates the Video Games table Table
DROP TABLE IF EXISTS VideoGames;
CREATE TABLE VideoGames(
video_game_id INT auto_increment NOT NULL UNIQUE,
developer_id INT NOT NULL,
video_game_name VARCHAR(45) NOT NULL,
price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,

PRIMARY KEY (video_game_id),
FOREIGN KEY (developer_id) REFERENCES Developers(developer_id) ON DELETE CASCADE
);


-- Creates the intersection table between video games and sales
DROP TABLE IF EXISTS VideoGameSales;
CREATE TABLE VideoGameSales(
video_games_sales_id INT auto_increment NOT NULL UNIQUE,
sale_id INT NOT NULL,
video_game_id  INT NOT NULL,
PRIMARY KEY (video_games_sales_id),
FOREIGN KEY (sale_id) REFERENCES Sales(sale_id) ON DELETE CASCADE,
FOREIGN KEY (video_game_id) REFERENCES VideoGames(video_game_id) 



);


-- Adds in some employees
INSERT INTO Employees(employee_fname, employee_lname,employee_phone,hire_date)
VALUES ("John", "Smith", 14321683, "2021-04-25"),
("Terry", "Clinton", 16548327, "2023-05-16"),
("Jill", "Cool", 15928383, "2019-05-03"),
("Gabriel", "Chang",13245634, '2017-05-23');

-- Adds in some customers
INSERT INTO Customers( customer_fname, customer_lname, address, city, state, zipcode, email, customer_phone)
VALUES ("Sam", "Romanano", "123 Cool Street", "Los Angeles" ,"California", "72839", "SR@yahoo.com", 18727826),
("Sophia", "Rodriguez", "321 Nice Avenue", "Seattle", "Washington", "98101", "sophia.rodri@gmail.com", 14598547),
("Jonathan", "Thompson", "432 73rd Street", "Minneapolis", "Minnesota", "55633", "J.Teach@gmail.com", 18209483);


-- Adds in some developers
INSERT INTO Developers(developer_name, developer_country,developer_email)
VALUES ("Cool Games", "Canada", "Cool@gmail.com"),
("Nice Studios", "Sweden", "Nice@yahoo.com"),
("Ok Company", "United States", "Okgames@gmail.com");

-- Adds in some example sales
INSERT INTO Sales(employee_id,customer_id,sale_revenue,sold_date)
VALUES (1,1,50.00,"2023-07-24"),
(2,3,75.00,"2023-07-14"),
(3,2,100.00,"2023-10-18");



-- Adds in some video game values
INSERT INTO VideoGames(developer_id,video_game_name,price,quantity)
VALUES(3, "Angry Fish", 5.00, 10),
(2, "BattleShip", 25.00, 3),
(1, "Battle Toad", 50.00, 2);


-- Adds in details for the intersection of video games and sales
INSERT VideoGameSales(sale_id, video_game_id)
VALUES(1,1),
(2,2),
(3,3);






SET FOREIGN_KEY_CHECKS=1;
COMMIT;
