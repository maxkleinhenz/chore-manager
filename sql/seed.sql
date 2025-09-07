INSERT INTO chores (name)
VALUES ('Watering the plants');

INSERT INTO chores (name)
VALUES ('Cleaning coffee kitchen');

INSERT INTO chores (name)
VALUES ('Cleaning dev kitchen');

INSERT INTO chores (name)
VALUES ('Cleaning lunch room');

--

INSERT INTO employees (name)
VALUES ('Max');

INSERT INTO employees (name)
VALUES ('Philipp');

INSERT INTO employees (name)
VALUES ('Abrar');

INSERT INTO employees (name)
VALUES ('Naz');

--

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (1, 1, '2025-09-01');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (2, 2, '2025-09-01', 'done');

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (1, 1, '2025-09-07');

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (2, 2, '2025-09-07');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (3, 3, '2025-09-07', 'done');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (4, 4, '2025-09-07', 'done_by_other');

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (1, 1, '2025-09-14');

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (2, 2, '2025-09-14');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (3, 3, '2025-09-14', 'done');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (4, 4, '2025-09-14', 'done_by_other');

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (1, 1, '2025-09-21');

INSERT INTO duties (employee_id, chore_id, assigned_date)
VALUES (2, 2, '2025-09-21');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (3, 3, '2025-09-21', 'done');

INSERT INTO duties (employee_id, chore_id, assigned_date, "status")
VALUES (4, 4, '2025-09-21', 'done_by_other');