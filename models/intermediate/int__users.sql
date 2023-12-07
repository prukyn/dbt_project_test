with 

marathon_aggs as (
    select
        user_id
        , min(registration_date) as first_marathon_registration
        , count(distinct webinar_title) as u_cnt_marathons
    from {{ ref('int__marathon_events') }}
    group by 1
)

, marathon_events as (
    select distinct
        app_user_id
        , phone_number
        , email
        , age
        , gender
        , src.user_id
        , marathon_aggs.first_marathon_registration as first_marathon_registration
        , marathon_aggs.u_cnt_marathons as u_cnt_marathons
    from {{ ref('int__marathon_events') }} as src
    left join marathon_aggs on
        marathon_aggs.user_id = src.user_id
)

select
*
from marathon_events
