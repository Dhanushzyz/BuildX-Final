# Campus Placement Predictive Analytics Project
---

## 📌 Project Overview
This project delivers an end-to-end data analytics workflow mapping the core institutional drivers behind successful university placements. Utilizing a real-world dataset tracking student demographics, multi-tier academic performance, employability testing, and final compensation packages, this repository showcases a complete industry-standard pipeline: programmatic data engineering with Python, deep-dive business logic querying via SQL, and strategic corporate reporting in Power BI.

### 👥 Selected Theme: Education & Employability Analytics
* **Dataset Used:** College Placement Records (`Placement_Data_Full_Class.xls`)
* **Rationale:** Academic institutions and corporate recruitment cells face immense challenges matching candidate profiles with market demands. Analyzing these vectors allows universities to strategically overhaul curriculum development, target key performance gaps, and optimize baseline employment conversions.

---

## 🛠 Tech Stack & Ecosystem Architecture
* **Data Engineering:** Python (Pandas, NumPy) on Google Colab (`notebook.ipynb`)
* **Relational Querying:** SQL (PostgreSQL/SQLite-compliant syntax) via SQLiteOnline (`queries.sql`)
* **Business Intelligence:** Power BI Desktop (`dashboard.pbix`)
* **Portfolio Publishing:** GitHub Version Control

---

## 📊 Relational Database Schema Mapping
The data pipeline structures and outputs a clean relational target table named `cleaned_dataset` with the following physical blueprint:

| Column Name | Data Type | Key/Constraints | Field Description |
| :--- | :--- | :--- | :--- |
| `serial_no` | Integer | Primary Key | Unique structural student identifier |
| `gender` | Text | M / F | Gender orientation of the candidate |
| `ssc_percentage` | Float | Percentage | 10th Grade / Senior Secondary examination score |
| `ssc_board` | Text | Central / Others | High school educational board affiliation |
| `hsc_percentage` | Float | Percentage | 12th Grade / Higher Secondary examination score |
| `hsc_board` | Text | Central / Others | Higher secondary educational board affiliation |
| `hsc_stream` | Text | Categorical | Specialization track: Commerce / Science / Arts |
| `degree_percentage`| Float | Percentage | Undergraduate graduation aggregate marks |
| `degree_type` | Text | Categorical | Undergrad Degree major: Sci&Tech / Comm&Mgmt / Others |
| `work_experience` | Text | Yes / No | Prior professional corporate history flag |
| `employability_test_percentage` | Float | Percentage | Aptitude/Technical entry vetting exam score |
| `specialisation` | Text | Categorical | Post-grad MBA track focus: Mkt&Fin / Mkt&HR |
| `mba_percentage` | Float | Percentage | Post-graduation corporate business school score |
| `placement_status` | Text | Placed / Not Placed | Final employment conversion state |
| `salary` | Integer | Currency (INR) | Offered annual package (Imputed to 0 if Unplaced) |
| `overall_academic_avg` | Float | Feature Engineered | Synthesized mathematical average of SSC, HSC, and Degree |
| `salary_bracket` | Text | Feature Engineered | Compensation segmentation tiering |

---

## ❓ Core Business Questions Answered
1. **The Experiential Premium:** To what degree does historical corporate work experience insulate a candidate against placement failure, and does it validate a starting package premium?
2. **Academic Threshold Benchmarking:** Is there a quantifiable academic tipping point across cumulative student histories (`overall_academic_avg`) that dramatically alters interview conversion metrics?
3. **Stream Valuation & Divergence:** Which postgraduate combination (MBA Specialization paired with Undergrad major) creates the highest average structural market value?

---

## 🐍 Data Cleaning & Feature Engineering Highlights (Python)
The source dataset was programmatically processed using Python to achieve clean analytical integrity:
* **Null Value Imputation:** Identified 67 critical missing values in `salary`. Cross-referencing against `placement_status` proved these were structural nulls representing unplaced candidates. Programmatically filled missing values with `0`.
* **String Standardization:** Text formatting scrubbed via `.str.strip()` and standardized into matching `.str.title()` casing to prevent category splitting.
* **Feature Engineering:**
  1. Built `overall_academic_avg` via $\frac{\text{SSC} + \text{HSC} + \text{Degree}}{3}$ to summarize long-term academic tracking.
  2. Engineered `salary_bracket` conditional mapping segments (`No Package`, `Standard Package`, `Premium Package`).

---

## 🗄 Relational Query Analytics Highlights (SQL)
Six distinct business queries were modeled to execute core diagnostic tracking. All queries implement strict type-casting (`::numeric`) to handle float aggregates flawlessly:
* **Demographic Performance Deep-Dive:** Evaluated global placement metrics grouped by gender using conditional aggregations.
* **Academic Threshold Scoping:** Constructed `HAVING` filters targeting curriculum stream segments averaging an advanced baseline score.
* **Package Tiers Isolation:** Tracked high-earning candidates with corporate exposure via specific logical filtering.

---

## 📈 Power BI Interactive Dashboard Architecture
The `dashboard.pbix` workbook is engineered symmetrically across two distinct corporate reporting layouts:

### 1. Page 1: Executive Placement Summary
* **Primary Objective:** High-level stakeholder visual summary monitoring structural institutional health.
* **Visual Components:** * Interactive **Slicer** toggling prior `work_experience`.
  * Dynamic DAX **KPI Cards** tracking the aggregate `Placement_Rate` (68.84%) and mean package size.
  * **Donut Chart** modeling binary placement distribution.
  * **Clustered Column Chart** comparing graduation streams vs. net hiring rates.

### 2. Page 2: Academic & Specialization Deep-Dive
* **Primary Objective:** Deep granular tracking isolating underlying attributes that predict premium compensation.
* **Visual Components:** * A comprehensive **Page-Level Filter** isolating active compensation ranges by completely omitting non-earning brackets.
  * A **Matrix visual** cross-tabulating high school tracks against engineered `Academic_Tier` buckets.
  * A **Line Chart** plotting continuous academic score changes directly against interview success scales.

---

## 💡 Key Strategic Business Insights
* **The Experience Advantage:** Prior work experience acts as the single strongest predictive variable for securing employment. Fresh graduates faced a muted **54.2% placement rate**, whereas candidates with professional backgrounds converted at an elite **86.4% success rate**.
* **The Specialization Salary Spread:** Market pricing heavily favors the financial sector. Postgraduate tracks specializing in **Marketing & Finance (`Mkt&Fin`)** command a strong average salary package baseline of **₹3,15,000**, presenting a massive structural market premium over **Marketing & Human Resources (`Mkt&HR`)** which clocks a lower baseline average of **₹2,60,000**.
* **The 65% Academic Anchor:** Plotting the continuous performance trajectory reveals that an `overall_academic_avg` score of **65%** represents the key tipping point. Candidates holding scores past this barrier experience an accelerated uptick in hiring probability, while those landing in the engineered `Elite Scholar` tier ($\ge$ 75%) achieved a near-perfect interview conversion rate.

---
*Developed as part of the BuildX Data Analytics Curriculum Showcase portfolio.*
