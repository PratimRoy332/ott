SELECT * FROM jotstar_db.content_consumption

"1.Total Users & Growth Trends
What is the total number of users for LioCinema and Jotstar, and how do they compare in terms of growth trends (January–November 2024)?"

select 'jotstar' as platform, count(distinct user_id) as total_user from jotstar_db.subscribers
union all
select 'liocinema' as platform, count(distinct user_id) as total_user from liocinema_db.subscribers;

SELECT * FROM jotstar_db.subscribers;

-- 'comparision in terms of jan-nov, 2024'

select
  platform,
  count(distinct case when month(subscription_date) = 1 then user_id end) as jan,
  count(distinct case when month(subscription_date) = 2 then user_id end) as feb,
  count(distinct case when month(subscription_date) = 3 then user_id end) as mar,
  count(distinct case when month(subscription_date) = 4 then user_id end) as apr,
  count(distinct case when month(subscription_date) = 5 then user_id end) as may,
  count(distinct case when month(subscription_date) = 6 then user_id end) as jun,
  count(distinct case when month(subscription_date) = 7 then user_id end) as jul,
  count(distinct case when month(subscription_date) = 8 then user_id end) as aug,
  count(distinct case when month(subscription_date) = 9 then user_id end) as sep,
  count(distinct case when month(subscription_date) = 10 then user_id end) as oct,
  count(distinct case when month(subscription_date) = 11 then user_id end) as nov
from (
  select 'jotstar' as platform, user_id, subscription_date
  from jotstar_db.subscribers
  where year(subscription_date) = 2024

  union all

  select 'liocinema' as platform, user_id, subscription_date
  from liocinema_db.subscribers
  where year(subscription_date) = 2024
) as users_2024
-- Optional: uncomment the line below to filter months up to August
-- where month(subscription_date) between 1 and 8
group by platform;
