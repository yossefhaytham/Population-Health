/*
=========================================================
EGYPT / Servey Data Analysis Queries
=========================================================
*/

-- Q1:
-- What is Count of People checking phone morning?
select
    "check phone morning",
    count(*) as people_count
from public.egypt_data
group by "check phone morning"
order by people_count desc;

-- Q2:
-- Which apps are used the most?
select
    "top apps",
    count(*) as users_count
from public.egypt_data
group by "top apps"
order by users_count desc;

-- Q3:
-- Which content format causes high screen low sleep?
select
    "ContentFormat_ID",
    count(*) as total_users,
    sum(high_screen_low_sleep) as affected_users,
    round(avg(high_screen_low_sleep::numeric) * 100, 2) as risk_percentage
from public.egypt_data
group by "ContentFormat_ID"
order by risk_percentage desc;

-- Q4:
-- Is there a relation between social media usage level and Low sleep level?
select
    social_media_level,
    sleep_level,
    count(*) as people_count
from public.egypt_data
group by social_media_level, sleep_level
order by social_media_level, people_count desc;

-- Q5:
-- Is there a relationship between checking phone in the morning and being irritable lately?
select
    "check phone morning",
    "irritable recently",
    count(*) as people_count
from public.egypt_data
group by "check phone morning", "irritable recently"
order by "check phone morning", people_count desc;

-- Q6:
-- Count of people Irritable recently for each doom scroll group.
select
    doomscroll_category,
    count(*) as irritable_count
from public.egypt_data
where lower("irritable recently") = 'yes'
group by doomscroll_category
order by irritable_count desc;

-- Q7:
-- Which content type cause high screen time and low sleep?
select
    "ContentFormat_ID",
    count(*) as total_users,
    sum(high_screen_low_sleep) as affected_users,
    round(avg(high_screen_low_sleep::numeric) * 100, 2) as risk_percentage
from public.egypt_data
group by "ContentFormat_ID"
order by risk_percentage desc;

-- Q8:
-- How many people doing physical exercise?
select
    "physical exercise",
    count(*) as people_count
from public.egypt_data
group by "physical exercise"
order by people_count desc;

-- Q9:
-- Which skip point exists the most?
select
    "SkipPoint_KEY",
    count(*) as people_count
from public.egypt_data
group by "SkipPoint_KEY"
order by people_count desc;

-- Q10:
-- What is the Total of People irritable lately by check phone morning?
select
    "check phone morning",
    count(*) as irritable_people
from public.egypt_data
where lower("irritable recently") = 'yes'
group by "check phone morning"
order by irritable_people desc;

-- Q11:
-- What is the daily social media hours for each gender?
select
    gender,
    "daily social media hours",
    count(*) as people_count
from public.egypt_data
group by gender, "daily social media hours"
order by gender, people_count desc;
