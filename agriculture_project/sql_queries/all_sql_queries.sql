-- Which crop has the highest average yield?
SELECT
 Crop,
 ROUND(AVG(Yield_t_per_ha),2) AS avg_yield
FROM `agriculture-498612.crops.final`
GROUP BY Crop
ORDER BY avg_yield DESC


-- Does more monsoon rainfall mean better yield?
SELECT
 Year,
 Crop,
 ROUND(AVG(Monsoon_rainfall),2) AS avg_rain,
 ROUND(AVG(Yield_t_per_ha),2) AS avg_yield
FROM `agriculture-498612.crops.final`
GROUP BY Year, Crop
ORDER BY Year

-- How has MSP changed over the years for each crop?
SELECT 
 Year,
 Crop,
 MSP_Price
FROM `agriculture-498612.crops.final`
ORDER BY Crop,Year

-- In which years did yield drop despite good rainfall?
SELECT
 Year,
 Crop,
 ROUND(AVG(Monsoon_rainfall),2) AS avg_rain,
 ROUND(AVG(Yield_t_per_ha),2) AS avg_yield
FROM `agriculture-498612.crops.final`
GROUP BY Year, Crop
HAVING AVG(Monsoon_rainfall) > 800 AND AVG(Yield_t_per_ha) < 1.5
ORDER BY Year

-- Which crop has grown the most over the years?
SELECT
  Crop,
  MIN(Year)                         AS From_year,
  MAX(Year)                         AS To_year,
  ROUND(MIN(Yield_t_per_ha), 2)     AS Yield_start,
  ROUND(MAX(Yield_t_per_ha), 2)     AS Yield_end,
  ROUND(MAX(Yield_t_per_ha) - 
        MIN(Yield_t_per_ha), 2)     AS Yield_growth
FROM `agriculture-498612.crops.final`
GROUP BY Crop
ORDER BY Yield_growth DESC

-- Which districts are consistently underperforming?
SELECT
  District,
  Crop,
  ROUND(AVG(Yield_t_per_ha), 2) AS Avg_Yield
FROM agriculture_project.master_dataset
GROUP BY District, Crop
HAVING AVG(Yield_t_per_ha) < (
  SELECT AVG(Yield_t_per_ha)
  FROM `agriculture-498612.crops.final`
)
ORDER BY Avg_Yield 

-- Has MSP increase actually helped yield?
SELECT
  Crop,
  Year,
  MSP_Price,
  ROUND(AVG(Yield_t_per_ha), 2) AS Avg_Yield
FROM `agriculture-498612.crops.final`
GROUP BY Crop, Year, MSP_Price
ORDER BY Crop, Year

-- Best crop per district based on yield
SELECT
 District,
 Crop,
 ROUND(AVG(Yield_t_per_ha),2) AS avg_yield
FROM `agriculture-498612.crops.final`
GROUP BY Crop, District
QUALIFY ROW_NUMBER() OVER(
  PARTITION BY District 
) =1
ORDER BY avg_yield DESC

--  Worst rainfall years and their impact on yield
SELECT
 Year,
 ROUND(AVG(Monsoon_rainfall),2) AS avg_rain,
 ROUND(AVG(Yield_t_per_ha),2) AS avg_yield
FROM `agriculture-498612.crops.final`
GROUP BY Year
ORDER BY avg_rain
LIMIT 5

-- Year on year yield growth rate per crop
SELECT
 Year,
 Crop,
 ROUND(AVG(Yield_t_per_ha),2) AS avg_yield,
 ROUND(AVG(Yield_t_per_ha),2) - LAG(AVG(Yield_t_per_ha)) OVER (PARTITION BY Crop ORDER BY Year)
  AS change_by_year
FROM `agriculture-498612.crops.final`
GROUP BY Crop, Year
ORDER BY Crop, Year

-- Rainfall dependency score per crop
SELECT
  CASE
    WHEN Crop = 'Ground Nut'    THEN 'Groundnut'
    WHEN Crop = 'Cotton(Lint)'  THEN 'Cotton'
    ELSE Crop
  END AS Crop,
  ROUND(CORR(Monsoon_rainfall, Yield_t_per_ha), 3) AS rain_yield_correlation
FROM `agriculture-498612.crops.final`
GROUP BY 1
ORDER BY rain_yield_correlation DESC

--District to State comparision
SELECT
  District,
  ROUND(AVG(Yield_t_per_ha), 2) AS District_Avg_Yield,
  ROUND(AVG(AVG(Yield_t_per_ha)) OVER(), 2) AS State_Avg_Yield,
  ROUND(AVG(Yield_t_per_ha) -
        AVG(AVG(Yield_t_per_ha)) OVER(), 2) AS Gap_vs_State_Avg
FROM `agriculture-498612.crops.final`
GROUP BY District
ORDER BY District_Avg_Yield DESC