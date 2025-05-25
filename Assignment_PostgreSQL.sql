-- Active: 1747456666201@@localhost@5432@ph
CREATE DATABASE conservation_db;


CREATE TABLE rangers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    region VARCHAR(100) NOT NULL
);

-- DROP TABLE rangers;

-- DROP TABLE species;

-- DROP TABLE sightings;



CREATE TABLE species (
    species_id SERIAL PRIMARY KEY,
    common_name VARCHAR(100) NOT NULL,
    scientific_name VARCHAR(150) NOT NULL,
    discovery_date DATE NOT NULL,
    conservation_status VARCHAR(50) NOT NULL
);

CREATE TABLE sightings (
    sighting_id SERIAL PRIMARY KEY,
    ranger_id INT REFERENCES rangers(id) NOT NULL,
    species_id INT REFERENCES species(species_id) NOT NULL,
    sighting_time TIMESTAMP NOT NULL,
    location VARCHAR(100) NOT NULL,
    notes TEXT
);

INSERT INTO rangers (name, region) VALUES
('Alice Green', 'Northern Hills'),
('Bob White', 'River Delta'),
('Carol King', 'Mountain Range');



INSERT INTO species (common_name, scientific_name, discovery_date, conservation_status) VALUES
('Snow Leopard', 'Panthera uncia', '1775-01-01', 'Endangered'),
('Bengal Tiger', 'Panthera tigris tigris', '1758-01-01', 'Endangered'),
('Red Panda', 'Ailurus fulgens', '1825-01-01', 'Vulnerable'),
('Asiatic Elephant', 'Elephas maximus indicus', '1758-01-01', 'Endangered');


INSERT INTO sightings (species_id, ranger_id, location, sighting_time, notes) VALUES
(1, 1, 'Peak Ridge', '2024-05-10 07:45:00', 'Camera trap image captured'),
(2, 2, 'Bankwood Area', '2024-05-12 16:20:00', 'Juvenile seen'),
(3, 3, 'Bamboo Grove East', '2024-05-15 09:10:00', 'Feeding observed'),
(1, 2, 'Snowfall Pass', '2024-05-18 18:30:00', NULL);

SELECT * FROM rangers;
SELECT * FROM species;  
SELECT * FROM sightings;

-- problem 01
INSERT INTO rangers (name, region) VALUES ('Derek Fox', 'Coastal Plains');

-- problem 02
SELECT COUNT(*) AS unique_species_count FROM (
    SELECT species_id
    FROM sightings
    GROUP BY species_id
) AS unique_species;

SELECT COUNT(DISTINCT species_id) AS unique_species_count
FROM sightings;

-- problem-03
SELECT sighting_id, species_id, ranger_id, location, sighting_time, notes
FROM sightings
WHERE location LIKE '%Pass%';

-- problem-04
SELECT




-- problem 07
UPDATE species
SET conservation_status = 'Historic'
WHERE discovery_date < '1800-01-01';