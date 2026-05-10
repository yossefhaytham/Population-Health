# Impact of Social Media on Mental Health

## Project Mission
The main goal of this project is to improve daily life by understanding how social media affects us. By looking at real data, we aim to find ways to help people reduce their time online and focus more on their physical health and real-life social connections. This project is about moving toward a healthier, more balanced lifestyle in a digital world.

## About the Project
Social media is a big part of life for young people today. While it keeps us connected, it also changes how we sleep, how much we move, and how we feel. This study looks at these habits to find clear ways to help people reclaim their time and improve their overall well-being.

## Data Sources
We combined two different types of information to get a complete picture:
* **Primary Research (Survey):** We used Microsoft Forms to reach out to young people and ask about their daily habits. The survey asked questions about:
    * **Screen Time and Sleep:** How many hours people spend online and if it stops them from getting enough rest.
    * **Physical Activity:** Whether high social media use leads to less exercise and sports.
    * **Content Engagement:** We looked at why people watch certain videos, focusing on the difference between "Reels" and educational content, and what makes someone skip or keep watching.
* **Secondary Research (Kaggle):** We also used existing data from Kaggle to see how these local habits compare to broader trends.

## Data Privacy
The safety and privacy of everyone who took part in our survey are very important. 
* All data was collected anonymously.
* No names or personal contact details were saved.
* The collection was done through secure platforms to ensure that all information remains private.

## Data Cleaning Challenges
Working with real-world data is rarely perfect. During the cleaning process, we handled several issues to make sure the results are accurate:
* **Inaccurate Information:** Some entries had clearly wrong or confusing answers, which we had to fix or remove.
* **Incomplete Forms:** We managed cases where people did not finish the survey to ensure the final analysis remained fair and consistent.
* **Formatting:** We worked to make sure the survey answers matched the structure of the data we found on Kaggle so they could be studied together.



### **Data Transformation & Preprocessing**
---

To handle the data cleaning challenges programmatically and transform raw survey responses into structured, analyzable data, we developed a unified Python script:

**[Survey_Optimization](https://github.com/yossefhaytham/Population-Health/blob/main/Script_Preprocessing/Survey_Optimization.py):**  This script serves as the primary data integration and cleaning pipeline. It automates the following key tasks:

* **Translation & Integration**: It translates Arabic categorical responses into standardized English using comprehensive nested dictionaries and merges the dual-language sources into one uniform dataset.

* **Automated Data Cleaning**: It targets text-entry fields (like the "Apps" column) to fix user errors, strip extra spaces, and unify inconsistent spellings (e.g., converting "Youtyoub" and Arabic variations strictly into "YouTube").

By streamlining these steps into a single workflow, we ensure our analysis and final dashboards are built on a consistent and error-free data foundation.

## Data Normalization

The project follows a **Star Schema** data modeling approach to ensure efficient storage, fast querying, and scalable analytics.

The central **fact table** (`survey_data`) stores the main survey responses and behavioral metrics, while related **dimension tables** provide descriptive attributes such as:

* Content Format
* Skip Point
* Doomscroll Frequency
* Visual Effects
* Employment Status
* Stay Factors

#### Key Design Features

* Built using **1:N (One-to-Many)** relationships between the fact table and dimension tables.
* Uses **surrogate keys** to optimize joins and maintain data integrity.
* Reduces redundancy through **data normalization**.
* Improves analytical performance for **Power BI dashboards** and SQL queries.
* Supports scalable and structured reporting for user behavior analysis.

#### Entity Relationship Overview

The data model connects all dimensions to the central fact table, enabling flexible filtering, aggregation, and deeper insights into user engagement patterns.

## **Data Modeling**

### **1. Egypt Data Analysis (Local Field Data)**
[**survey data**](https://github.com/yossefhaytham/Population-Health/blob/main/Data/survey_data_original.xlsx)

This phase focuses on converting qualitative survey responses into a quantitative framework for deeper behavioral analysis.

* **Weighted Data Transformation:** Standardized textual ranges (e.g., "1-3 hours") by mapping them to numerical midpoints. This allows for precise mathematical aggregation and statistical modeling.
* **Advanced Feature Engineering:** * **Social Media Intensity:** Created a ratio to measure social media's "share of attention" relative to total screen time, then categorized it into levels (Low to Extreme).
    * **Risk Flagging:** Developed logic to identify critical behavioral overlaps, such as **"High Screen + Low Sleep"** and **"High Doomscrolling + Sleep Deprivation"** using binary encoding (0/1).
* **Data Integrity & Casting:** Optimized the dataset by converting object types into categorical data, reducing memory usage and ensuring consistency for visual reporting tools.

---

# SQL Analysis & Live Database Access

To support scalable analysis and collaborative experimentation, the project database was deployed online using Supabase PostgreSQL.

This setup allows team members and external users to:

- Access the datasets remotely
- Run SQL queries directly on the live database
- Connect using Power BI, Python, or PostgreSQL tools
- Reproduce the analytical results used in the dashboard and presentation

The SQL workflow was organized into modular query files for better readability, maintenance, and experimentation.

---

# 📂 SQL Queries Structure

## `initialization.sql`

Contains:

- Table creation queries for:
  - `global_data`
  - `egypt_data`
- Initial checks to verify successful CSV import into Supabase

---

## `validation.sql`

Contains data validation queries used before analysis, including:

- Missing values checks
- Range validation
- Category consistency validation
- Duplicate ID checks
- Logical consistency checks

These validations were performed to ensure the datasets were reliable before generating insights and visualizations.

---

## `global_analysis.sql`

Contains all SQL analysis queries related to the Global Dataset, including:

- KPI calculations
- Screen time analysis
- Social media usage analysis
- Wellbeing analysis
- Sleep risk analysis
- Mood stability analysis

The queries were designed to answer the core behavioral questions explored in the dashboard.

---

## `egypt_analysis.sql`

Contains all SQL analysis queries related to the Egypt Survey Dataset, including:

- Morning phone usage analysis
- Most used apps analysis
- Content format risk analysis
- Sleep and social media behavior analysis
- Irritability and doomscrolling analysis

The analysis focuses on identifying behavioral patterns specific to Egyptian Gen Z users.

---

# 🌐 Live Data Access & Experimentation

The project database is hosted online using **Supabase PostgreSQL** to make the datasets easy to access, query, and reuse.

This setup allows anyone from the team, or anyone reviewing the project, to access the live data and experiment with it using:

- Power BI
- Python
- pgAdmin / DBeaver

---

# 1. Power BI Live Connection

Power BI can connect to the live Supabase data using the REST API.

## Global Dataset API

```text
https://fzjzfclrgoqdhrskekyp.supabase.co/rest/v1/global_data
````

## Egypt Survey Dataset API

```text
https://fzjzfclrgoqdhrskekyp.supabase.co/rest/v1/egypt_data
```

## API Key

```text
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6anpmY2xyZ29xZGhyc2tla3lwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2Mzc3NjAsImV4cCI6MjA5MzIxMzc2MH0.rTyRL9xzfQ7exKN8tQF-WYqSJclw--cXNfw6Pjzapp0
```

## Steps

1. Open Power BI Desktop
2. Go to **Get Data**
3. Choose **Web**
4. Select **Advanced**
5. Add the API URL
6. Add the required headers:

```text
apikey: YOUR_ANON_KEY
Authorization: Bearer YOUR_ANON_KEY
```

7. Replace `YOUR_ANON_KEY` with the API key above
8. Load the returned JSON data
9. Convert the result into a table using Power Query
10. Start building visuals and dashboards

## Example

```text
https://fzjzfclrgoqdhrskekyp.supabase.co/rest/v1/global_data?limit=100
```

## Purpose

This allows the dashboard to connect to online data instead of depending only on local CSV files.

---

# 2. Python API Analysis

The live dataset can also be accessed using Python for analysis, EDA, and testing new insights.

## Requirements

```bash
pip install requests pandas
```

## Python Example

```python
import requests
import pandas as pd

url = "https://fzjzfclrgoqdhrskekyp.supabase.co/rest/v1/global_data?limit=100"

headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6anpmY2xyZ29xZGhyc2tla3lwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2Mzc3NjAsImV4cCI6MjA5MzIxMzc2MH0.rTyRL9xzfQ7exKN8tQF-WYqSJclw--cXNfw6Pjzapp0",

    "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6anpmY2xyZ29xZGhyc2tla3lwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2Mzc3NjAsImV4cCI6MjA5MzIxMzc2MH0.rTyRL9xzfQ7exKN8tQF-WYqSJclw--cXNfw6Pjzapp0"
}

response = requests.get(url, headers=headers)

data = response.json()

df = pd.DataFrame(data)

print(df.head())
```

## Egypt Dataset Example

```python
import requests
import pandas as pd

url = "https://fzjzfclrgoqdhrskekyp.supabase.co/rest/v1/egypt_data?limit=100"

headers = {
    "apikey": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6anpmY2xyZ29xZGhyc2tla3lwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2Mzc3NjAsImV4cCI6MjA5MzIxMzc2MH0.rTyRL9xzfQ7exKN8tQF-WYqSJclw--cXNfw6Pjzapp0",
    "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ6anpmY2xyZ29xZGhyc2tla3lwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc2Mzc3NjAsImV4cCI6MjA5MzIxMzc2MH0.rTyRL9xzfQ7exKN8tQF-WYqSJclw--cXNfw6Pjzapp0"
}

response = requests.get(url, headers=headers)

df = pd.DataFrame(response.json())

print(df.head())
```

## Example Filter

```python
url = "https://fzjzfclrgoqdhrskekyp.supabase.co/rest/v1/global_data?Sleep_Risk=eq.High&limit=50"
```

## Purpose

Python access allows users to:

* Load the live dataset
* Perform exploratory data analysis
* Create charts
* Test new analysis ideas
* Reuse the data without downloading CSV files

---

# 3. pgAdmin / PostgreSQL Connection

Users can also connect directly to the live PostgreSQL database using pgAdmin, DBeaver, or any PostgreSQL-compatible DBMS.

This method is useful for anyone who wants to write SQL queries directly on the hosted database.

## Connection Settings

```text
Host: aws-0-eu-west-1.pooler.supabase.com
Port: 5432
Database: postgres
Username: data_viewer.fzjzfclrgoqdhrskekyp
Password: 12345678
SSL Mode: Require
```

## pgAdmin Steps

1. Open pgAdmin
2. Right-click on **Servers**
3. Choose **Register → Server**
4. In the **General** tab, set a server name:

```text
GenZ Mental Health DB
```

5. Open the **Connection** tab
6. Add the connection settings above
7. Open the **SSL** tab
8. Set:

```text
SSL Mode: Require
```

9. Click **Save**
10. Open **Query Tool**

## Test Query

```sql
select *
from public.global_data
limit 10;
```

## Egypt Data Test Query

```sql
select *
from public.egypt_data
limit 10;
```

## Example Analysis Query

```sql
select
    "SM_Usage",
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing
from public.global_data
group by "SM_Usage"
order by avg_wellbeing desc;
```

## Purpose

This allows users to:

* Write SQL queries directly
* Explore the database schema
* Test joins and aggregations
* Reproduce the dashboard analysis
* Practice PostgreSQL on a live dataset

---

# ⚠️ Security Note

The shared database user is a **read-only user**.

It can:

* Read tables
* Run SELECT queries
* Explore the data

It cannot:

* Insert data
* Update records
* Delete records
* Drop tables

This makes the database safe for public exploration and team collaboration.

---

# 📝 Notes

* The queries are written specifically for the Supabase PostgreSQL structure used in this project.
* Columns containing spaces or capital letters are wrapped in double quotes.
* Each query includes a short description explaining:

  * its purpose
  * analytical objective
  * expected insight
---

### **2. Global Dataset (Gen Z Digital Wellness )**
[**Kaggle data**](https://www.kaggle.com/datasets/hammadansari7/gen-z-mental-wellness-and-digital-lifestyle-patterns)

This stage involves the creation of complex, high-level psychological indices to measure the "digital cost" on modern lifestyles.

* **Psychological Indexing:** Developed proprietary formulas to quantify abstract concepts:
    * **Reality Disconnection Risk:** A ratio of virtual engagement (Social Media) vs. physical/productive activities (Sports, Work, Study).
    * **Emotional Cost Ratio:** A derived metric calculating the increase in **Anxiety and Overthinking** per hour of digital consumption.
* **Lifestyle Stress Modeling:** * **Productivity Distraction Index:** Combined "Night Browsing Rate" with "Social Media Hours" to evaluate the impact on daily focus and work efficiency.
    * **Sleep Quality Risk:** Modeled the inverse relationship between late-night digital habits and actual recovery time.
* **Correlation & Validation:** Executed a multi-variable correlation analysis (Heatmaps) to validate the model's logic, confirming strong links between screen habits, mood instability, and mental fatigue.
* **Dynamic Binning:** Transformed raw numerical outputs into interpretable risk tiers (Young, Core, Mature, Older Gen-Z), making the data actionable for targeted wellness strategies.

---

## Team Members

<div align="center" style="width: 100%;">

<table width="100%" style="border-collapse: separate; border-spacing: 15px;">

<tr>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/yossefhaytham.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Yossef Haytham</b><br>
    <i style="color: #8b949e;">Data collection, Researcher</i><br>
    <a href="https://github.com/yossefhaytham">github.com/yossefhaytham</a>
  </div>
</td>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/Ahmedsherif1306.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Ahmed Sherif</b><br>
    <i style="color: #8b949e;">Data Modeling</i><br>
    <a href="https://github.com/Ahmedsherif1306">github.com/Ahmedsherif1306</a>
  </div>
</td>

</tr>

<tr>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/alma8raby.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Ibrahim Abduljawad</b><br>
    <i style="color: #8b949e;">Data Analysis</i><br>
    <a href="https://github.com/alma8raby">github.com/alma8raby</a>
  </div>
</td>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/Ahmedkamalhikal.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Ahmed Kamal</b><br>
    <i style="color: #8b949e;">Data Visualization</i><br>
    <a href="https://github.com/Ahmedkamalhikal">github.com/Ahmedkamalhikal</a>
  </div>
</td>

</tr>

</table>
</div>
