# Population Health Analysis: Impact of Social Media on Mental Health

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



### **Data Transformation & Pre-processing**
To handle the data cleaning challenges programmatically and transform the raw survey responses into structured, analyzable data, we developed the following Python scripts in our repository:

* **[translate_form.py](https://github.com/yossefhaytham/Population-Health/blob/main/Data-Preprocessing/translate_Form.py):** Because our survey reached a diverse audience, we collected responses in both Arabic and English. This script acts as the primary data integration tool. It loads the raw Excel files, applies a comprehensive nested dictionary to translate all Arabic categorical responses into standardized English values, unifies the column headers, and merges the two sources into one data set. This ensures our analysis is conducted on a single, uniform data source.


* **[fix_error_data.py](https://github.com/yossefhaytham/Population-Health/blob/main/Data-Preprocessing/fix_error_data.py):** Text-entry fields in surveys are highly prone to user errors, extra spaces, and inconsistent spellings. This script targets these specific columns (such as the "Which apps consume the most of your time?" column). It performs automated string cleaning by stripping leading and trailing spaces, and utilizes a mapping dictionary to correct typos and unify different naming conventions (e.g., converting "Youtyoub", "YouTube ", and Arabic variations strictly into a unified "Youtube"). This step is critical for accurate grouping and visualization in our final dashboards.

## **Data Modeling**

### **1. Survey Data Analysis (Local Field Data)**
This phase focuses on converting qualitative survey responses into a quantitative framework for deeper behavioral analysis.

* **Weighted Data Transformation:** Standardized textual ranges (e.g., "1-3 hours") by mapping them to numerical midpoints. This allows for precise mathematical aggregation and statistical modeling.
* **Advanced Feature Engineering:** * **Social Media Intensity:** Created a ratio to measure social media's "share of attention" relative to total screen time, then categorized it into levels (Low to Extreme).
    * **Risk Flagging:** Developed logic to identify critical behavioral overlaps, such as **"High Screen + Low Sleep"** and **"High Doomscrolling + Sleep Deprivation"** using binary encoding (0/1).
* **Data Integrity & Casting:** Optimized the dataset by converting object types into categorical data, reducing memory usage and ensuring consistency for visual reporting tools.

---

### **2. Gen Z Digital Wellness (Kaggle Dataset)**
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
    <a href="https://github.com/yossefhaytham">github.com/yossefhaytham</a>
  </div>
</td>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/alma8raby.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Ibrahim Abduljawad</b><br>
    <a href="https://github.com/alma8raby">github.com/alma8raby</a>
  </div>
</td>

</tr>

<tr>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/Ahmedkamalhikal.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Ahmed Kamal</b><br>
    <a href="https://github.com/Ahmedkamalhikal">github.com/Ahmedkamalhikal</a>
  </div>
</td>

<td align="center" width="50%">
  <div style="background-color:#0d1117; border:1px solid #30363d; border-radius:16px; padding:25px; width:100%; box-shadow: 0 0 10px rgba(0,0,0,0.5); transition: 0.3s;">
    <img src="https://github.com/Ahmedsherif1306.png" width="110" style="border-radius:12px;" /><br><br>
    <b style="font-size:18px;">Ahmed Sherif</b><br>
    <a href="https://github.com/Ahmedsherif1306">github.com/Ahmedsherif1306</a>
  </div>
</td>

</tr>

</table>

</div>
