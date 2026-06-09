-- Record your SQL detective process here!  Write down: 
--   1. The SQL queries you ran
--   2. Any notes or insights as SQL comments
--   3. Your final conclusion: who did it?

-- Using these SQL clauses will help you solve the mystery: 
--    SELECT, FROM, WHERE, AND, OR, ORDER BY, LIMIT, LIKE, DISTINCT, BETWEEN, AS

-- writing a comment like this

-- selecting all columns from the crime scene report
SELECT * FROM crime_scene_report;
-- Step 1: find the crime scene report
WHERE type = 'murder'
  AND date = 20180115
  AND city = 'SQL City';
-- Result: 2 witnesses. First lives at last house on Northwestern Dr.
-- Second witness named Annabel lives on Franklin Ave.

-- Step 2: find the witnesses
SELECT * FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;
-- Result: Morty Schapiro, id 14887

SELECT * FROM person
WHERE name LIKE 'Annabel%'
  AND address_street_name = 'Franklin Ave';
-- Result: Annabel Miller, id 16371

-- Step 3: read their interviews
SELECT * FROM interview
WHERE person_id = 14887
   OR person_id = 16371;
-- Morty: saw a man with a Get Fit Now bag, membership starts with 48Z, gold member, plate includes H42W
-- Annabel: recognized the killer from the gym on January 9

-- Step 4: find gold members whose ID starts with 48Z
SELECT * FROM get_fit_now_member
WHERE id LIKE '48Z%'
  AND membership_status = 'gold';
-- Result: Joe Germuska (48Z7A) and Jeremy Bowers (48Z55)

-- Step 5: check who was at the gym on Jan 9
SELECT * FROM get_fit_now_check_in
WHERE membership_id LIKE '48Z%'
  AND check_in_date = 20180109;
-- Result: both were there

-- Step 6: check the license plate H42W
SELECT * FROM drivers_license
WHERE plate_number LIKE '%H42W%';
-- Result: 3 matches, 2 male

SELECT * FROM person
WHERE license_id = 423327
   OR license_id = 664760;
-- Result: Jeremy Bowers matches both clues (gold member + plate)

-- MURDERER: Jeremy Bowers 
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
SELECT value FROM solution;

-- BONUS: find the mastermind

-- Step 7: read Jeremy's interview
SELECT * FROM interview
WHERE person_id = 67318;
-- Hired by a woman, red hair, 65-67", Tesla Model S, attended SQL Symphony Concert 3x in Dec 2017

-- Step 8: find her by appearance and car
SELECT * FROM drivers_license
WHERE hair_color = 'red'
  AND gender = 'female'
  AND car_make = 'Tesla'
  AND car_model = 'Model S'
  AND height BETWEEN 65 AND 67;
-- Result: 3 candidates, license IDs 202298, 291182, 918773

-- Step 9: find who attended SQL Symphony Concert 3x
SELECT * FROM facebook_event_checkin
WHERE person_id IN (
  SELECT id FROM person
  WHERE license_id IN (202298, 291182, 918773)
)
AND event_name = 'SQL Symphony Concert'
AND date BETWEEN 20171201 AND 20171231;
-- Result: person_id 99716 attended 3 times

-- Step 10: get her name
SELECT * FROM person
WHERE id = 99716;
-- Result: Miranda Priestly

-- MASTERMIND: Miranda Priestly 
INSERT INTO solution VALUES (1, 'Miranda Priestly');
SELECT value FROM solution;