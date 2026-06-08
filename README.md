# Agriculture Crop Production Analysis — Andhra Pradesh

## Project Overview
An end-to-end data analysis project examining crop production 
patterns, rainfall impact and government price support (MSP) 
across 6 districts of Andhra Pradesh from 2005 to 2023.

---

## Problem Statement
Which districts and crops in Andhra Pradesh are 
underperforming, and what role does rainfall and government 
pricing play in crop yield outcomes?

---

## Tools Used
| Tool | Purpose |
|---|---|
| Excel | Data cleaning — fixing inconsistencies and formatting |
| BigQuery (SQL) | Data transformation, joining and analysis |
| Google Colab (Python) | Correlation analysis and visualization |
| Looker Studio | Interactive dashboard |

---

## Data Sources
| Dataset | Source |
|---|---|
| Crop Production | Ministry of Agriculture, Government of India |
| Rainfall | India Meteorological Department (IMD) |
| MSP Prices | Directorate of Economics and Statistics |

---

## Project Workflow
Raw Data Collection

↓

Data Cleaning (Excel + BigQuery)

↓

Joining 3 Datasets into Master Table (BigQuery)

↓

11 SQL Queries for Analysis (BigQuery)

↓

Python Visualizations (Google Colab)

↓

Interactive Dashboard (Looker Studio)
---

## Key Findings
- **Krishna district** yields 8.81 t/ha — **75% above** the 
  state average of 5.04 t/ha
- **West Godavari** is the most underperforming district at 
  2.24 t/ha below state average
- **Maize** is the most rainfall dependent crop 
  (correlation: 0.479) — highest risk during drought years
- **Sugarcane and Wheat** show negative rainfall correlation 
  (-0.678 and -0.578) — perform better in low monsoon seasons

---

## Recommendations
- Replicate Krishna district's irrigation and farming 
  practices in West Godavari, East Godavari and Prakasam 
  to close the performance gap
- Introduce drought resistant Maize varieties and drip 
  irrigation in rain dependent districts to protect farmer 
  income during poor monsoon years

---

## Dashboard
🔗 https://datastudio.google.com/reporting/12b51d4e-eca3-454d-866a-03945ba65db0

---

## Repository Structure
agriculture-crop-analysis/

│


├── raw_data/

│

├── crop_production_raw.csv

│

├── rainfall_raw.csv

│  

└── msp.csv

│

├── sql_queries/

│

└── all_sql_queries.sql

│

├── python/

│

└── Agriculture_project.ipynb

│

└── dashboard/

└── agri_project.txt
---

## SQL Analysis — Questions Answered
1. Which crop has the highest average yield?
2. Does monsoon rainfall affect yield?
3. How has MSP changed over the years?
4. Which years had yield drop despite good rainfall?
5. Which crop has grown the most over the years?
6. Which districts are consistently underperforming?
7. Has MSP increase actually helped yield?
8. What were the worst rainfall years and their impact?
9. Best crop per district based on yield
10. Year on year yield growth rate per crop
11. Rainfall dependency score per crop

---

## Python Visualizations
- **Correlation Heatmap** — relationship between yield, 
  rainfall and MSP across all variables
- **District Performance Chart** — each district compared 
  against state average with reference line

---

*Project built as part of data analyst portfolio*
