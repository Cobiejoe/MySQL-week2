-- how many employees with each title were born after 1965-01-01.
select distinct (t.title), count(*) as count
from titles t
inner join employees e using (emp_no)
where date(e.birth_date) >= '1965-01-01'
group by (t.title)
limit 20;

-- average salary per title.
select distinct(t.title), avg(s.salary) as "Average Salary"
from titles t
inner join salaries s using (emp_no)
group by t.title 
limit 20;

-- How much money was spent on salary for the marketing department between the years 1990 and 1992?
select d.dept_name, sum(s.salary) as "Total Money Spent on Salaries"
from salaries s
inner join dept_emp de using (emp_no)
inner join departments d using (dept_no)
where d.dept_name like "%Marketing%" and year(s.from_date) >= 1990 and year(s.to_date) <= 1992
group by d.dept_name;

