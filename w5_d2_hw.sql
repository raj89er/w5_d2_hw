
-- Creating all tables without the connections to avoid issues...

CREATE TABLE Paiduser (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(25),
    pw_hash VARCHAR,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

SELECT *
FROM Paiduser;

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(30),
    phone VARCHAR,
    member BOOLEAN,
    user_id INTEGER
);

SELECT *
FROM Customer;

CREATE TABLE Showtime (
    showtime_id SERIAL PRIMARY KEY,
    start_time TIME,
    end_time TIME,
    date DATE
);

SELECT *
FROM Showtime;

CREATE TABLE Ticket (
    ticket_id SERIAL PRIMARY KEY,
    price NUMERIC,
    purchase_date TIMESTAMP,
    seat_number INTEGER
);

SELECT *
FROM Ticket;

CREATE TABLE Movie (
    movie_id SERIAL PRIMARY KEY,
    movie_title VARCHAR,
    release_date DATE,
    director VARCHAR,
    duration INTEGER,
    rating VARCHAR
);

SELECT *
FROM Movie;

CREATE TABLE Theater (
    theater_id SERIAL PRIMARY KEY,
    name VARCHAR,
    location VARCHAR,
    capacity INTEGER
);

SELECT *
FROM Theater;

CREATE TABLE Genre (
    genre_id SERIAL PRIMARY KEY,
    name VARCHAR
);

SELECT *
FROM Genre;

-- adding connectiong  #1 from ERD 
ALTER TABLE Customer
ADD COLUMN paiduser_id INTEGER,
ADD FOREIGN KEY (paiduser_id) REFERENCES Paiduser(user_id);

-- adding connection #2 from ERD
ALTER TABLE Ticket
ADD COLUMN user_id INTEGER,
ADD FOREIGN KEY (user_id) REFERENCES Paiduser(user_id);

-- adding connection #3 from ERD
ALTER TABLE Ticket
ADD COLUMN customer_id INTEGER NOT NULL,
ADD FOREIGN KEY (customer_id) REFERENCES Customer(customer_id);

-- adding connection #4 from ERD
ALTER TABLE Ticket
ADD COLUMN showtime_id INTEGER NOT NULL,
ADD FOREIGN KEY (showtime_id) REFERENCES Showtime(showtime_id);

-- adding connection #5 from ERD
ALTER TABLE Showtime
ADD COLUMN movie_id INTEGER,
ADD FOREIGN KEY (movie_id) REFERENCES Movie(movie_id);

-- adding connection #6 from ERD
ALTER TABLE Showtime
ADD COLUMN theater_id INTEGER NOT NULL,
ADD FOREIGN KEY (theater_id) REFERENCES Theater(theater_id);

-- create MovieGenre Junction with connection #7 & #9 from ERD
CREATE TABLE MovieGenre (
    movie_id INTEGER,
    genre_id INTEGER,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- adding connection #8 from ERD
ALTER TABLE Movie
ADD COLUMN genre_id INTEGER,
ADD FOREIGN KEY (genre_id) REFERENCES Genre(genre_id);

































