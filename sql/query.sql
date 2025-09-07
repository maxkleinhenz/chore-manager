-- name: FindDuties :many
WITH week AS (
    SELECT date('now', '-' || strftime('%w', 'now') || ' days') AS start_date,
        date(
            'now',
            '-' || strftime('%w', 'now') || ' days',
            '+7 days'
        ) AS end_date
)
SELECT employees.name AS employee_name,
    chores.id AS chore_id,
    chores.name AS chore_name,
    duties.status,
    duties.assigned_date,
    CASE
        WHEN assigned_date < week.start_date
        AND duties.status = 'pending' THEN "overdue"
        WHEN assigned_date >= week.end_date THEN "future"
        ELSE "current"
    END AS week_status
FROM duties,
    week
    INNER JOIN employees ON duties.employee_id = employees.id
    INNER JOIN chores ON duties.chore_id = chores.id
WHERE (
        -- current week
        assigned_date >= week.start_date
        AND assigned_date < week.end_date
    )
    OR (
        -- overdue
        assigned_date < week.start_date
        AND duties.status = 'pending'
    )
    OR (
        -- future
        assigned_date >= week.end_date
    )
ORDER BY duties.assigned_date,
    chores.id;