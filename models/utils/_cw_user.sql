with

marathon_events as (
    select
        email
        , phone_number
    from {{ ref('stg__marathon_events') }}
)

, make_cw_user_id as (
    select
        md5(coalesce(email, '') || coalesce(phone_number, '')) as user_id
        , coalesce(email, '') || coalesce(phone_number, '') as source_id
        , 'app_db' as src
    from marathon_events
)

select
    *
from make_cw_user_id