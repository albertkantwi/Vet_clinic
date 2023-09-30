/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values
    ('Agumon', '2020-02-03', 0, true, 10.23),
    ('Gabumon', '2018-11-15', 2, true, 8),
    ('Pikachu', '2021-01-07', 1, false, 15.04),
    ('Devimon', '2017-05-12', 5, true, 11);


    INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) values
    ('Charmander', '2020-02-08', 0, false, -11),
    ('Plantmon', '2021-11-15', 2, true, -5.7),
    ('Squirtle', '1993-04-02', 3, false, -12.13),
    ('Angemon', '2005-06-12', 1, true, -45),
    ('Boarmon', '2005-06-07', 7, true, 20.4),
    ('Blossom', '1998-10-13', 3, true, 17),
    ('Ditto', '2022-05-14', 4, true, 22);


    INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);   

 INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');

UPDATE animals AS a
SET species_id = s.id
FROM species AS s
WHERE
    (a.name LIKE '%mon' AND s.name = 'Digimon')
    OR
    (a.species_id IS NULL AND s.name = 'Pokemon');

UPDATE animals AS a
SET owner_id = o.id
FROM owners AS o
WHERE
    CASE
        WHEN a.name = 'Agumon' THEN o.full_name = 'Sam Smith'
        WHEN a.name IN ('Gabumon', 'Pikachu') THEN o.full_name = 'Jennifer Orwell'
        WHEN a.name IN ('Devimon', 'Plantmon') THEN o.full_name = 'Bob'
        WHEN a.name IN ('Charmander', 'Squirtle', 'Blossom') THEN o.full_name = 'Melody Pond'
        WHEN a.name IN ('Angemon', 'Boarmon') THEN o.full_name = 'Dean Winchester'
    END;