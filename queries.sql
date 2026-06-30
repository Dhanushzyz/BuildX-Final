SELECT 
    serial_no, 
    degree_type, 
    specialisation, 
    salary 
FROM cleaned_dataset 
WHERE placement_status = 'Placed' 
  AND work_experience = 'Yes' 
  AND salary >= 300000;

SELECT 
    degree_type, 
    COUNT(*) AS total_students,
    ROUND(AVG(salary)::numeric, 0) AS average_salary
FROM cleaned_dataset
GROUP BY degree_type;

SELECT 
    serial_no, 
    gender, 
    degree_type, 
    specialisation, 
    salary 
FROM cleaned_dataset 
ORDER BY salary DESC 
LIMIT 5;

SELECT 
    hsc_stream, 
    ROUND(AVG(mba_percentage)::numeric, 2) AS avg_mba_marks
FROM cleaned_dataset
GROUP BY hsc_stream
HAVING AVG(mba_percentage) > 60.0;

SELECT 
    serial_no, 
    degree_type, 
    employability_test_percentage, 
    placement_status
FROM cleaned_dataset
WHERE employability_test_percentage BETWEEN 70.0 AND 85.0;

SELECT 
    gender,
    COUNT(*) AS total_candidates,
    SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) AS placed_count,
    ROUND(
        ((SUM(CASE WHEN placement_status = 'Placed' THEN 1 ELSE 0 END) * 100.0) / COUNT(*))::numeric, 
        2
    ) AS placement_rate_percentage,
    ROUND(AVG(overall_academic_avg)::numeric, 2) AS avg_overall_academic_score,
    ROUND(AVG(CASE WHEN placement_status = 'Placed' THEN salary END)::numeric, 0) AS avg_active_salary
FROM cleaned_dataset
GROUP BY gender
ORDER BY placement_rate_percentage DESC;
