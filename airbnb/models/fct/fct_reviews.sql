/*this first part is to specify that this table is only refreshed with new data from the source
and if the schema changes it will fail*/
{{
  config(
    materialized = 'incremental',
    on_schema_change='fail'
    )
}}
WITH src_reviews AS (
  SELECT * FROM {{ ref('src_reviews') }}
)
/* we initially had this
SELECT * FROM src_reviews
WHERE review_text is not null*/
/* Then later in the course we wanted to generate new first column containing a unique primary key, using dbt_utils.generate_surrogate_key that come from a new pacjakge installed from https://hub.getdbt.com/ ,  check the package.yml file of the project*/
SELECT
  {{ dbt_utils.generate_surrogate_key(['listing_id', 'review_date', 'reviewer_name', 'review_text']) }}
    AS review_id,
  *
  FROM src_reviews
WHERE review_text is not null 
{% if is_incremental() %}
  AND review_date > (select max(review_date) from {{ this }})
{% endif %}
/*to force recreation of this model with the schema modification, i ran 
dbt run --select fct_reviews --full-refresh*/