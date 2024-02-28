-- Keep a log of any SQL queries you execute as you solve the mystery.
-- Time 10.15 at Bakery, 3 witnesses
SELECT * FROM crime_scene_reports WHERE month = 7 AND day = 28 AND street = "Humphrey Street";

-- For transcripts: Raymond, Ruth, Eugene are Witnesses. "Emma's Bakery"
-- Ruth says, thief went around with his car and it could be on the camera records.
-- Eugene says, she is not really remember him but he had seen him before at ATM on Legget Street while thief was withdrawing some money.
-- Raymond says, while thief leaving the bakery he was phoning with someone about flight ticket for Fiftyville tomorrow('29 June'). Also call was less than 1 minute.
SELECT * FROM interviews WHERE month = 7 AND day = 28;

-- For Ruth's Informations
SELECT * FROM bakery_security_logs WHERE month = 7 AND day = 28 AND hour = 10 AND minute < 30;
-- CARS COULD BE : exit 5P2BI95, 94KL13X, 6P58WS2, 4328GD8, G412CB7, L93JTIZ, 322W7JE, ONTHK55

-- For Eugene's Informations
SELECT * FROM atm_transactions WHERE month = 7 AND day = 28 AND atm_location = "Leggett Street" AND transaction_type = "Withdraw";
-- I've found some accounts and saved screenshot on my local

--For Raymond's Informations
  --For Phone Calls
SELECT * FROM phone_calls WHERE month = 7 AND day = 28 AND duration < 60;

  --For Flights
SELECT * FROM flights WHERE year = 2021 AND month = 7 AND day = 29 AND origin_airport_id = (SELECT id FROM airports WHERE city = "Fiftyville");
  --Not for sure but neares flight was at 12.15PM, Flight id: 23
SELECT * FROM passengers WHERE flight_id = 23;

   --CONTROL SECTION
SELECT * FROM people WHERE passport_number IN (SELECT passport_number FROM passengers WHERE flight_id = 36);
-- Thief couldn't be Dennis, Matthew and Jose because they all have some NULL values.

-- Thief is diana because every evidence fits on her.
-- Flight id is 18, destination id = 6 -> BOSTON
SELECT * FROM airports WHERE id = 6;
-- Account Check
SELECT * FROM bank_accounts WHERE person_id = (SELECT id FROM people WHERE name = "Bruce");
-- We will check for calls to find her accomplice
SELECT receiver FROM phone_calls WHERE year = 2021 AND month = 7 AND day = 28 AND duration < 60 AND caller = (SELECT phone_number FROM people WHERE name = "Bruce");
-- Receiver number = (375) 555-8161
SELECT * FROM people WHERE phone_number = "(375) 555-8161";
-- THIEF = BRUCE
-- Accomplicer = ROBIN!
-- LOCATION = New York City, LaGuardia Airport
