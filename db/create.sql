/* DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS catch;
DROP TABLE IF EXISTS species;
DROP TABLE IF EXISTS location;
DROP TABLE IF EXISTS fish; */

CREATE TABLE IF NOT EXISTS photo
( photo_id      SERIAL  NOT NULL    PRIMARY KEY
, photo_url     TEXT
);

CREATE TABLE IF NOT EXISTS catch
( catch_id      SERIAL  NOT NULL    PRIMARY KEY
, catch_method  VARCHAR(50)
, catch_notes   TEXT
);

CREATE TABLE IF NOT EXISTS species
( species_id          SERIAL  NOT NULL    PRIMARY KEY
, species_scientific  VARCHAR(50)
, species_common      VARCHAR(50)
, species_details     TEXT
);

CREATE TABLE IF NOT EXISTS location
( location_id           SERIAL  NOT NULL    PRIMARY KEY
, city_state            VARCHAR(50)
, location_details      TEXT
, location_directions   TEXT
, access_type           VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS fish
( fish_id     SERIAL      NOT NULL    PRIMARY KEY
, fish_weight NUMERIC   
, length      NUMERIC
, time_caught TIME
, date_caught DATE 
, location_id INT       NOT NULL    REFERENCES location(location_id)
, species_id  INT       NOT NULL    REFERENCES species(species_id)
, photo_id    INT       NOT NULL    REFERENCES photo(photo_id)
, catch_id    INT       NOT NULL    REFERENCES catch(catch_id)  
);