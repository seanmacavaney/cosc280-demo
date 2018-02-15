DROP DATABASE IF EXISTS project280;
CREATE DATABASE project280;
USE project280;
GRANT ALL ON project280.* TO user280@localhost IDENTIFIED BY 'p4ssw0rd';

CREATE TABLE People (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(120) NOT NULL,
    last_name VARCHAR(120) NOT NULL,
    phone VARCHAR(10) NOT NULL,
    time_added TIMESTAMP NOT NULL,
    age INT NOT NULL
);

CREATE TABLE Interests (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  name VARCHAR(50) NOT NULL,
  sort_order INT NOT NULL
);

CREATE TABLE PersonInterests (
  person_id INT,
  interest_id INT,
  PRIMARY KEY (person_id, interest_id),
  FOREIGN KEY (person_id) REFERENCES People(id),
  FOREIGN KEY (interest_id) REFERENCES Interests(id)
);

INSERT INTO Interests(name, sort_order) VALUES
('Computer Science', 0),
('Sushi', 1),
('Deep Learning', 2),
('Databases', 3);
