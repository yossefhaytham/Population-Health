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

* **Automated Data Cleaning**: It targets text-entry fields (like the "Apps" column) to fix user errors, strip extra spaces, and unify inconsistent spellings.

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
