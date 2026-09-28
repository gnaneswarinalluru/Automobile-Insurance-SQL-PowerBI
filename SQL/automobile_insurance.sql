-- view full dataset ---

SELECT *
FROM auto_table;

DESCRIBE auto_table;

--  task-2 Frequency of Different Complaints (Upheld, Not Upheld, Question of Fact)  A. Overall Complaint Type Frequency -----
 
 
SELECT 
    SUM(Upheld_Complaints) AS upheld_total,
    SUM(Question_of_Fact_Complaints) AS question_total,
    SUM(Not_Upheld_Complaints) AS not_upheld_total,
    SUM(Total_Complaints) AS total_complaints
FROM auto_table;


----  (b) Complaint Types for a Chosen Company (Replace 'GEICO' with your company) ---- 

SELECT 
    Company_Name,
    SUM(Upheld_Complaints) AS upheld_total,
    SUM(Question_of_Fact_Complaints) AS question_total,
    SUM(Not_Upheld_Complaints) AS not_upheld_total,
    SUM(Total_Complaints) AS total_complaints
FROM auto_table
WHERE Company_Name LIKE '%GEICO%'
GROUP BY Company_Name;


-- task-3 Complaint Trend Over the Years (a) Total Complaints by Year ---

SELECT 
    `Filing_Year`,
     SUM(Total_Complaints) AS total_complaints
FROM auto_table
GROUP BY `Filing_Year`
ORDER BY `Filing_Year`;


-- (B) Complaint Trend for One Company --- 

SELECT 
    `Company_Name`,
    `Filing_Year`,
    SUM(`Total_Complaints`) AS total_complaints
FROM auto_table
WHERE `Company_Name` LIKE '%GEICO%'
GROUP BY `Company_Name`, `Filing_Year`
ORDER BY `Filing_Year`;


--- task-4 Complaint Ratio Ranking (Find worst/best companies) (a) Best Performing Companies ---


SELECT 
    `Company_Name`, 
    `Ratio`, 
    `Ranking`
FROM auto_table
ORDER BY `Ratio` DESC
LIMIT 10;


--- task-5 Premium Trend Over the Years (A) Total Premiums Written by Year  --- 

SELECT 
    `Filing_Year`,
    SUM(`Premiums_Written`) AS total_premiums
FROM auto_table
GROUP BY `Filing_Year`
ORDER BY `Filing_Year`;


-- (B) Premium Trend for One Company --

SELECT
    `Company_Name`,
    `Filing_Year`,
    SUM(`Premiums_Written`) AS premiums_million
FROM auto_table
WHERE `Company_Name` LIKE '%GEICO%'
GROUP BY `Company_Name`, `Filing_Year`
ORDER BY `Filing_Year`;


-- task-6 Identify Causes: Claims vs Premium Trend(If you want a correlation between complaints & premiums)

SELECT
    `Company_Name`,
    `Filing_Year`,
    SUM(`Total_Complaints`) AS total_complaints,
    SUM(`Premiums_Written`) AS premiums_million
FROM auto_table
GROUP BY `Company_Name`, `Filing_Year`
ORDER BY `Filing_Year`;


-- task-7 Dashboard: Comparison of 5 Companies (Replace companies with your selected 5)--

SELECT 
    `Company_Name`,
    `Filing_Year`,
    `Ratio`,
    `Upheld_Complaints`,
    `Question_of_Fact_Complaints`,
    `Not_Upheld_Complaints`,
    `Total_Complaints`,
    `Premiums_Written`
FROM auto_table
WHERE `Company_Name` IN (
    'GEICO', 
    'Allstate Insurance Company', 
    'State Farm Mutual Auto Insurance', 
    'Liberty Mutual Insurance', 
    'Progressive Casualty Insurance'
)
ORDER BY `Company_Name`, `Filing_Year`;


-- task-8 Check Complaint Composition (Pie Chart Data) -- 

SELECT 
    SUM(`Upheld_Complaints`) AS upheld_total,
    SUM(`Question_of_Fact_Complaints`) AS question_total,
    SUM(`Not_Upheld_Complaints`) AS not_upheld_total
FROM auto_table;


-- task-9 Top 5 Companies by Premium (Market Leaders) --

SELECT
    `Company_Name`,
    SUM(`Premiums_Written`) AS premium_million
FROM auto_table
GROUP BY `Company_Name`
ORDER BY premium_million DESC
LIMIT 5;


-- task-10 Validate Rank Calculation -- 

SELECT 
    `Company_Name`,
    `Ranking`
FROM auto_table
ORDER BY `Ranking` ASC
LIMIT 30;

