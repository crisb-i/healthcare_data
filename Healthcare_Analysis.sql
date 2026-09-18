CREATE TABLE healthcare (
id bigserial,
name varchar(50),
age varchar(3),
gender varchar(10),
blood_type varchar(10),
med_cond varchar(75),
date_admission date,
doc varchar(50),
hospital varchar(50),
insurance varchar(25),
bill_amount decimal(10,2),
room int,
admission varchar(10),
date_discharge date,
meds varchar(25),
test_result varchar(20)
);

SELECT *
FROM healthcare; /* view data to ensure import was successful */

CREATE TABLE healthcare_back1 AS SELECT * FROM healthcare; /* creating back up */

SELECT *
FROM healthcare_back1;

INSERT INTO healthcare SELECT * FROM healthcare_back1;

ALTER TABLE healthcare ALTER COLUMN age TYPE int USING age::int; /* changing age into int for analysis */

CREATE TABLE healthcare
FROM healthcare_back1;
SELECT *
FROM healthcare
ORDER BY name;

SELECT DISTINCT name /*several duplicate names needing to be removed.*/
FROM healthcare;

CREATE TABLE healthcare_temp LIKE healthcare;

INSERT INTO healthcare_temp(id, name, age, gender, blood_type, med_cond, date_admission, doc, hospital, insurance, bill_amount, room, admission, date_discharge, meds, test_results)

DELETE FROM
	healthcare a USING healthcare b
WHERE
	a.name = b. name AND a.date_admission = b.date_admission AND a.date_discharge = b.date_discharge


/* ensuring the columns do not have missing values, different entries than what should be */

SELECT DISTINCT gender
FROM healthcare;

SELECT DISTINCT blood_type
FROM healthcare;

SELECT DISTINCT med_cond
FROM healthcare;

SELECT DISTINCT insurance
FROM healthcare;

SELECT DISTINCT room
FROM healthcare;

SELECT DISTINCT admission
FROM healthcare;

SELECT DISTINCT meds
FROM healthcare;

SELECT DISTINCT test_result
FROM healthcare;

UPDATE healthcare SET name = LOWER(name); /* change case of name values to lower since case was at random */

SELECT *
FROM healthcare
ORDER BY id;

SELECT name, bill_amount /*check to see the negative bill amounts (could be an overpayment or credit from the hospital) */
FROM healthcare
WHERE bill_amount < 0
ORDER BY bill_amount;
