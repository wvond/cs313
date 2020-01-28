-- drop table note;
-- drop table person;
-- drop table speaker;
-- drop table conference;
-- drop table speaker_conf;


CREATE TABLE person (
    person_id INT PRIMARY KEY,
    USER_NAME VARCHAR(80)
);

CREATE TABLE speaker (
    speaker_id INT PRIMARY KEY, --primary key
    speaker_name VARCHAR(80)
);

CREATE TABLE conference (
    conference_id INT PRIMARY KEY,
    year INT,
    month INT
);

CREATE TABLE speaker_conf (
    s_c_id INT PRIMARY KEY,
    speaker_id INT REFERENCES speaker(speaker_id),
    conference_id INT REFERENCES conference(conference_id) 
);


CREATE TABLE note (
    note_id INT PRIMARY KEY,
    note_content TEXT,
    person INT REFERENCES person(person_id), --foreign key
    s_c_id INT REFERENCES speaker_conf(s_c_id) 
 );
