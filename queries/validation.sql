-- =========================================================
-- DATA VALIDATION QUERIES
-- Project: GenZ Mental Health Analysis
-- Purpose:
-- Validate both datasets before analysis.
-- We check missing values, invalid ranges, duplicate IDs,
-- category consistency, and simple logical consistency.
-- =========================================================

-- =========================================================
-- GLOBAL DATA VALIDATION
-- =========================================================

-- 1) Missing values in important global columns
-- Purpose: Check if the main analysis columns contain missing values.
select
    count(*) as total_rows,
    count(*) - count("Screen_Time_Hours") as missing_screen_time,
    count(*) - count("Daily_Sleep_Hours") as missing_sleep_hours,
    count(*) - count("Wellbeing_Index") as missing_wellbeing,
    count(*) - count("Sleep_Risk") as missing_sleep_risk,
    count(*) - count("SM_Usage") as missing_social_media_usage,
    count(*) - count("Anxiety_Score") as missing_anxiety,
    count(*) - count("Emotional_Fatigue_Score") as missing_fatigue
from public.global_data;

-- 2) Screen time range validation
-- Purpose: Make sure screen time values are logical: 0 to 24 hours.
select *
from public.global_data
where "Screen_Time_Hours" < 0
   or "Screen_Time_Hours" > 24;

-- 3) Daily sleep hours range validation
-- Purpose: Make sure sleep values are logical: 0 to 24 hours.
select *
from public.global_data
where "Daily_Sleep_Hours" < 0
   or "Daily_Sleep_Hours" > 24;

-- 4) Wellbeing range overview
-- Purpose: Check the minimum and maximum wellbeing values.
select
    min("Wellbeing_Index") as min_wellbeing,
    max("Wellbeing_Index") as max_wellbeing
from public.global_data;

-- 5) Anxiety score range overview
-- Purpose: Check the minimum and maximum anxiety values.
select
    min("Anxiety_Score") as min_anxiety,
    max("Anxiety_Score") as max_anxiety
from public.global_data;

-- 6) Emotional fatigue score range overview
-- Purpose: Check the minimum and maximum fatigue values.
select
    min("Emotional_Fatigue_Score") as min_fatigue,
    max("Emotional_Fatigue_Score") as max_fatigue
from public.global_data;

-- 7) Sleep risk category validation
-- Purpose: Make sure Sleep_Risk values are standardized.
select distinct "Sleep_Risk"
from public.global_data
order by "Sleep_Risk";

-- 8) Social media usage category validation
-- Purpose: Make sure SM_Usage values are standardized.
select distinct "SM_Usage"
from public.global_data
order by "SM_Usage";

-- 9) Age group validation
-- Purpose: Check all age group labels used in the global dataset.
select distinct "Age_Group"
from public.global_data
order by "Age_Group";

-- 10) Duplicate ID check
-- Purpose: Confirm that no id appears more than once.
select
    id,
    count(*) as duplicate_count
from public.global_data
group by id
having count(*) > 1;

-- =========================================================
-- EGYPT SURVEY DATA VALIDATION
-- =========================================================

-- 11) Missing values in important Egypt survey columns
-- Purpose: Check missing values in the main columns used in analysis.
select
    count(*) as total_rows,
    count(*) - count(age) as missing_age,
    count(*) - count(gender) as missing_gender,
    count(*) - count("daily screen time hours") as missing_screen_time,
    count(*) - count("daily social media hours") as missing_social_media_hours,
    count(*) - count("sleep hour") as missing_sleep_hours,
    count(*) - count("check phone morning") as missing_morning_phone,
    count(*) - count("irritable recently") as missing_irritability,
    count(*) - count("ContentFormat_ID") as missing_content_format,
    count(*) - count(high_screen_low_sleep) as missing_high_screen_low_sleep
from public.egypt_data;

-- 12) Screen time category validation
-- Purpose: Check the unique screen time categories in the survey.
select distinct "daily screen time hours"
from public.egypt_data
order by "daily screen time hours";

-- 13) Social media hours category validation
-- Purpose: Check the unique social media usage categories.
select distinct "daily social media hours"
from public.egypt_data
order by "daily social media hours";

-- 14) Sleep hour category validation
-- Purpose: Check the unique sleep categories.
select distinct "sleep hour"
from public.egypt_data
order by "sleep hour";

-- 15) Morning phone usage category validation
-- Purpose: Check values used for phone checking behavior after waking up.
select distinct "check phone morning"
from public.egypt_data
order by "check phone morning";

-- 16) Irritability category validation
-- Purpose: Check all values for irritability responses.
select distinct "irritable recently"
from public.egypt_data
order by "irritable recently";

-- 17) Content format category validation
-- Purpose: Check content format categories used in the survey.
select distinct "ContentFormat_ID"
from public.egypt_data
order by "ContentFormat_ID";

-- 18) Sleep level validation
-- Purpose: Check sleep_level labels and inconsistent capitalization.
select distinct sleep_level
from public.egypt_data
order by sleep_level;

-- 19) Social media level validation
-- Purpose: Check social_media_level labels and nulls.
select distinct social_media_level
from public.egypt_data
order by social_media_level;

-- 20) Duplicate ID check for Egypt data
-- Purpose: Confirm that no id appears more than once.
select
    id,
    count(*) as duplicate_count
from public.egypt_data
group by id
having count(*) > 1;

-- 21) Logical validation for high_screen_low_sleep flag
-- Purpose:
-- If high_screen_low_sleep = 1, the user should not have very low screen time
-- or very high sleep hours.
select *
from public.egypt_data
where high_screen_low_sleep = 1
and (
    "daily screen time hours" = 'Less than 1 hour'
    or "sleep hour" = 'More than 8 hours'
);

-- 22) Count null social_media_level values
-- Purpose: Quantify missing values found in social_media_level.
select
    count(*) as null_social_media_level_count
from public.egypt_data
where social_media_level is null
   or trim(social_media_level) = '';
