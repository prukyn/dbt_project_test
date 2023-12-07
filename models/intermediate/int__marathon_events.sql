with 

stg_data as (
    select *
    from {{ ref('stg__marathon_events') }}
)

, cw_user as (
    select *
    from {{ ref('_cw_user') }}
)

, transform as (
    select
        stg_data.upload_timestamp
        , stg_data.event_name
        , stg_data.gender
        , stg_data.app_user_id
        , cw_user.user_id as user_id
        , stg_data.phone_number
        , stg_data.email
        , stg_data.age
        , stg_data.webinar_title
        , stg_data.registration_date
        , stg_data.student_name
        , stg_data.id
    from stg_data
    left join cw_user on
        stg_data.app_user_id = cw_user.source_id
            and cw_user.src = 'app_db'
)

select
    *
from transform
