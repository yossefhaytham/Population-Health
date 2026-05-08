/*
=========================================================
Global Data Analysis Queries
=========================================================
*/

-- KPI's: average anxiety score, average sleep quality score, average wellbeing index, average screen time hours.
select
    round(avg("Anxiety_Score"), 2) as avg_anxiety_score,
    round(avg("Sleep_Quality_Score"), 2) as avg_sleep_quality_score,
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing_index,
    round(avg("Screen_Time_Hours"), 2) as avg_screen_time_hours
from public.global_data;

-- Q1:
-- What is the average screen time for each Age group?
select
    "Age_Group",
    round(avg("Screen_Time_Hours"), 2) as avg_screen_time
from public.global_data
group by "Age_Group"
order by avg_screen_time desc;

-- Q2:
-- What is the total screen time for each content type?
select
    "Content_Type_Preference",
    round(sum("Screen_Time_Hours"), 2) as total_screen_time
from public.global_data
group by "Content_Type_Preference"
order by total_screen_time desc;

-- Q3:
-- What is the average Overthinking score for each social media usage group?
select
    "SM_Usage",
    round(avg("Overthinking_Score"), 2) as avg_overthinking_score
from public.global_data
group by "SM_Usage"
order by avg_overthinking_score desc;

-- Q4:
-- Average social comparison index for each social media usage?
select
    "SM_Usage",
    round(avg("Social_Comparison_Index"), 2) as avg_social_comparison
from public.global_data
group by "SM_Usage"
order by avg_social_comparison desc;

-- Q5:
-- Is there any relationship between emotional fatigue and Anxiety as screen time increase?
select
    round("Screen_Time_Hours") as screen_time_group,
    round(avg("Emotional_Fatigue_Score"), 2) as avg_emotional_fatigue,
    round(avg("Anxiety_Score"), 2) as avg_anxiety_score
from public.global_data
group by screen_time_group
order by screen_time_group;

-- Q6:
-- Is well-being index getting affected by social media usage?
select
    "SM_Usage",
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing
from public.global_data
group by "SM_Usage"
order by avg_wellbeing desc;

-- Q7:
-- What is the screen time for each sleep risk level?
select
    "Sleep_Risk",
    round(avg("Screen_Time_Hours"), 2) as avg_screen_time
from public.global_data
group by "Sleep_Risk"
order by avg_screen_time desc;

-- Q8:
-- Is there any relationship between Overthinking score and wellbeing Index as screen time increases?
select
    round("Screen_Time_Hours") as screen_time_group,
    round(avg("Overthinking_Score"), 2) as avg_overthinking,
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing
from public.global_data
group by screen_time_group
order by screen_time_group;

-- Q9:
-- What is average social comparison Index by Age?
select
    "Age",
    round(avg("Social_Comparison_Index"), 2) as avg_social_comparison
from public.global_data
group by "Age"
order by "Age";

-- Q10:
-- Average of Motivation level for each Working/Studying status?
select
    "Student_Working_Status",
    round(avg("Motivation_Level"), 2) as avg_motivation
from public.global_data
group by "Student_Working_Status"
order by avg_motivation desc;

-- Q11:
-- Average mood stability risk for each sleep risk level?
select
    "Sleep_Risk",
    round(avg("Mood_Stability_Score"), 2) as avg_mood_stability
from public.global_data
group by "Sleep_Risk"
order by avg_mood_stability desc;

-- Q12:
-- Is mood stability score change for each productivity risk group?
select
    "Productivity_Risk",
    round(avg("Mood_Stability_Score"), 2) as avg_mood_stability
from public.global_data
group by "Productivity_Risk"
order by avg_mood_stability desc;
