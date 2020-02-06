DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS catch;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS fish;

CREATE TABLE photo
( photo_id      SERIAL  NOT NULL    PRIMARY KEY
, photo_url     TEXT
);

CREATE TABLE catch
( catch_id      SERIAL  NOT NULL    PRIMARY KEY
, catch_method  VARCHAR(50)
, catch_notes   TEXT
);

CREATE TABLE species
( species_id          SERIAL  NOT NULL    PRIMARY KEY
, species_scientific  VARCHAR(50)
, species_common      VARCHAR(50)
, species_details     TEXT
);

CREATE TABLE location
( location_id           SERIAL  NOT NULL    PRIMARY KEY
, city_state            VARCHAR(50)
, location_details      TEXT
, location_directions   TEXT
, access_type           VARCHAR(50)
);

CREATE TABLE fish
( fish_id     SERIAL      NOT NULL    PRIMARY KEY
, fish_weight NUMERIC   
, length      NUMERIC
, time_caught TIME
, date_caught DATE 
, location_id INT       FOREIGN KEY
, species_id  INT       FOREIGN KEY
, photo_id    INT       FOREIGN KEY
, catch_id    INT       FOREIGN KEY  
);