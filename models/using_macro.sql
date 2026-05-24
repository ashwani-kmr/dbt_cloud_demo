select
    -- surrogate key
    {{ generate_surrogate_key(['F_NAME','L_NAME','price']) }} as sk,

    -- full name
    {{ full_name_mco('F_NAME','M_NAME','L_NAME') }} as full_name,

    -- gender description
    {{ gender_desc('gender') }} as gender_desc,

    -- pricing
    {{ calc_final_price('price','discount') }} as final_price,

    -- revenue metrics
    {{ calc_revenue_ratio('current_revenue','previous_revenue') }} as revenue_ratio,

    {{ calc_growth_perc('current_revenue','previous_revenue') }} as growth_pct,

    -- category flags (row-level pivot)
    {{ pivot_category_flag('category', ['ELECTRONICS','HOUSEHOLD','TRANSPORT']) }}

from {{ source('src','raw_sales_data') }}