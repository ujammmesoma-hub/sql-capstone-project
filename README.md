# SQL Capstone Project: Donor Donation Analysis

## Project Overview:

This project uses PostgreSQL to explore, clean, analyse, and summarise donor donation data. The goal is to uncover meaningful patterns
in donor behaviour and provide insights that can help improve fundraising strategies and decision-making.

## Business Problem:

A fundraising organisation needs to better understand its donor base by identifying donation trends, high-value donors, demographic patterns, and
geographic contributions. The analysis supports data-driven decisions that can improve donor engagement and fundraising performance.

## Dataset Description:

- Dataset: Donor Donation Dataset
- Source: SQL Capstone Project dataset (provided for academic purposes)
- Database: PostgreSQL
- Tables:
  - donors
  - donations
- Data includes:
  - Donor demographics (gender, state, job field, shirt size, car)
  - Donation amount
  - Donation frequency

## Tools and Technologies Used

- PostgreSQL
- pgAdmin 4
- Microsoft Excel
- Microsoft Word
- GitHub

## Key Findings

- The total donation amount exceeded $ 249,085.
- Male donors contributed slightly more total donations than female donors.
- A small number of states accounted for a significant share of total donations.
- Recurring donors contributed substantially more than one-time donors on average.
- Window functions identified the highest donor in each state for targeted recognition.

## Recommendations

- Focus fundraising campaigns on states with the highest donation totals.
- Develop retention programmes for recurring donors to increase long-term contributions.
- Personalise donor engagement using demographic insights such as donation frequency and location.

## Repository Structure

sql-capstone-project/
│
├── README.md
├── sql/
│   ├── 01_data_exploration.sql
│   ├── 02_data_quality_assessment.sql
│   ├── 03_data_cleaning.sql
│   ├── 04_business_analysis.sql
│   ├── 05_advanced_analysis.sql
│   └── 06_summary_views.sql
│
├── data/
│   └── ERD.drawio.png
│
├── portfolio/
│   └── UJAM_PRECIOUS_MMESOMA_SQL_PORTFOLIO.pdf
│
├── visualizations/
│   ├── Donation summary dashboard.png
│   |—— Top 20 donors.png
│
└── .gitignore

## How to Reproduce the Analysis

1. Install PostgreSQL and pgAdmin 4.
2. Create a new PostgreSQL database.
3. Import the donor and donation tables.
4. Execute the SQL scripts in the 'sql' folder in numerical order:
   - 01_data_exploration.sql
   - 02_data_quality_assessment.sql
   - 03_data_cleaning.sql
   - 04_business_analysis.sql
   - 05_advanced_analysis.sql
   - 06_summary_views.sql
5. Export query results for reporting and create charts using Microsoft Excel.
6. Review the analytical report located in the 'portfolio' folder.

<<<<<<< HEAD
LINK - https://github.com/ujammmesoma-hub/sql-capstone-project
=======
https://github.com/ujammmesoma-hub/sql-capstone-project
>>>>>>> bed949b6bc9b0be13cd3c1f63cb54f59dc1d6c10

## License

This project is released under the MIT License and is intended for educational and portfolio purposes.
