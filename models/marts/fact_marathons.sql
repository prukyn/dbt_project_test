with

marathons_data as (
    select
        event_name
        , user_id
        , webinar_title
        , registration_date
    from {{ ref('int__marathon_events') }}

)

select
    *
from marathons_data
