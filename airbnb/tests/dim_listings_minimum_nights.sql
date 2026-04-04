SELECT *  from {{ref('dim_listings_cleansed')}}
WHERE minimum_nights < 1
LIMIT 10
/*this limit will only return 10 rows in case of failure of millions of records*/