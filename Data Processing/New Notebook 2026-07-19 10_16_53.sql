-- Databricks notebook source
select * from sp500_clean.sp500.sp500_clean;

select count(*) from sp500_clean.sp500.sp500_clean;

select distinct * from sp500_clean.sp500.sp500_clean;

select count(*),
firm
from sp500_clean.sp500.sp500_clean
group by firm
having count(*) > 1

select firm, count(*)as duplicate_count
from sp500_clean.sp500.sp500_clean
group by firm
having count(*)>1
order by duplicate_count desc;

create or replace viewsp5

