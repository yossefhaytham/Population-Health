-- =========================================================
-- EGYPT SURVEY DATA ANALYSIS QUERIES
-- Project: GenZ Mental Health Analysis
-- Purpose:
-- Analyze local Egyptian Gen Z survey behavior and compare it
-- with global patterns.
-- =========================================================

-- 1) CHECKING PHONE IN THE MORNING
-- Purpose: Count how many Egyptian users check their phone after waking up.
select
    "check phone morning",
    count(*) as people_count
from public.egypt_data
group by "check phone morning"
order by people_count desc;

-- 2) MOST USED APPS
-- Purpose: Identify the most commonly used apps among Egyptian participants.
select
    "top apps",
    count(*) as users_count
from public.egypt_data
group by "top apps"
order by users_count desc;

-- 3) CONTENT FORMAT VS HIGH SCREEN TIME AND LOW SLEEP
-- Purpose:
-- Identify which content format is most associated with high screen time
-- and low sleep.
-- risk_percentage = affected_users / total_users * 100
select
    "ContentFormat_ID",
    count(*) as total_users,
    sum(high_screen_low_sleep) as affected_users,
    round(avg(high_screen_low_sleep::numeric) * 100, 2) as risk_percentage
from public.egypt_data
group by "ContentFormat_ID"
order by risk_percentage desc;

-- 4) SOCIAL MEDIA LEVEL VS SLEEP LEVEL
-- Purpose: Analyze the relationship between social media usage level and sleep level.
select
    social_media_level,
    sleep_level,
    count(*) as people_count
from public.egypt_data
group by social_media_level, sleep_level
order by social_media_level, people_count desc;

-- 5) MORNING PHONE USAGE VS IRRITABILITY
-- Purpose:
-- Compare morning phone usage with reported irritability.
-- This checks whether early digital exposure is linked to mood.
select
    "check phone morning",
    "irritable recently",
    count(*) as people_count
from public.egypt_data
group by "check phone morning", "irritable recently"
order by "check phone morning", people_count desc;

-- 6) IRRITABILITY BY DOOMSCROLL CATEGORY
-- Purpose: Count irritable users in each doomscrolling category.
select
    doomscroll_category,
    count(*) as irritable_count
from public.egypt_data
where lower("irritable recently") = 'yes'
group by doomscroll_category
order by irritable_count desc;

-- 7) PHYSICAL EXERCISE DISTRIBUTION
-- Purpose: Count how many users engage in physical exercise.
select
    "physical exercise",
    count(*) as people_count
from public.egypt_data
group by "physical exercise"
order by people_count desc;

-- 8) MOST COMMON SKIP POINT
-- Purpose: Identify where users are most likely to skip content.
select
    "SkipPoint_KEY",
    count(*) as people_count
from public.egypt_data
group by "SkipPoint_KEY"
order by people_count desc;

-- 9) IRRITABLE USERS BY MORNING PHONE USAGE
-- Purpose: Count only irritable users grouped by morning phone usage.
select
    "check phone morning",
    count(*) as irritable_people
from public.egypt_data
where lower("irritable recently") = 'yes'
group by "check phone morning"
order by irritable_people desc;

-- 10) SOCIAL MEDIA HOURS BY GENDER
-- Purpose: Compare social media usage distribution between genders in Egypt survey.
select
    gender,
    "daily social media hours",
    count(*) as people_count
from public.egypt_data
group by gender, "daily social media hours"
order by gender, people_count desc;
