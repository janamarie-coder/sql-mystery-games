-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- Case #001: The Vanishing Briefcase

-- Objective 1: Crime Scene
SELECT * FROM crime_scene
WHERE location = 'Blue Note Lounge';
-- Clue: Man in trench coat with scar on left cheek

-- Objective 2: Suspect Match
SELECT * FROM suspects
WHERE attire = 'trench coat'
AND scar = 'left cheek';
-- Two matches: Frankie Lombardi (id 3) and Vincent Malone (id 183)

-- Objective 3: Interview Transcripts
SELECT * FROM interviews
WHERE suspect_id = 3 OR suspect_id = 183;
-- Frankie Lombardi: NULL
-- Vincent Malone: "I wasn't going to steal it, but I did."

-- CONCLUSION: Vincent Malone is the culprit.

-- Case Solved!
-- Congratulations, detective! You have successfully identified Vincent Malone as the culprit.

--Explanation
--First, you retrieved the crime scene details from the 'crime_scene' table which mentioned a man in a trench coat with a scar on his left cheek.
-- Next, querying the 'suspects' table narrowed the field down to two individuals. 
--Finally, examining the 'interviews' table confirmed that Vincent Malone indeed stole the briefcase.