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

## Data Analysis & Validation (SQL & Supabase)

To ensure data accuracy and seamless team collaboration, all datasets were hosted on **Supabase**. This approach leveraged its PostgreSQL engine to provide a centralized "single source of truth," allowing all team members to access, query, and analyze the data in real-time.

### 1. Collaborative Environment & Validation
* **Team Accessibility:** Supabase served as the central hub, enabling the team to work simultaneously on the same datasets without version conflicts.
* **Structural Validation:** Before analysis, we performed rigorous validation to ensure that every column and data type perfectly matched the original survey questions and logic.
* **Integrity Metrics:** We utilized SQL to detect inconsistencies, verifying that the data was logically sound and ready for the visualization stage.

### 2. Analytical SQL Queries
We executed a series of complex SQL queries to extract deep insights from both the Egyptian and Global datasets.

#### Egypt Survey Insights:
* **Behavioral Patterns:** Analyzing morning phone habits, most used applications, and physical exercise frequency.
* **Impact Correlations:** Investigating how different content formats affect screen time and sleep quality.
* **Psychological Indicators:** Mapping the relationship between "doomscrolling" and recent irritability, as well as social media intensity vs. stress levels.
* **Demographic Trends:** Breaking down daily social media consumption by gender and identifying common "skip points" in digital engagement.

#### Global Gen-Z Insights:
* **Core KPIs:** Calculating global averages for Anxiety Scores, Sleep Quality, Wellbeing Indices, and Screen Time.
* **Risk Modeling:** Identifying relationship patterns between emotional fatigue and anxiety as screen time increases.
* **Productivity & Mood:** Analyzing how productivity risk levels and sleep quality impact overall mood stability and motivation.
* **Socio-Digital Comparison:** Exploring the "Social Comparison Index" across different age groups and social media usage levels.


## Visualization (Interactive Dashboards By Power BI)


The final stage of our project transforms the validated data into actionable insights through interactive Power BI dashboards. We developed **four dedicated dashboards** to provide a comprehensive view of the findings.

> **[Access the Live Power BI Dashboards Here](https://app.powerbi.com/view?r=eyJrIjoiNzUwMTk3NGUtZDljZC00MTYyLThkMWQtM2MyODU4OWZiYTVkIiwidCI6ImRhYTQ0YmU2LWJiMmEtNGEzYy04ODI5LTdiNGU3OTgwNjI2NSJ9)**

### Egypt Survey Dashboards (Local Context)

* **EGY_SM (Social Media Habits):** Analyzes local patterns of screen time, platform preferences, and digital engagement specific to the Egyptian youth demographic.
![Egypt Social Media Dashboard](https://raw.githubusercontent.com/yossefhaytham/Population-Health/refs/heads/main/Image/Egy_SM.jpg)

* **EGY_Psych (Psychological Impact):** Explores the correlation between social media intensity and mental well-being indicators like sleep quality and stress levels within the local community.
![Egypt Psychology Dashboard](https://raw.githubusercontent.com/yossefhaytham/Population-Health/refs/heads/main/Image/Egy_psych.jpg)

### Global Gen-Z Dashboards (Broad Trends)

* **GLOB_SM (Global Digital Wellness):** Visualizes worldwide trends in screen time and digital habits, providing a macro-perspective on how Gen-Z interacts with technology globally.
![Global Digital Wellness Dashboard](https://raw.githubusercontent.com/yossefhaytham/Population-Health/refs/heads/main/Image/GLOB_SM.jpg)

* **GLOB_Psych (Mental Health Metrics):** Focuses on the "digital cost" by modeling the relationship between high digital consumption and psychological metrics such as anxiety and overthinking scores across international borders.
![Global Mental Health Dashboard](https://raw.githubusercontent.com/yossefhaytham/Population-Health/refs/heads/main/Image/GLOB_psych.jpg)
---

> **Data Access:** The raw and processed data used for these visualizations can be found in the [Dashboard directory](https://github.com/yossefhaytham/Population-Health/tree/main/Dashboard).
---

## Key Insights Findings



### Local Insights (Egypt Survey)

* **Morning Habits and Irritability:** Analysis reveals a strong correlation between checking phones immediately upon waking and daily irritability levels. Participants who "Always" check their phones in the morning reported significantly higher stress scores throughout the day.
* **Content Format Impact:** Short-form video content is the primary driver for excessive screen time and sleep deprivation among Egyptian youth. This format has a much higher negative impact on sleep quality compared to educational content or real-life stories.
* **Physical Activity Decline:** A concerning trend in physical health was identified, with over 46% of participants reporting that they have stopped practicing physical exercises, indicating a shift toward a more sedentary digital lifestyle.
* **Gender-Based Usage Patterns:** Usage intensity varies by gender; while the majority of male participants fall within the 1-3 hour usage bracket, female participants show a higher density in the 3-5 hour daily usage category.

---

### Global Insights (Gen-Z Trends)

* **Digital Saturation Metrics:** The global average screen time stands at 7.02 hours per day, which directly correlates with a lower overall Wellbeing Index average of 3.87.
* **Social Comparison Index:** There is a direct linear relationship between social media usage levels and the Social Comparison Index. As usage frequency increases, the tendency for users to compare their lives with others rises, leading to increased anxiety.
* **The Cost of High Consumption:** The data shows a clear upward trend in both Emotional Fatigue and Anxiety Scores as screen time increases, highlighting the significant psychological cost of high digital consumption.
* **Sleep Risk and Mood Stability:** Sleep deprivation serves as the strongest predictor of mood instability globally. Users categorized under "Extreme Sleep Risk" consistently recorded the lowest Mood Stability Scores across all demographics.
* **Motivation and Status:** Interestingly, participants who are both students and working reported higher motivation levels compared to those who are only studying or only working, suggesting that a busy, structured schedule may positively influence engagement levels.

---

> **Note:** The points listed above represent the most critical highlights of the analysis. For a more comprehensive and granular exploration of the data, please refer to the interactive dashboards linked below.

## Scientific Research & Literature Review

The findings of this project are supported by established scientific studies that examine the direct impact of digital consumption on mental performance and psychological health.

### 1. [Social Media Detox and Youth Mental Health](https://jamanetwork.com/journals/jamanetworkopen/fullarticle/2804561) (JAMA Network Study)
* **Objective:** Analyzing the impact of digital behavior on the mental health of young adults (aged 18-24).
* **Methodology:** Utilizing "Digital Phenotypes" and EMA (Ecological Momentary Assessment) to accurately track real-time behavior.
* **Experiment:** Reducing social media usage to a strict limit of 30 minutes per day.
* **Results:** Within just one week, researchers observed significant improvements in mental well-being. The study recorded a marked reduction in symptoms of anxiety, depression, and sleep disturbances.

### 2. [Blocking mobile internet on smartphones improves sustained attention](https://academic.oup.com/pnasnexus/article/3/1/pgad441/7511740) (PNAS Nexus Study)
* **Objective:** Measuring the cognitive focus of 467 participants (aged 18-30) during a period of restricted data access.
* **Methodology:** A complete blocking of mobile internet for two weeks, allowing only voice calls and SMS messages.
* **Mental Outcomes:** Participants experienced a significant increase in focus and self-control.
* **Social Impact:** The study successfully challenged the "FOMO" (Fear Of Missing Out) myth, with participants replacing digital browsing with genuine social connections, physical exercise, and reading.



## Practical Solutions for Digital Well-being



Based on the synthesis of our data analysis and the aforementioned scientific research, we propose five actionable strategies to optimize digital habits:

1. **The Morning Delay:** Avoid using your phone or checking notifications for the first 30-60 minutes after waking up to ensure a calm and centered mind.
2. **Scheduled Detox:** Proactively enable "Do Not Disturb" modes and establish fixed hours throughout the day for a complete digital break.
3. **Behavioral Monitoring:** Regularly evaluate your digital engagement by asking: "Is this application currently energizing me or draining my mental energy?"
4. **Combat Passive Scrolling:** Actively limit the consumption of "Reels" and short-form infinite scrolls to preserve cognitive focus and mental stamina.
5. **Visual Aid (Grayscale Mode):** Utilize your device's grayscale display setting to reduce the neurological appeal of application interfaces, thereby decreasing impulsive browsing.

---

> **Note:** These solutions are designed to address the usage patterns identified in our analysis, focusing on intentional engagement rather than the complete abandonment of digital tools.

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
