-- Create first table 
CREATE TABLE PERSON (
  id_person INT AUTO_INCREMENT PRIMARY KEY,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL
); 

INSERT INTO PERSON(last_name, first_name) VALUES
('Wang', 'Allen'), 
('Alice', 'Bob'); 

SELECT * FROM PERSON; 

-- Create second table 
CREATE TABLE ADDRESS( 
  id_address INT AUTO_INCREMENT PRIMARY KEY, 
  id_person INT NOT NULL,
  FOREIGN KEY(id_person) REFERENCES PERSON(id_person) ON DELETE CASCADE,
  city VARCHAR(50) NOT NULL, 
  state VARCHAR(50) NOT NULL
);

INSERT INTO ADDRESS(id_person, city, state) VALUES
(1, 'New York City', 'New York'),
(2, 'Leetcode', 'California');

-- PRINT UNION OF TABLES 
SELECT last_name, first_name, city, state FROM PERSON 
JOIN ADDRESS ON PERSON.id_person = ADDRESS.id_person;

