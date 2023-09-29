/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name like '%mon';   
SELECT * FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


-- Vet clinic database: query and update animals table (1)
BEGIN; -- Begin transaction
UPDATE animals SET species = 'unspecified'; -- Update the species to unspecified value
SELECT * FROM animals; --verify the the chnages
ROLLBACK;          --Rollback the transaction 
SELECT * FROM animals; --Verify that the species columns went back to the state before the transaction.


-- Inside a transaction: (2)
BEGIN;  -- Begin transaction
UPDATE animals SET species = 'digimon' WHERE name like '%mon'; -- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon. 
UPDATE animals SET species = 'pokemon' WHERE species IS NULL; --Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
SELECT  * FROM animals; --Verify that changes were made.
COMMIT; -- Commit the transaction.
SELECT  * FROM animals; --Verify that changes persist after commit.


-- Inside a transaction (3)
BEGIN; -- Start new transaction
DELETE FROM animals; -- Delete all records
SELECT  * FROM animals; --Verfiy that all rows are deleted
ROLLBACK; -- roll back the transaction.
SELECT  * FROM animals; --After the rollback verify if all records in the animals table still exists


-- Inside a transaction: (4)

 BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';  -- Delete all animals born after Jan 1st, 2022.
SELECT  * FROM animals;
SAVEPOINT sp1;  -- Create a savepoint for the transaction.
UPDATE animals SET weight_kg = weight_kg * -1; --Update all animals' weight to be their weight multiplied by -1.
ROLLBACK TO sp1;  -- Rollback to the savepoint
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0; -- Update all animals' weights that are negative to be their weight multiplied by -1.
COMMIT;  -- Commit transaction


        -- Write queries to answer the following questions:    

-- How many animals are there?
SELECT COUNT(*) FROM animals;
-- How many animals have never tried to escape?
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;
-- Who escapes the most, neutered or not neutered animals?
 SELECT neutered, COUNT(escape_attempts) AS escape_attempts FROM animals GROUP BY neutered;
 OR
  SELECT neutered, AVG(escape_attempts) AS escape_attempts FROM animals GROUP BY neutered;

--   What is the minimum and maximum weight of each type of animal?
 SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

--  What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;
