with

import_marathon_events as (
    select *
    from {{ source('raw', 'marathon_events') }}
)

, transform as (

    select
        timestamp_seconds(upload_timestamp) as upload_timestamp
        , event_name
        , gender
        , cast(phone_number as string) as phone_number
        , email
        , age
        , age >= 18 as is_adult
        , webinar_title
        , timestamp_millis(registration_date) as registration_date
        , name as student_name
        , id
    from import_marathon_events
)

select
    *
    , coalesce(email, '') || coalesce(phone_number, '') as app_user_id 
from transform