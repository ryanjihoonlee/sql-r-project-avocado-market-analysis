-- Avocado Market Analysis

SELECT *
FROM avocado;

-- Question 1
SELECT year, SUM(TotalVolume) AS TotalVolume, AVG(AveragePrice) AS AveragePrice
FROM avocado
GROUP BY year
ORDER BY year ASC;

-- Question 2
SELECT region, SUM(TotalVolume) AS TotalVolume
FROM avocado
WHERE region IN ('West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains')
GROUP BY region
ORDER BY TotalVolume DESC;

SELECT region, SUM(TotalVolume) AS TotalVolume
FROM avocado
WHERE region IN ('LosAngeles', 'NewYork', 'DallasFtWorth', 'PhoenixTucson', 'Houston', 'Denver', 'BaltimoreWashington', 'SanFrancisco', 'Chicago')
GROUP BY region
ORDER BY TotalVolume DESC;

-- Question 3
SELECT year, SUM(plu4046) AS SmallHassAvocado, SUM(plu4225) AS LargeHassAvocado, SUM(plu4770) AS ExtraLargeHassAvocado
FROM avocado
GROUP BY year
ORDER BY year ASC;

-- Question 4
SELECT year, region, MAX(TotalVolume) AS TotalVolume
FROM avocado
WHERE region IN ('LosAngeles', 'NewYork', 'DallasFtWorth', 'PhoenixTucson', 'Houston', 'Denver', 'BaltimoreWashington', 'SanFrancisco', 'Chicago')
GROUP BY year, region
ORDER BY year ASC, TotalVolume DESC;

SELECT year, MAX(TotalVolume) AS TotalVolume
FROM avocado
WHERE region IN ('TotalUS')
GROUP BY year
ORDER BY year ASC, TotalVolume DESC;

-- Calculates and displays the average price of avocados for each year, sorted in ascending order by year.
SELECT year, AVG(AveragePrice) AS AveragePrice
FROM avocado
GROUP BY year
ORDER BY year ASC;

-- Calculates and displays the total volume and the sums of specific avocado types (PLU4046, PLU4225, PLU4770) for each year, excluding specified regions, sorted in ascending order by year.
SELECT year, SUM(TotalVolume) AS TotalVolume, SUM(plu4046) AS PLU4046, SUM(plu4225) AS PLU4225, SUM(plu4770) AS PLU4770
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains')
GROUP BY year
ORDER BY year ASC;

-- Calculates and displays the total volume of avocados for each region, excluding specified regions, sorted in descending order by total volume.
SELECT region, SUM(TotalVolume) AS TotalVolume
FROM avocado
WHERE region NOT IN ('West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains')
GROUP BY region
ORDER BY TotalVolume DESC; 

-- Calculates and displays the total volume of avocados for each region, excluding specified regions, sorted in descending order by total volume, and limited to the top 10 regions.
SELECT region, SUM(TotalVolume) AS TotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains')
GROUP BY region
ORDER BY TotalVolume DESC
LIMIT 10;

-- Calculates and displays the total volume and the sums of specific avocado types (PLU4046, PLU4225, PLU4770) for each year in the Los Angeles region, sorted in ascending order by year.
SELECT year, SUM(TotalVolume) AS TotalVolume, SUM(plu4046) AS PLU4046, SUM(plu4225) AS PLU4225, SUM(plu4770) AS PLU4770
FROM avocado
WHERE region = 'LosAngeles'
GROUP BY year
ORDER BY year ASC;

-- Calculates and displays the total volume and the average price of avocados for each year, sorted in ascending order by year.
SELECT year, SUM(TotalVolume) AS TotalVolume, AVG(AveragePrice) AS AveragePrice
FROM avocado
GROUP BY year
ORDER BY year ASC;

-- Calculates and displays the maximum total volume of avocados for each region in 2015, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2015'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2016, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2016'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2017, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions. 
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2017'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2018, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions. 
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2018'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2019, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions. 
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2019'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2020, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions. 
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2020'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2021, excluding specified regions, sorted in descending order by the maximum total volume, and limits the results to the top 10 regions. 
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2021'
GROUP BY region
ORDER BY MaxTotalVolume DESC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2015, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2015'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2016, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2016'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2017, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2017'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2018, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2018'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2019, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2019'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2020, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2020'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the maximum total volume of avocados for each region in 2021, excluding specified regions, sorted in ascending order by the maximum total volume, and limits the results to the top 10 regions.
SELECT region, MAX(TotalVolume) AS MaxTotalVolume
FROM avocado
WHERE region NOT IN ('TotalUS', 'West', 'California', 'SouthCentral', 'Northeast', 'Southeast', 'GreatLakes', 'Midsouth', 'Plains') AND year = '2021'
GROUP BY region 
ORDER BY MaxTotalVolume ASC
LIMIT 10;

-- Calculates and displays the average price and total volume of avocados for each year in the Los Angeles region, sorted in ascending order by year.
SELECT year, AVG(AveragePrice) AS AveragePrice, SUM(TotalVolume)
FROM avocado
WHERE region = 'LosAngeles'
GROUP BY year
ORDER BY year;
