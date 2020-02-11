INSERT INTO fish 
(fish_weight, length, time_caught, date_caught, location_id, species_id, photo_id, catch_id)
VALUES
(13.2, 26, '10:02:00', '2/18/2019', 1, 1, 1, 1);

INSERT INTO catch
(catch_method, catch_notes)
VALUES
('Bead Plunking, Spinner', 'Drift boat on the Trask River.');

INSERT INTO photo
(photo_url)
VALUES
('https://www.facebook.com/plugins/post.php?href=https%3A%2F%2Fwww.facebook.com%2Fphoto.php%3Ffbid%3D10205526407316416%26set%3Da.1234345075615%26type%3D3&width=500');

INSERT INTO location
(city_state, location_details, location_directions, access_type)
VALUES
('Tillamook, OR', 'Just past a quick flow area where the river drops through some rapids.', 'Float down from the slide boat ramp.', 'Drift Boat');

INSERT INTO species
(species_scientific, species_common, species_details)
VALUES
('Oncorhynchus mykiss', 'Steelhead trout', 'Behave similar to a salmon but look like a trout.');

INSERT INTO fish 
(fish_weight, length, time_caught, date_caught, location_id, species_id, photo_id, catch_id)
VALUES
(1.4, 8, '14:08:00', '1/14/2020', 2, 2, 2, 2);

INSERT INTO catch
(catch_method, catch_notes)
VALUES
('Fly, Nymph', 'Bank fishing on the Teton River.');

INSERT INTO photo
(photo_url)
VALUES
('https://www.tetonwater.org/wp-content/uploads/2018/06/thumb-teton-river-trout.jpg');

INSERT INTO location
(city_state, location_details, location_directions, access_type)
VALUES
('Salem, ID', 'Through some trees in a small pool near the bank.', 'Head west out of Salem Idaho in Madison County.', 'Bank Fishing');

INSERT INTO species
(species_scientific, species_common, species_details)
VALUES
('Oncorhynchus clarkii bouvieri', 'Yellowstone Cutthroat trout', 'Subspecies of a cutthroat trout found only in Wyoming, Idaho and Montana.');
