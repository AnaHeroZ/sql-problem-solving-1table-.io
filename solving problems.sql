
select *
from layoffs;

-- 1. Create a copy of an existing table for the freedom to experiment with data without worrying about making irreversible changes to the original table

create table layoffs_staging
like layoffs;

select *
from layoffs_staging;

insert layoffs_staging
select *
from layoffs;

-- 2. Write a query that returns only companies of the United States

select *
from layoffs_staging
where country = 'United States';

select *
from layoffs_staging;

-- 3. Calculate the total fundraising

select sum(funds_raised_millions) from layoffs_staging;

select *
from layoffs_staging;

-- 4. Find duplicates

select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
from layoffs_staging;
with duplicate_cte as 
(
select *,
row_number() over(
partition by company, industry, total_laid_off, percentage_laid_off, 'date') as row_num
from layoffs_staging
)
select *
from duplicate_cte
where row_num > 1;

-- 5. Display the information of the companies in ascending order by their names

select *
from layoffs_staging
order by company asc;
 
-- 6. Write a query that returns financial industry companies locacated in Sao Paulo where laid offs are less than 200.

select *
from layoffs_staging
where location in ('Sao Paulo') and (industry = 'finance' and total_laid_off < 200);

-- 7. Calculate the average fundraising amount

select avg (funds_raised_millions)
from layoffs_staging;

-- 8. Find the number of companies where total laid off is more than 200.

select count(company)
from layoffs_staging
where total_laid_off > 200;

-- 9. Find the total number of companies

select count(company)
from layoffs_staging; 

-- 10. Find the number of companies located in Australia

select count(company)
from layoffs_staging
where (country = 'Australia');




































 


















