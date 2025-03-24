USE HealthDB;

SELECT * FROM healthcare_table;

--1. Basic Patient Count by Hospital 

SELECT Hospital, COUNT(*) AS PatientCount
FROM healthcare_table
GROUP BY Hospital
ORDER BY PatientCount DESC;

--2. Average Length of Stay per Hospital

SELECT Hospital,
       AVG(DATEDIFF(Day, 
           TRY_CONVERT(DATE, [Date_of_Admission], 103),
           TRY_CONVERT(DATE, [Discharge_Date], 103)
       )) AS AvgLengthOfStay
FROM healthcare_table
WHERE TRY_CONVERT(DATE, [Discharge_Date], 103) IS NOT NULL
GROUP BY Hospital
ORDER BY AvgLengthOfStay;

--3. Total Billing Amount by Hospital

SELECT Hospital, SUM(Billing_Amount) AS TotalBilling
FROM healthcare_table
GROUP BY Hospital
ORDER BY TotalBilling DESC;

--4.Common Medical Conditions

SELECT TOP 10 Medical_Condition, COUNT(*) AS Frequency
FROM healthcare_table
GROUP BY Medical_Condition
ORDER BY Frequency DESC;

--5. Patient Demographics by Gender

SELECT Gender, COUNT(*) AS PatientCount, AVG(Age) AS AvgAge
FROM healthcare_table
GROUP BY Gender;

--6. Top Doctors by Number of Patients

SELECT TOP 10 Doctor, COUNT(*) AS PatientCount
FROM healthcare_table
GROUP BY Doctor
ORDER BY PatientCount DESC;

--7. Insurance Provider Analysis

SELECT Insurance_Provider, SUM(Billing_Amount) AS TotalBilling, COUNT(*) AS PatientCount
FROM healthcare_table
GROUP BY Insurance_Provider
ORDER BY TotalBilling DESC;

--8. Average Billing Amount by Medical Condition

SELECT Medical_Condition,
       AVG([Billing_Amount]) AS AvgBilling
FROM healthcare_table
GROUP BY [Medical_Condition]
ORDER BY AvgBilling DESC;

--9. Distribution of Admissions by Type and Gender

SELECT Admission_Type,
       Gender,
       COUNT(*) AS AdmissionCount
FROM healthcare_table
GROUP BY [Admission_Type], Gender
ORDER BY [Admission_Type], AdmissionCount DESC;

--10.  Longest Length of Stay per Hospital

SELECT Hospital,
       MAX(DATEDIFF(Day, [Date_of_Admission], [Discharge_Date])) AS MaxLengthOfStay
FROM healthcare_table
WHERE [Discharge_Date] IS NOT NULL
GROUP BY Hospital
ORDER BY MaxLengthOfStay DESC;




