with users_data as (
    select
        *
    from {{ ref('int__users') }}
)

select
    *
from users_data
