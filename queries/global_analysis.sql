-- =========================================================
-- GLOBAL DATA ANALYSIS QUERIES
-- Project: GenZ Mental Health Analysis
-- Purpose:
-- Analyze global patterns between screen time, social media usage,
-- sleep risk, wellbeing, and mental health indicators.
-- =========================================================

-- 1) GLOBAL KPI AVERAGES
-- Purpose: Quick overview of main mental health and screen time indicators.
select
    round(avg("Anxiety_Score"), 2) as avg_anxiety_score,
    round(avg("Sleep_Quality_Score"), 2) as avg_sleep_quality_score,
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing_index,
    round(avg("Screen_Time_Hours"), 2) as avg_screen_time_hours
from public.global_data;

-- 2) AVERAGE SCREEN TIME BY AGE GROUP
-- Purpose: Identify which Gen Z age group spends more time on screens.
select
    "Age_Group",
    round(avg("Screen_Time_Hours"), 2) as avg_screen_time
from public.global_data
group by "Age_Group"
order by avg_screen_time desc;

-- 3) TOTAL SCREEN TIME BY CONTENT TYPE
-- Purpose: Identify which content type consumes the most total screen time.
select
    "Content_Type_Preference",
    round(sum("Screen_Time_Hours"), 2) as total_screen_time
from public.global_data
group by "Content_Type_Preference"
order by total_screen_time desc;

-- 4) OVERTHINKING BY SOCIAL MEDIA USAGE
-- Purpose: Check whether higher social media usage is linked to overthinking.
select
    "SM_Usage",
    round(avg("Overthinking_Score"), 2) as avg_overthinking_score
from public.global_data
group by "SM_Usage"
order by avg_overthinking_score desc;

-- 5) SOCIAL COMPARISON BY SOCIAL MEDIA USAGE
-- Purpose: Check whether social media usage increases comparison with others.
select
    "SM_Usage",
    round(avg("Social_Comparison_Index"), 2) as avg_social_comparison
from public.global_data
group by "SM_Usage"
order by avg_social_comparison desc;

-- 6) SCREEN TIME VS EMOTIONAL FATIGUE AND ANXIETY
-- Purpose: Observe how screen time relates to fatigue and anxiety.
select
    round("Screen_Time_Hours") as screen_time_group,
    round(avg("Emotional_Fatigue_Score"), 2) as avg_emotional_fatigue,
    round(avg("Anxiety_Score"), 2) as avg_anxiety_score
from public.global_data
group by screen_time_group
order by screen_time_group;

-- 7) SOCIAL MEDIA USAGE VS WELLBEING
-- Purpose: Determine whether higher social media usage is linked to lower wellbeing.
select
    "SM_Usage",
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing
from public.global_data
group by "SM_Usage"
order by avg_wellbeing desc;

-- 8) AVERAGE SCREEN TIME BY SLEEP RISK
-- Purpose: Analyze whether poor sleep risk is associated with higher screen time.
select
    "Sleep_Risk",
    round(avg("Screen_Time_Hours"), 2) as avg_screen_time
from public.global_data
group by "Sleep_Risk"
order by avg_screen_time desc;

-- 9) SCREEN TIME VS OVERTHINKING AND WELLBEING
-- Purpose: Observe how mental health changes as screen time increases.
select
    round("Screen_Time_Hours") as screen_time_group,
    round(avg("Overthinking_Score"), 2) as avg_overthinking,
    round(avg("Wellbeing_Index"), 2) as avg_wellbeing
from public.global_data
group by screen_time_group
order by screen_time_group;

-- 10) SOCIAL COMPARISON BY AGE
-- Purpose: Check whether age itself strongly affects social comparison.
select
    "Age",
    round(avg("Social_Comparison_Index"), 2) as avg_social_comparison
from public.global_data
group by "Age"
order by "Age";

-- 11) MOTIVATION BY STUDENT/WORKING STATUS
-- Purpose: Compare motivation between students, workers, and users doing both.
select
    "Student_Working_Status",
    round(avg("Motivation_Level"), 2) as avg_motivation
from public.global_data
group by "Student_Working_Status"
order by avg_motivation desc;

-- 12) MOOD STABILITY BY SLEEP RISK
-- Purpose: Understand whether higher sleep risk is associated with lower mood stability.
select
    "Sleep_Risk",
    round(avg("Mood_Stability_Score"), 2) as avg_mood_stability
from public.global_data
group by "Sleep_Risk"
order by avg_mood_stability desc;

-- 13) MOOD STABILITY BY PRODUCTIVITY RISK
-- Purpose: Analyze whether productivity risk is linked to lower mood stability.
select
    "Productivity_Risk",
    round(avg("Mood_Stability_Score"), 2) as avg_mood_stability
from public.global_data
group by "Productivity_Risk"
order by avg_mood_stability desc;
