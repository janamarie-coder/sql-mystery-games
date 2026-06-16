-- Record your SQL detective process here!  Write down: 
  -- 1. The SQL queries you ran
  -- 2. Any notes or insights as SQL comments
  -- 3. Your final conclusion: who did it?

-- Case #002: The Stolen Sound

-- Objective 1: Crime Scene
SELECT * FROM crime_scene
WHERE date = 19830715
AND location = 'West Hollywood Records';
-- Crime scene id: 65

-- Objective 2: Witnesses
SELECT * FROM witnesses
WHERE crime_scene_id = 65;
-- Clues: red bandana, gold watch

-- Objective 3: Suspect Match
SELECT * FROM suspects
WHERE bandana_color = 'red'
AND accessory = 'gold watch';
-- Three matches: Tony Ramirez (35), Mickey Rivera (44), Rico Delgado (97)

-- Objective 4: Interview Transcripts
SELECT * FROM interviews
WHERE suspect_id IN (35, 44, 97);
-- Tony Ramirez: alibi
-- Mickey Rivera: alibi
-- Rico Delgado: "I couldn't help it. I snapped and took the record."

-- CONCLUSION: Rico Delgado is the culprit.