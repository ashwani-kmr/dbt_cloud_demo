select * from {{ ref('stg_employee') }}
where salary < 0