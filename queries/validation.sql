/*
=========================================================
Data validation Queries
=========================================================
*/

-- Global: Missing values in key columns
select
    count(*) as total_rows,
    count(*) - count("Screen_Time_Hours") as missing_screen_time,
    count(*) - count("Daily_Sleep_Hours") as missing_sleep_hours,
    count(*) - count("Wellbeing_Index") as missing_wellbeing,
    count(*) - count("Sleep_Risk") as missing_sleep_risk,
    count(*) - count("SM_Usage") as missing_social_media_usage
from public.global_data;

-- Global: Screen time should be between 0 and 24 hours
select * from public.global_data
where "Screen_Time_Hours" < 0
or "Screen_Time_Hours" > 24;

-- Global: Sleep hours should be between 0 and 24 hours
select * from public.global_data
where "Daily_Sleep_Hours" < 0
or "Daily_Sleep_Hours" > 24;

-- Global: Sleep risk categories should be standardized
select distinct "Sleep_Risk"
from public.global_data
order by "Sleep_Risk";

-- Global: Social media usage categories should be standardized
select distinct "SM_Usage"
from public.global_data
order by "SM_Usage";

-- Global: Duplicate ID check
select id, count(*) as duplicate_count
from public.global_data
group by id
having count(*) > 1;

-- Egypt: Missing values in key columns
select
    count(*) as total_rows,
    count(*) - count(age) as missing_age,
    count(*) - count(gender) as missing_gender,
    count(*) - count("daily screen time hours") as missing_screen_time,
    count(*) - count("sleep hour") as missing_sleep_hours,
    count(*) - count("check phone morning") as missing_morning_phone,
    count(*) - count("irritable recently") as missing_irritability,
    count(*) - count("ContentFormat_ID") as missing_content_format
from public.egypt_data;

-- Egypt: Category checks
select distinct "daily screen time hours" from public.egypt_data order by "daily screen time hours";
select distinct "sleep hour" from public.egypt_data order by "sleep hour";
select distinct "check phone morning" from public.egypt_data order by "check phone morning";
select distinct "irritable recently" from public.egypt_data order by "irritable recently";
select distinct "ContentFormat_ID" from public.egypt_data order by "ContentFormat_ID";

-- Egypt: Duplicate ID check
select id, count(*) as duplicate_count
from public.egypt_data
group by id
having count(*) > 1;

-- Egypt: Logical validation for high_screen_low_sleep flag
select * from public.egypt_data
where high_screen_low_sleep = 1
and (
    "daily screen time hours" = 'Less than 1 hour'
    or "sleep hour" = 'More than 8 hours'
);

-- Egypt: Count null social_media_level values
select count(*) as null_social_media_level_count
from public.egypt_data
where social_media_level is null
or trim(social_media_level) = '';
