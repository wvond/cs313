\echo '2a. How many events are there?'
SELECT COUNT(*) FROM w5_event;

\echo '2b. How many participants are there?'
SELECT COUNT(*) FROM w5_participant;

\echo '3a. What is the third event when sorted alphabetically (by name)? '
SELECT name 
FROM w5_event
ORDER BY name
LIMIT 1
OFFSET 2;

\echo '3b. What is the third event when sorted by ID? '
SELECT name 
FROM w5_event
ORDER BY id
LIMIT 1
OFFSET 2;

\echo '4a. List the names alphabetically of all the participants in the ''Toughman Utah'' competition'
SELECT p.name
FROM w5_event_participant ep INNER JOIN w5_event e ON (ep.event_id = e.id)
INNER JOIN w5_participant p ON (ep.participant_id = p.id)
WHERE e.name = 'Toughman Utah'
ORDER BY name; 

\echo '4b. List the names (sorted by id) of all the participants in the ''Kauai Marathon'' competition'
SELECT p.name
FROM w5_event_participant ep INNER JOIN w5_event e ON (ep.event_id = e.id)
INNER JOIN w5_participant p ON (ep.participant_id = p.id)
WHERE e.name = 'Kauai Marathon'
ORDER BY p.id;

\echo '5a. How many competitions has ''Black Panther'' competed in?'
SELECT COUNT(*)
FROM (SELECT e.name
FROM w5_event e
INNER JOIN w5_event_participant ep ON e.id = ep.event_id
INNER JOIN w5_participant p ON ep.participant_id = p.id
WHERE p.name = 'Black Panther') AS count;

\echo '5b. How can you verify that your count is correct?'  
SELECT e.name AS event_name, p.name AS particpant
FROM w5_event e
INNER JOIN w5_event_participant ep ON e.id = ep.event_id
INNER JOIN w5_participant p ON ep.participant_id = p.id
WHERE p.name = 'Black Panther';

\echo '5c. Who has competed in the most competitions? How many have they competed in?'
SELECT p.name, COUNT(e.id) as num_events
FROM w5_participant p
INNER JOIN w5_event_participant ep ON p.id = ep.participant_id
INNER JOIN w5_event e ON ep.event_id = e.id
GROUP BY p.name
ORDER BY num_events DESC
LIMIT 1;

\echo '5d. Who has competed in the least competitions? How many have they competed in?'
\echo '5d. people who have competed in 1 or more'
SELECT name, num_events
FROM(SELECT p.name AS name, COUNT(e.id) as num_events
FROM w5_participant p
INNER JOIN w5_event_participant ep ON p.id = ep.participant_id
INNER JOIN w5_event e ON ep.event_id = e.id
GROUP BY p.name) event_counts
WHERE num_events = 1;

\echo '5d. - people that didn''t compete in any'
SELECT name FROM w5_participant WHERE id NOT IN 
(SELECT participant_id FROM w5_event_participant);

\echo '6a. Is there anyone who has competed in the same competition twice? '
SELECT name, event_name, num_same
FROM (SELECT p.name AS name, e.name AS event_name, COUNT(e.id) as num_same
FROM w5_participant p
INNER JOIN w5_event_participant ep ON p.id = ep.participant_id
INNER JOIN w5_event e ON ep.event_id = e.id
GROUP BY p.name, e.name) event_counts
WHERE num_same = 2
ORDER BY num_same DESC;

\echo '6b. Which event had the most competitors? '
SELECT event_name, COUNT(name) as num_participants
FROM (SELECT p.name AS name, e.name AS event_name
FROM w5_participant p
INNER JOIN w5_event_participant ep ON p.id = ep.participant_id
INNER JOIN w5_event e ON ep.event_id = e.id
GROUP BY p.name, e.name) AS event_participants
GROUP BY event_name
ORDER BY num_participants DESC
LIMIT 3; 

\echo '6c. Which event had the least competitors? '
SELECT event_name, COUNT(name) as num_participants
FROM (SELECT p.name AS name, e.name AS event_name
FROM w5_participant p
INNER JOIN w5_event_participant ep ON p.id = ep.participant_id
INNER JOIN w5_event e ON ep.event_id = e.id
GROUP BY p.name, e.name) AS event_participants
GROUP BY event_name
ORDER BY num_participants ASC
LIMIT 3;

\echo '6d. List all competitors that competed in the same event at least once '
SELECT name, event_name, num_same
FROM (SELECT p.name AS name, e.name AS event_name, COUNT(e.id) as num_same
FROM w5_participant p
INNER JOIN w5_event_participant ep ON p.id = ep.participant_id
INNER JOIN w5_event e ON ep.event_id = e.id
GROUP BY p.name, e.name) event_counts
WHERE num_same > 1
ORDER BY num_same DESC;