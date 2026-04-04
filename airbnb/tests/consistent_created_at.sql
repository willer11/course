select * from {{ref('dim_listings_cleansed')}} a
inner join {{ref('fct_reviews')}} b 
USING (listing_id)
where b.review_date < a.created_at