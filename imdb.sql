drop database if exists imdb;
CREATE DATABASE IF NOT EXISTS imdb;
USE imdb;


CREATE TABLE if not exists film(
    film_id int AUTO_INCREMENT,
    title VARCHAR(40),
    description TEXT,
    release_year DATE,
    PRIMARY KEY(film_id)
);

CREATE TABLE if not exists actor (
    actor_id int AUTO_INCREMENT,
    first_name varchar(20),
    last_name varchar(20),
    PRIMARY KEY(actor_id)
);

CREATE TABLE if not exists film_actor (
    actor_id int,
    film_id int,
    PRIMARY KEY (actor_id,film_id)
);

ALTER TABLE film ADD COLUMN last_update DATE;
ALTER TABLE actor ADD COLUMN last_update DATE;
alter table film_actor add constraint actor_id_fk FOREIGN KEY (actor_id) REFERENCES actor(actor_id);
alter table film_actor add constraint film_id_fk FOREIGN KEY (film_id) REFERENCES film(film_id);

INSERT INTO film (title, description, release_year, last_update) VALUES
('The Shawshank Redemption', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '1994-10-14', '2024-04-01'),
('The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', '1972-03-24', '2024-04-01');

INSERT INTO actor (first_name, last_name, last_update) VALUES
('Tim', 'Robbins', '2024-04-01'),
('Morgan', 'Freeman', '2024-04-01'),
('Marlon', 'Brando', '2024-04-01'),
('Al', 'Pacino', '2024-04-01'),
('Christian', 'Bale', '2024-04-01');

INSERT INTO film_actor (actor_id, film_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 1);

select * from actor;
SELECT * FROM film;
SELECT * FROM film_actor;