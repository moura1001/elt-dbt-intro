select
    a.name as pokemon_name,
    b.base_stat as status_value,
    c.name as status_name
from {{ source('pokemon_raw', 'pokemon') }} a
left join {{ source('pokemon_raw', 'pokemon_stats') }} b
    on a._airbyte_pokemon_hashid = b._airbyte_pokemon_hashid
left join {{ source('pokemon_raw', 'pokemon_stats_stat') }} c
    on b._airbyte_stats_hashid = c._airbyte_stats_hashid
where c.name = 'attack'
order by status_value desc