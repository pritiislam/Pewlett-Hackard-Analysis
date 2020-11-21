--Challenge 7 

--Joining employees and titles tables
SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
LEFT JOIN titles as t
ON e.emp_no = t.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

--Use Distict with Orderby to remove duplicate rows
SELECT DISTINCT ON (re.emp_no) re.emp_no, re.first_name, re.last_name, re.title
INTO unique_titles
FROM retirement_titles as re
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles; 

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title

SELECT * FROM retiring_titles;

SELECT count, title
FROM retiring_titles
ORDER BY count DESC;

--Build Mentorship Eligibility Table 
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date, de.from_date, de.to_date, t.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01'AND '1965-12-31') 
AND de.to_date = ('9999-01-01')
ORDER BY emp_no;